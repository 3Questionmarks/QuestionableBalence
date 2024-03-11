-- C15_Kalle_Mountain
-- Author: Chrisy15
-- DateCreated: 1/4/2016 8:32:44 PM
--------------------------------------------------------------

print("Kalle Mountain Function is working!")

--==========================================================================================================================
-- JFD_IsCivilisationActive
--------------------------------------------------------------
function JFD_IsCivilisationActive(civilisationID)
	for iSlot = 0, GameDefines.MAX_MAJOR_CIVS-1, 1 do
		local slotStatus = PreGame.GetSlotStatus(iSlot)
		if (slotStatus == SlotStatus["SS_TAKEN"] or slotStatus == SlotStatus["SS_COMPUTER"]) then
			if PreGame.GetCivilization(iSlot) == civilisationID then
				return true
			end
		end
	end

	return false
end

local activePlayerID = Game.GetActivePlayer()
local activePlayer = Players[activePlayerID]
local civilisationID = GameInfoTypes["CIVILIZATION_CL_AFGHANISTAN"]
local isCLAfghanistanActive	= JFD_IsCivilisationActive(civilisationID)
local tMountain = PlotTypes.PLOT_MOUNTAIN
local tKalle = GameInfoTypes["IMPROVEMENT_CL_KALLE"]
local tC15Kalle = GameInfoTypes["IMPROVEMENT_C15_KALLE_MOUNTAIN"]
local bWritersGuild = GameInfoTypes.BUILDING_WRITERS_GUILD
local sWriter = GameInfo.Specialists.SPECIALIST_WRITER.ID
local pAfghanMountaineers = GameInfoTypes.PROMOTION_AFGHANMOUNTINEERS

--Plot Iterators
include("PlotIterators")

function C15_Kalle_Mountain(playerID, x, y, improvementID)
	local pPlayer = Players[playerID]
	if (pPlayer:IsAlive() and pPlayer:GetCivilizationType() == civilisationID) then
		local pPlot = Map.GetPlot(x, y)
		local improvementID = pPlot:GetImprovementType()
		if improvementID == tKalle then
			for pEdgePlot in PlotRingIterator(pPlot, 1) do
				if pEdgePlot:GetPlotType() == tMountain then
					pPlot:SetImprovementType(tC15Kalle)
				end
			end
		end
	end
end

if isCLAfghanistanActive then
	GameEvents.BuildFinished.Add(C15_Kalle_Mountain)
	print("Kalle Mountain added!")
end

-- KalleGreatWriterPoints for the dummy Kalle

function C15_KalleGreatWriterPointsII(iPlayer, iUnit)
	local pPlayer = Players[iPlayer]
	if (pPlayer:GetCivilizationType() == civilisationID) then
		local pUnit = pPlayer:GetUnitByID(iUnit)
		local pPlot = pUnit:GetPlot()
		local KalleWriterPoints = 0
		--print("Unit Type is " .. pUnit:GetUnitType())
		if (pPlayer:IsAlive()) then
			if pPlot ~= nil then
				if (pPlot:GetImprovementType() == tC15Kalle) then
					--print("Got this far")
					if (pUnit:GetUnitType() == GameInfoTypes.UNITCLASS_CARAVAN) then
						KalleWriterPoints = KalleWriterPoints + 200
						local pCapital = pPlayer:GetCapitalCity()
						local AwardCity = pCapital
						for pCity in pPlayer:Cities() do
							if pCity:IsHasBuilding(bWritersGuild) then
								AwardCity = pCity
							end
						end
						AwardCity:ChangeSpecialistGreatPersonProgressTimes100(sWriter, KalleWriterPoints)
						--print(KalleWriterPoints .. " Points Awarded to Capital")
						if AwardCity ~= pCapital then
							local CapProgress = ((pCapital:GetSpecialistGreatPersonProgress(sWriter)) * 100)
							pCapital:ChangeSpecialistGreatPersonProgressTimes100(sWriter, -CapProgress)	
							AwardCity:ChangeSpecialistGreatPersonProgressTimes100(sWriter, CapProgress)
							--print(KalleWriterPoints .. " Points Awarded.")
						end
					end
				end
			end
		end
	end
end

if isCLAfghanistanActive then
	GameEvents.UnitSetXY.Add(C15_KalleGreatWriterPointsII)
	print("Afghan Kalle GW Points MKII Added")
end

function C15_Afghanistan_Unit_Mountain_Combat(iPlayer, iUnit) --Because of the way Neirai added the original function, I can't remove it, so you'll have to remove it manually
	local pPlayer = Players[iPlayer]
	local bIsMountain = 0
	if (pPlayer:GetCivilizationType() == civilisationID) then
		local pUnit = pPlayer:GetUnitByID(iUnit)
		local pPlot = pUnit:GetPlot()
		if pUnit:GetDomainType() == DomainTypes.DOMAIN_LAND then
			if pUnit:IsCombatUnit() then
				for pEdgePlot in PlotRingIterator(pPlot, 1) do
					if pEdgePlot:GetPlotType() == tMountain then
						bIsMountain = 1
					end
				end
				if bIsMountain == 1 then
					pUnit:SetHasPromotion(pAfghanMountaineers, true)
				else
					pUnit:SetHasPromotion(pAfghanMountaineers, false)
				end
			end
		end
	end
end

--[[if isCLAfghanistanActive then
	GameEvents.UnitSetXY.Add(C15_Afghanistan_Unit_Mountain_Combat)
	print("Afghan Unit Combat Mountain added!")
end]]

