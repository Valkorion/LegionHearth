/*
 * Copyright (C) 2008-2015 TrinityCore <http://www.trinitycore.org/>
 *
 * This program is free software; you can redistribute it and/or modify it
 * under the terms of the GNU General Public License as published by the
 * Free Software Foundation; either version 2 of the License, or (at your
 * option) any later version.
 *
 * This program is distributed in the hope that it will be useful, but WITHOUT
 * ANY WARRANTY; without even the implied warranty of MERCHANTABILITY or
 * FITNESS FOR A PARTICULAR PURPOSE. See the GNU General Public License for
 * more details.
 *
 * You should have received a copy of the GNU General Public License along
 * with this program. If not, see <http://www.gnu.org/licenses/>.
 */

#include "Garrison.h"
#include "GameObject.h"
#include "GarrisonMgr.h"
#include "MapManager.h"

Garrison::Garrison(Player* owner) : _owner(owner), _siteLevel(nullptr), _followerActivationsRemainingToday(1)
{
}

bool Garrison::LoadFromDB(PreparedQueryResult garrison, PreparedQueryResult blueprints, PreparedQueryResult buildings)
{
    if (!garrison)
        return false;

    Field* fields = garrison->Fetch();
    _siteLevel = sGarrSiteLevelStore.LookupEntry(fields[0].GetUInt32());
    _followerActivationsRemainingToday = fields[1].GetUInt32();
    if (!_siteLevel)
        return false;

    InitializePlots();

    if (blueprints)
    {
        do
        {
            fields = blueprints->Fetch();
            if (GarrBuildingEntry const* building = sGarrBuildingStore.LookupEntry(fields[0].GetUInt32()))
                _knownBuildings.insert(building->ID);

        } while (blueprints->NextRow());
    }

    if (buildings)
    {
        do
        {
            fields = buildings->Fetch();
            uint32 plotInstanceId = fields[0].GetUInt32();
            uint32 buildingId = fields[1].GetUInt32();
            time_t timeBuilt = time_t(fields[2].GetUInt64());
            bool active = fields[3].GetBool();


            Plot* plot = GetPlot(plotInstanceId);
            if (!plot)
                continue;

            if (!sGarrBuildingStore.LookupEntry(buildingId))
                continue;

            plot->BuildingInfo.PacketInfo = boost::in_place();
            plot->BuildingInfo.PacketInfo->GarrPlotInstanceID = plotInstanceId;
            plot->BuildingInfo.PacketInfo->GarrBuildingID = buildingId;
            plot->BuildingInfo.PacketInfo->TimeBuilt = timeBuilt;
            plot->BuildingInfo.PacketInfo->Active = active;

        } while (buildings->NextRow());
    }

    return true;
}

void Garrison::SaveToDB(SQLTransaction& trans)
{
    PreparedStatement* stmt = CharacterDatabase.GetPreparedStatement(CHAR_DEL_CHARACTER_GARRISON);
    stmt->setUInt64(0, _owner->GetGUID().GetCounter());
    trans->Append(stmt);

    stmt = CharacterDatabase.GetPreparedStatement(CHAR_DEL_CHARACTER_GARRISON_BLUEPRINTS);
    stmt->setUInt64(0, _owner->GetGUID().GetCounter());
    trans->Append(stmt);

    stmt = CharacterDatabase.GetPreparedStatement(CHAR_DEL_CHARACTER_GARRISON_BUILDINGS);
    stmt->setUInt64(0, _owner->GetGUID().GetCounter());
    trans->Append(stmt);

    stmt = CharacterDatabase.GetPreparedStatement(CHAR_INS_CHARACTER_GARRISON);
    stmt->setUInt64(0, _owner->GetGUID().GetCounter());
    stmt->setUInt32(1, _siteLevel->ID);
    stmt->setUInt32(2, _followerActivationsRemainingToday);
    trans->Append(stmt);

    for (uint32 building : _knownBuildings)
    {
        stmt = CharacterDatabase.GetPreparedStatement(CHAR_INS_CHARACTER_GARRISON_BLUEPRINTS);
        stmt->setUInt64(0, _owner->GetGUID().GetCounter());
        stmt->setUInt32(1, building);
        trans->Append(stmt);
    }

    for (auto const& p : _plots)
    {
        Plot const& plot = p.second;
        if (plot.BuildingInfo.PacketInfo)
        {
            stmt = CharacterDatabase.GetPreparedStatement(CHAR_INS_CHARACTER_GARRISON_BUILDINGS);
            stmt->setUInt64(0, _owner->GetGUID().GetCounter());
            stmt->setUInt32(1, plot.BuildingInfo.PacketInfo->GarrPlotInstanceID);
            stmt->setUInt32(2, plot.BuildingInfo.PacketInfo->GarrBuildingID);
            stmt->setUInt64(3, plot.BuildingInfo.PacketInfo->TimeBuilt);
            stmt->setBool(4, plot.BuildingInfo.PacketInfo->Active);
            trans->Append(stmt);
        }
    }
}

