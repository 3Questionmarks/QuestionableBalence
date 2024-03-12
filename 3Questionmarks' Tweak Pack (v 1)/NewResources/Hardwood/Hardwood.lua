--[[
local iLumberYardDummy = GameInfoTypes["BUILDING_LUMBER_YARD_DUMMY"]
local iLumberYardFirst = GameInfoTypes["BUILDING_LUMBER_YARD_FIRST"]
local iLumberYardSecond = GameInfoTypes["BUILDING_LUMBER_YARD_SECOND"]
local iLumberYardThird = GameInfoTypes["BUILDING_LUMBER_YARD_THIRD"]
local iLumberYardFourth = GameInfoTypes["BUILDING_LUMBER_YARD_FOURTH"]
local iLumberYardFifth = GameInfoTypes["BUILDING_LUMBER_YARD_FIFTH"]
local iLumberYardSixth = GameInfoTypes["BUILDING_LUMBER_YARD_SIXTH"] ]]
local pLumberYardTable = {}
pLumberYardTable[0] = GameInfoTypes["BUILDING_LUMBER_YARD_DUMMY"]
pLumberYardTable[1] = GameInfoTypes["BUILDING_LUMBER_YARD_FIRST"]
pLumberYardTable[2] = GameInfoTypes["BUILDING_LUMBER_YARD_SECOND"]
pLumberYardTable[3] = GameInfoTypes["BUILDING_LUMBER_YARD_THIRD"]
pLumberYardTable[4] = GameInfoTypes["BUILDING_LUMBER_YARD_FOURTH"]
pLumberYardTable[5] = GameInfoTypes["BUILDING_LUMBER_YARD_FIFTH"]
pLumberYardTable[6] = GameInfoTypes["BUILDING_LUMBER_YARD_SIXTH"]
pLumberYardTable[7] = GameInfoTypes["BUILDING_LUMBER_YARD_SEVENTH"]
pLumberYardTable[8] = GameInfoTypes["BUILDING_LUMBER_YARD_EIGHTH"]
pLumberYardTable[9] = GameInfoTypes["BUILDING_LUMBER_YARD_NINETH"]
pLumberYardTable[10] = GameInfoTypes["BUILDING_LUMBER_YARD_TENTH"]
local iLumberYardTableLength = 11

local iFeatureForest = GameInfoTypes.FEATURE_FOREST
local iFeatureJungle = GameInfoTypes.FEATURE_JUNGLE
local iLumberMill = GameInfoTypes["IMPROVEMENT_LUMBERMILL"]     --id: 7
local iLumberYardUnit = GameInfoTypes["UNIT_LUMBER_YARD_UNIT"]  --id: 160

function CityHasLumberYard(pCity)
	for i = 1, iLumberYardTableLength-1, 1 do
		if pCity:IsHasBuilding(pLumberYardTable[i]) then
			return true	
		end
	end
	return false
	--[[
	pCity:IsHasBuilding(pLumberYardTable[1]) or pCity:IsHasBuilding(pLumberYardTable[2]) or pCity:IsHasBuilding(pLumberYardTable[3]) or pCity:IsHasBuilding(pLumberYardTable[4]) or pCity:IsHasBuilding(pLumberYardTable[5]) or pCity:IsHasBuilding(pLumberYardTable[6])]]
end

function CanBuildLumberYard(iPlayerID, iCity, iBuildingType) 
	-- Check if the city has any Forests within its radius
	if iBuildingType == pLumberYardTable[0] then
		local pCity = Players[iPlayerID]:GetCityByID(iCity)

		if CityHasLumberYard(pCity) then
			print("Non-Dummy Lumber Mill detected, aborting")
			return false
		else
			print("Looking for Lumber Mills on Forests near " .. pCity:GetName())
			for i = 0, pCity:GetNumCityPlots() - 1, 1 do
				local pPlot = pCity:GetCityIndexPlot(i)

				if (pPlot ~= nil) then
					if ((pPlot:GetFeatureType() == iFeatureForest or pPlot:GetFeatureType() == iFeatureJungle) and pPlot:GetOwner() == iPlayerID) then     
						print("Owned Forest detected")
						if pPlot:GetWorkingCity() == pCity then
							print("Plot is owned by " .. pPlot:GetWorkingCity():GetName())
							if (pPlot:GetImprovementType() == iLumberMill and not pPlot:IsImprovementPillaged()) then
								print("Lumber Mill detected")
								return true
							end
						end
					end
				end
			end
			return false
		end
	end
	return true -- Not checking for Lumber Yard Dummy, do not need to look for Forests
