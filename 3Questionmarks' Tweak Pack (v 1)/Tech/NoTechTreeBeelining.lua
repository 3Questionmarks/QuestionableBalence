-- NoTechTreeBeelining
-- Author: LeeS
-- DateCreated: 1/10/2016 9:35:33 AM
--------------------------------------------------------------
include("NoBeelineConfigurations.lua")

local bPrintDataResults = false


------------------------------------------------------------------------------------------------------------------------------------------------
--No More Tech Bee Lines
------------------------------------------------------------------------------------------------------------------------------------------------

local tImmuneTechnologies = {}
local tTechResearchedRequirements = {}
local iLookBack = math.max(1, iColumnsBackToLook)
for row in GameInfo.Technologies() do
	local iID = row.ID

	if (row.GridX < (iLookBack + 1)) or row.Disable then
		tImmuneTechnologies[iID] = Locale.ConvertTextKey(row.Description)
	else
		local iGridXSpec = row.GridX - iLookBack
		for tech in GameInfo.Technologies("GridX = '" .. iGridXSpec .. "'") do
			if not tech.Disable then
				if tTechResearchedRequirements[iID] then
					tTechResearchedRequirements[iID][tech.ID] = Locale.ConvertTextKey(tech.Description)
				else
					tTechResearchedRequirements[iID] = { [tech.ID] = Locale.ConvertTextKey(tech.Description) }
				end
			end
		end
	end
end
if bPrintDataResults then
	print(".............................................................")
	print("..........Contents of tImmuneTechnologies table is:..........")
	print(".............................................................")
	for k,v in pairs(tImmuneTechnologies) do print(k .. " = " .. v) end
	print(".............................................................")
	print("......Contents of tTechResearchedRequirements table is:......")
	print(".............................................................")
	for iTechType,tTable in pairs(tTechResearchedRequirements) do
		print("TechID: " .. iTechType .. " (" .. GameInfo.Technologies[iTechType].Type .. ") has the following added requirements from the NoTechTreeBeelineLUA:")
		for iTechID,sTechName in pairs(tTechResearchedRequirements[iTechType]) do
			print(iTechID .. "..." .. sTechName)
		end
	end
	print("...... end of date in table tTechResearchedRequirements .....")
	print(".............................................................")
end

function NoTechBeeLines(iPlayerID, iTechType)
	-- Following block permits any tech to be acquired for free when a free tech choice is available
	local pPlayer = Players[iPlayerID]
	if bAnyFreeTechs and pPlayer:GetNumFreeTechs() > 0 then
		return true
	end
	--run the tech tree beelining restrictions when a player does NOT have a free tech choice to make
	if not tImmuneTechnologies[iTechType] then
		local pTeam = Teams[pPlayer:GetTeam()]

		for iTechID,sTechName in pairs(tTechResearchedRequirements[iTechType]) do
			if not pTeam:IsHasTech(iTechID) then
				if bPrintDataResults then print("player " .. pPlayer:GetName() .. " CANNOT research tech ID# " .. iTechType .. " (" .. Locale.ConvertTextKey(GameInfo.Technologies[iTechType].Description) .. ")") end
				return false
			end
		end
	end
	if bPrintDataResults then print("player " .. pPlayer:GetName() .. " can research tech ID# " .. iTechType .. " (" .. Locale.ConvertTextKey(GameInfo.Technologies[iTechType].Description) .. ")") end
	return true
end
GameEvents.PlayerCanEverResearch.Add(NoTechBeeLines)