bool Garrison::Create(uint32 garrSiteId)
{
    _siteLevel = sGarrisonMgr.GetGarrSiteLevelEntry(garrSiteId, 1);
    if (!_siteLevel)
        return false;

    InitializePlots();

    WorldPackets::Garrison::GarrisonCreateResult garrisonCreateResult;
    garrisonCreateResult.GarrSiteLevelID = _siteLevel->ID;
    _owner->SendDirectMessage(garrisonCreateResult.Write());
    _owner->SendUpdatePhasing();
    SendRemoteInfo();
    return true;
}

void Garrison::InitializePlots()
{
    if (std::vector<GarrSiteLevelPlotInstEntry const*> const* plots = sGarrisonMgr.GetGarrPlotInstForSiteLevel(_siteLevel->ID))
    {
        for (std::size_t i = 0; i < plots->size(); ++i)
        {
            uint32 garrPlotInstanceId = plots->at(i)->GarrPlotInstanceID;
            GarrPlotInstanceEntry const* plotInstance = sGarrPlotInstanceStore.LookupEntry(garrPlotInstanceId);
            GameObjectsEntry const* gameObject = sGarrisonMgr.GetPlotGameObject(_siteLevel->MapID, garrPlotInstanceId);
            if (!plotInstance || !gameObject)
                continue;

            GarrPlotEntry const* plot = sGarrPlotStore.LookupEntry(plotInstance->GarrPlotID);
            if (!plot)
                continue;

            Plot& plotInfo = _plots[garrPlotInstanceId];
            plotInfo.PacketInfo.GarrPlotInstanceID = garrPlotInstanceId;
            plotInfo.PacketInfo.PlotPos.Relocate(gameObject->Position.X, gameObject->Position.Y, gameObject->Position.Z, 2 * std::acos(gameObject->RotationW));
            plotInfo.PacketInfo.PlotType = plot->PlotType;
            plotInfo.EmptyGameObjectId = gameObject->ID;
            plotInfo.GarrSiteLevelPlotInstId = plots->at(i)->ID;
        }
    }
}

void Garrison::Upgrade()
{
}

void Garrison::Enter() const
{
    WorldLocation loc(_siteLevel->MapID);
    loc.Relocate(_owner);
    _owner->TeleportTo(loc, TELE_TO_SEAMLESS);
}

void Garrison::Leave() const
{
    if (MapEntry const* map = sMapStore.LookupEntry(_siteLevel->MapID))
    {
        WorldLocation loc(map->ParentMapID);
        loc.Relocate(_owner);
        _owner->TeleportTo(loc, TELE_TO_SEAMLESS);
    }
}

GarrisonFactionIndex Garrison::GetFaction() const
{
    return _owner->GetTeam() == HORDE ? GARRISON_FACTION_INDEX_HORDE : GARRISON_FACTION_INDEX_ALLIANCE;
}

std::vector<Garrison::Plot*> Garrison::GetPlots()
{
    std::vector<Plot*> plots;
    plots.reserve(_plots.size());
    for (auto& p : _plots)
        plots.push_back(&p.second);

    return plots;
}

Garrison::Plot* Garrison::GetPlot(uint32 garrPlotInstanceId)
{
    auto itr = _plots.find(garrPlotInstanceId);
    if (itr != _plots.end())
        return &itr->second;

    return nullptr;
}

void Garrison::LearnBlueprint(uint32 garrBuildingId)
{
    WorldPackets::Garrison::GarrisonLearnBlueprintResult learnBlueprintResult;
    learnBlueprintResult.BuildingID = garrBuildingId;
    learnBlueprintResult.Result = GARRISON_SUCCESS;

    if (!sGarrBuildingStore.LookupEntry(garrBuildingId))
        learnBlueprintResult.Result = GARRISON_ERROR_INVALID_BUILDINGID;
    else if (_knownBuildings.count(garrBuildingId))
        learnBlueprintResult.Result = GARRISON_ERROR_BLUEPRINT_KNOWN;
    else
        _knownBuildings.insert(garrBuildingId);

    _owner->SendDirectMessage(learnBlueprintResult.Write());
}