end
GameEvents.CityCanConstruct.Add(CanBuildLumberYard)

function SetLumberYardType(count, pCity)
	for i = 0, iLumberYardTableLength-1, 1 do
		print("First For Loop Running. i = " .. i)
	
		if count == i then
			print("If triggered. i = " .. i)
			local k = i+1

			pCity:SetNumRealBuilding(pLumberYardTable[i], 1)
			for j = 0, iLumberYardTableLength-2, 1 do
				print("Second For Loop Running. j = " .. j .. " and k = " .. k)
				
				if k > iLumberYardTableLength-1 then
					k = 0	
					print("k reset to 0")
				end
				pCity:SetNumRealBuilding(pLumberYardTable[k], 0)
				k = k+1
			end
			return
		end
	end
	--[[
	if count == 0 then
		pCity:SetNumRealBuilding(iLumberYardDummy, 1)
		pCity:SetNumRealBuilding(iLumberYardFirst, 0)
		pCity:SetNumRealBuilding(iLumberYardSecond, 0)
		pCity:SetNumRealBuilding(iLumberYardThird, 0)	
		pCity:SetNumRealBuilding(iLumberYardFourth, 0)	
		pCity:SetNumRealBuilding(iLumberYardFifth, 0)
		pCity:SetNumRealBuilding(iLumberYardSixth, 0)
	elseif count == 1 then
		pCity:SetNumRealBuilding(iLumberYardDummy, 0)
		pCity:SetNumRealBuilding(iLumberYardFirst, 1)
		pCity:SetNumRealBuilding(iLumberYardSecond, 0)
		pCity:SetNumRealBuilding(iLumberYardThird, 0)	
		pCity:SetNumRealBuilding(iLumberYardFourth, 0)
		pCity:SetNumRealBuilding(iLumberYardFifth, 0)
		pCity:SetNumRealBuilding(iLumberYardSixth, 0)		
	elseif count == 2 then
		pCity:SetNumRealBuilding(iLumberYardDummy, 0)
		pCity:SetNumRealBuilding(iLumberYardFirst, 0)
		pCity:SetNumRealBuilding(iLumberYardSecond, 1)
		pCity:SetNumRealBuilding(iLumberYardThird, 0)	
		pCity:SetNumRealBuilding(iLumberYardFourth, 0)
		pCity:SetNumRealBuilding(iLumberYardFifth, 0)
		pCity:SetNumRealBuilding(iLumberYardSixth, 0)			
	elseif count == 3 then
		pCity:SetNumRealBuilding(iLumberYardDummy, 0)
		pCity:SetNumRealBuilding(iLumberYardFirst, 0)
		pCity:SetNumRealBuilding(iLumberYardSecond, 0)
		pCity:SetNumRealBuilding(iLumberYardThird, 1)	
		pCity:SetNumRealBuilding(iLumberYardFourth, 0)
		pCity:SetNumRealBuilding(iLumberYardFifth, 0)
		pCity:SetNumRealBuilding(iLumberYardSixth, 0)			
	elseif count == 4 then
		pCity:SetNumRealBuilding(iLumberYardDummy, 0)
		pCity:SetNumRealBuilding(iLumberYardFirst, 0)
		pCity:SetNumRealBuilding(iLumberYardSecond, 0)
		pCity:SetNumRealBuilding(iLumberYardThird, 0)	
		pCity:SetNumRealBuilding(iLumberYardFourth, 1)
		pCity:SetNumRealBuilding(iLumberYardFifth, 0)
		pCity:SetNumRealBuilding(iLumberYardSixth, 0)				
	elseif count == 5 then
		pCity:SetNumRealBuilding(iLumberYardDummy, 0)
		pCity:SetNumRealBuilding(iLumberYardFirst, 0)
		pCity:SetNumRealBuilding(iLumberYardSecond, 0)
		pCity:SetNumRealBuilding(iLumberYardThird, 0)	
		pCity:SetNumRealBuilding(iLumberYardFourth, 0)
		pCity:SetNumRealBuilding(iLumberYardFifth, 1)
		pCity:SetNumRealBuilding(iLumberYardSixth, 0)					
	elseif count >= 6 then
		pCity:SetNumRealBuilding(iLumberYardDummy, 0)
		pCity:SetNumRealBuilding(iLumberYardFirst, 0)
		pCity:SetNumRealBuilding(iLumberYardSecond, 0)
		pCity:SetNumRealBuilding(iLumberYardThird, 0)	
		pCity:SetNumRealBuilding(iLumberYardFourth, 0)
		pCity:SetNumRealBuilding(iLumberYardFifth, 0)
		pCity:SetNumRealBuilding(iLumberYardSixth, 1)		
	end]]
