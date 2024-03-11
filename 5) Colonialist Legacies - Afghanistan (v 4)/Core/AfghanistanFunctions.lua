
print ("Viregel il y n'a pas un problem")

--KalleGreatWriterPoints

local bWritersGuild = GameInfoTypes.BUILDING_WRITERS_GUILD
local sWriter = GameInfo.Specialists.SPECIALIST_WRITER.ID

GameEvents.PlayerDoTurn.Add(
function(iPlayer)
	local pPlayer = Players[iPlayer]
	if (pPlayer:IsAlive()) then
		if (pPlayer:GetCivilizationType() == GameInfoTypes.CIVILIZATION_CL_AFGHANISTAN) then
			local TradeWriter = 0
			local tTradeRoutes = pPlayer:GetTradeRoutes()
			for i,v in pairs(tTradeRoutes) do
				print("tTradeRoutes exists")
				if v.FromID == iPlayer then
					print("FromID worked")
					if v.Domain == DomainTypes.DOMAIN_LAND then
						print("Domain worked")
						TradeWriter = TradeWriter + 300
						print("Land trade route found")
					end
				end
			end
			local pCapital = pPlayer:GetCapitalCity()
			local AwardCity = pCapital
			for pCity in pPlayer:Cities() do
				if pCity:IsHasBuilding(bWritersGuild) then
					AwardCity = pCity
				end
			end
			AwardCity:ChangeSpecialistGreatPersonProgressTimes100(sWriter, TradeWriter)
			print(TradeWriter .. " Points Awarded to Capital")
			if AwardCity ~= pCapital then
				local CapProgress = ((pCapital:GetSpecialistGreatPersonProgress(sWriter)) * 100)
				pCapital:ChangeSpecialistGreatPersonProgressTimes100(sWriter, -CapProgress)	
				AwardCity:ChangeSpecialistGreatPersonProgressTimes100(sWriter, CapProgress)
				print(TradeWriter .. " Points Awarded.")
			end
		end
	end
end)

-- KalleGreatWriterPoints


GameEvents.UnitSetXY.Add(
function(iPlayer, iUnit)
	local pPlayer = Players[iPlayer]
	if (pPlayer:GetCivilizationType() == GameInfoTypes.CIVILIZATION_CL_AFGHANISTAN) then
		local pUnit = pPlayer:GetUnitByID(iUnit)
		local pPlot = pUnit:GetPlot()
		local KalleWriterPoints = 0
		print("Unit Type is " .. pUnit:GetUnitType())
		if (pPlayer:IsAlive()) then
			if pPlot ~= nil then
				if (pPlot:GetImprovementType() == GameInfoTypes.IMPROVEMENT_CL_KALLE) then
					print("Got this far")
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
						print(KalleWriterPoints .. " Points Awarded to Capital")
						if AwardCity ~= pCapital then
							local CapProgress = ((pCapital:GetSpecialistGreatPersonProgress(sWriter)) * 100)
							pCapital:ChangeSpecialistGreatPersonProgressTimes100(sWriter, -CapProgress)	
							AwardCity:ChangeSpecialistGreatPersonProgressTimes100(sWriter, CapProgress)
							print(KalleWriterPoints .. " Points Awarded.")
						end
					end
				end
			end
		end
	end
end)

local function CheckForMountains(plot)
	for i = 0, 1 do
		local NeiraiHP = Map.PlotDirection(plot:GetX(), plot:GetY(), i);
		print(NeiraiHP)
		if NeiraiHP ~= nil then
			print("Checking for Mountains")
			if NeiraiHP:IsMountain() then
				print("This should return true")
				return true
			end
		end
	end	
	return false
end