void Garrison::UnlearnBlueprint(uint32 garrBuildingId)
{
    WorldPackets::Garrison::GarrisonUnlearnBlueprintResult unlearnBlueprintResult;
    unlearnBlueprintResult.BuildingID = garrBuildingId;
    unlearnBlueprintResult.Result = GARRISON_SUCCESS;

    if (!sGarrBuildingStore.LookupEntry(garrBuildingId))
        unlearnBlueprintResult.Result = GARRISON_ERROR_INVALID_BUILDINGID;
    else if (!_knownBuildings.count(garrBuildingId))
        unlearnBlueprintResult.Result = GARRISON_ERROR_BLUEPRINT_NOT_KNOWN;
    else
        _knownBuildings.erase(garrBuildingId);

    _owner->SendDirectMessage(unlearnBlueprintResult.Write());
}

void Garrison::PlaceBuilding(uint32 garrPlotInstanceId, uint32 garrBuildingId)
{
    WorldPackets::Garrison::GarrisonPlaceBuildingResult placeBuildingResult;
    placeBuildingResult.Result = CheckBuildingPlacement(garrPlotInstanceId, garrBuildingId);
    if (placeBuildingResult.Result == GARRISON_SUCCESS)
    {
        placeBuildingResult.BuildingInfo.GarrPlotInstanceID = garrPlotInstanceId;
        placeBuildingResult.BuildingInfo.GarrBuildingID = garrBuildingId;
        placeBuildingResult.BuildingInfo.TimeBuilt = time(nullptr);

        Plot* plot = GetPlot(garrPlotInstanceId);

        if (Map* map = FindMap())
        {
            if (!plot->BuildingInfo.Guid.IsEmpty())
            {
                if (GameObject* oldBuilding = map->GetGameObject(plot->BuildingInfo.Guid))
                    oldBuilding->AddObjectToRemoveList();

                plot->BuildingInfo.Guid.Clear();
            }

            plot->BuildingInfo.PacketInfo = placeBuildingResult.BuildingInfo;
            if (GameObject* go = plot->CreateGameObject(map, GetFaction()))
            {
                map->AddToMap(go);
                GarrBuildingEntry const* building = sGarrBuildingStore.AssertEntry(garrBuildingId);
                _owner->ModifyCurrency(building->CostCurrencyID, -building->CostCurrencyAmount, false, true);
                _owner->ModifyMoney(-building->CostMoney, false);
            }
            else
                plot->BuildingInfo.PacketInfo = boost::none;
        }
    }

    _owner->SendDirectMessage(placeBuildingResult.Write());
}

void Garrison::SendInfo()
{
    WorldPackets::Garrison::GetGarrisonInfoResult garrisonInfo;
    garrisonInfo.GarrSiteID = _siteLevel->SiteID;
    garrisonInfo.GarrSiteLevelID = _siteLevel->ID;
    garrisonInfo.FactionIndex = GetFaction();
    garrisonInfo.NumFollowerActivationsRemaining = _followerActivationsRemainingToday;
    for (auto& p : _plots)
    {
        Plot& plot = p.second;
        garrisonInfo.Plots.push_back(&plot.PacketInfo);
        if (plot.BuildingInfo.PacketInfo)
            garrisonInfo.Buildings.push_back(plot.BuildingInfo.PacketInfo.get_ptr());
    }

    _owner->SendDirectMessage(garrisonInfo.Write());
}

void Garrison::SendRemoteInfo() const
{
    MapEntry const* garrisonMap = sMapStore.LookupEntry(_siteLevel->MapID);
    if (!garrisonMap || int32(_owner->GetMapId()) != garrisonMap->ParentMapID)
        return;

    WorldPackets::Garrison::GarrisonRemoteInfo remoteInfo;
    remoteInfo.Sites.resize(1);

    WorldPackets::Garrison::GarrisonRemoteSiteInfo& remoteSiteInfo = remoteInfo.Sites[0];
    remoteSiteInfo.GarrSiteLevelID = _siteLevel->ID;
    for (auto const& p : _plots)
        if (p.second.BuildingInfo.PacketInfo)
            remoteSiteInfo.Buildings.emplace_back(p.first, p.second.BuildingInfo.PacketInfo->GarrBuildingID);

    _owner->SendDirectMessage(remoteInfo.Write());
}

void Garrison::SendBlueprintAndSpecializationData()
{
    WorldPackets::Garrison::GarrisonRequestBlueprintAndSpecializationDataResult data;
    data.BlueprintsKnown = &_knownBuildings;
    _owner->SendDirectMessage(data.Write());
}