end

function CountLumberMills(iPlayerID, pCity)
	local count = 0

	print("Looking for un-pillaged Lumber Mills on Forests near " .. pCity:GetName())
	for i = 0, pCity:GetNumCityPlots() - 1, 1 do
		local pPlot = pCity:GetCityIndexPlot(i)
		if (pPlot ~= nil) then
			if ((pPlot:GetFeatureType() == iFeatureForest or pPlot:GetFeatureType() == iFeatureJungle) and pPlot:GetOwner() == iPlayerID) then     
				print("Owned Forest detected")
				if pPlot:GetWorkingCity() == pCity then
					print("Plot is owned by " .. pPlot:GetWorkingCity():GetName())
					if (pPlot:GetImprovementType() == iLumberMill and not pPlot:IsImprovementPillaged()) then
						print("Un-pillaged Lumber Mill detected")
						count = count+1
					end
				end
			end
		end
	end	
	print("Number of un-pillaged Lumber Mills: " .. count)
	SetLumberYardType(count, pCity)
end

function OnUnitCreated(iPlayerID, iUnitID)   --iHexVec, iUnitType, iCultureType, iCivID
	--print("OnUnitCreated running...")
	local pPlayer = Players[iPlayerID]
	local pUnit = pPlayer:GetUnitByID(iUnitID)
	local iUnitType = pUnit:GetUnitType()
		
	--print("pPlayer is: " .. pPlayer:GetName())
	--print("iUnitID is: " .. iUnitID)
	--print("iUnitType is: " .. iUnitType .. " and name is: " .. pUnit:GetName())   --GameInfo.Units[iUnitType].Description
	--print("iLumberYardUnit is: " .. iLumberYardUnit)

	if iUnitType == iLumberYardUnit then
		--print("Lumber Yard Unit detected. Removing...")
		local pCity = pUnit:GetPlot():GetPlotCity()

		pUnit:Kill(false, -1)    --pUnit:doCommand(CommandTypes.COMMAND_DELETE, 1, 1)   
		--print("Lumber Yard Unit removed")
		CountLumberMills(iPlayerID, pCity)
	end
end
Events.SerialEventUnitCreated.Add(OnUnitCreated)

function CheckLumberYards(iPlayerID)
	print("CheckLumberYards running...")
	local pPlayer = Players[iPlayerID]
	
	for pCity in pPlayer:Cities() do
		if CityHasLumberYard(pCity) then
			print("Lumber Yard detected in ", pCity:GetName())
			CountLumberMills(iPlayerID, pCity)
		end
	end
end
GameEvents.PlayerDoTurn.Add(CheckLumberYards) --Runs at the beginning of everyone's turns except human players' first