void Garrison::SendBuildingLandmarks(Player* receiver) const
{
    WorldPackets::Garrison::GarrisonBuildingLandmarks buildingLandmarks;
    buildingLandmarks.Landmarks.reserve(_plots.size());

    for (auto const& p : _plots)
    {
        Plot const& plot = p.second;
        if (plot.BuildingInfo.PacketInfo)
            if (uint32 garrBuildingPlotInstId = sGarrisonMgr.GetGarrBuildingPlotInst(plot.BuildingInfo.PacketInfo->GarrBuildingID, plot.GarrSiteLevelPlotInstId))
                buildingLandmarks.Landmarks.emplace_back(garrBuildingPlotInstId, plot.PacketInfo.PlotPos);
    }

    receiver->SendDirectMessage(buildingLandmarks.Write());
}

Map* Garrison::FindMap() const
{
    return sMapMgr->FindMap(_siteLevel->MapID, _owner->GetGUID().GetCounter());
}

GarrisonError Garrison::CheckBuildingPlacement(uint32 garrPlotInstanceId, uint32 garrBuildingId) const
{
    GarrPlotInstanceEntry const* plotInstance = sGarrPlotInstanceStore.LookupEntry(garrPlotInstanceId);
    if (!plotInstance || !_plots.count(garrPlotInstanceId))
        return GARRISON_ERROR_INVALID_PLOT;

    GarrBuildingEntry const* building = sGarrBuildingStore.LookupEntry(garrBuildingId);
    if (!building)
        return GARRISON_ERROR_INVALID_BUILDINGID;

    if (!sGarrisonMgr.IsPlotMatchingBuilding(plotInstance->GarrPlotID, garrBuildingId))
        return GARRISON_ERROR_INVALID_PLOT_BUILDING;

    if (building->Flags & GARRISON_BUILDING_FLAG_NEEDS_PLAN)
    {
        if (_knownBuildings.count(garrBuildingId))
            return GARRISON_ERROR_BLUEPRINT_NOT_KNOWN;
    }
    else // Building is built as a quest reward
        return GARRISON_ERROR_INVALID_BUILDINGID;

    // Check all plots to find if we already have this building
    GarrBuildingEntry const* existingBuilding;
    for (auto const& p : _plots)
    {
        if (p.second.BuildingInfo.PacketInfo)
        {
            existingBuilding = sGarrBuildingStore.AssertEntry(p.second.BuildingInfo.PacketInfo->GarrBuildingID);
            if (existingBuilding->Type == building->Type)
                if (p.first != garrPlotInstanceId || existingBuilding->Level != building->Level + 1)    // check if its an upgrade in same plot
                    return GARRISON_ERROR_BUILDING_EXISTS;
        }
    }

    if (!_owner->HasCurrency(building->CostCurrencyID, building->CostCurrencyAmount))
        return GARRISON_ERROR_NOT_ENOUGH_CURRENCY;

    if (!_owner->HasEnoughMoney(uint64(building->CostMoney)))
        return GARRISON_ERROR_NOT_ENOUGH_GOLD;

    return GARRISON_SUCCESS;
}

GameObject* Garrison::Plot::CreateGameObject(Map* map, GarrisonFactionIndex faction)
{
    uint32 entry = EmptyGameObjectId;
    if (BuildingInfo.PacketInfo)
    {
        GarrPlotInstanceEntry const* plotInstance = sGarrPlotInstanceStore.AssertEntry(PacketInfo.GarrPlotInstanceID);
        GarrPlotEntry const* plot = sGarrPlotStore.AssertEntry(plotInstance->GarrPlotID);
        GarrBuildingEntry const* building = sGarrBuildingStore.AssertEntry(BuildingInfo.PacketInfo->GarrBuildingID);
        if (BuildingInfo.PacketInfo->TimeBuilt + building->BuildDuration <= time(nullptr) && BuildingInfo.PacketInfo->Active)
            entry = faction == GARRISON_FACTION_INDEX_HORDE ? building->HordeGameObjectID : building->AllianceGameObjectID;
        else
            entry = faction == GARRISON_FACTION_INDEX_HORDE ? plot->HordeConstructionGameObjectID : plot->AllianceConstructionGameObjectID;
    }

    if (!sObjectMgr->GetGameObjectTemplate(entry))
    {
        TC_LOG_ERROR("garrison", "Garrison attempted to spawn gameobject whose template doesn't exist (%u)", entry);
        return nullptr;
    }

    Position const& pos = PacketInfo.PlotPos;
    GameObject* go = new GameObject();
    if (!go->Create(map->GenerateLowGuid<HighGuid::GameObject>(), entry, map, 0, pos.GetPositionX(), pos.GetPositionY(), pos.GetPositionZ(), pos.GetOrientation(),
        0.0f, 0.0f, 0.0f, 0.0f, 0, GO_STATE_ACTIVE))
    {
        delete go;
        return nullptr;
    }

    BuildingInfo.Guid = go->GetGUID();
    return go;
}