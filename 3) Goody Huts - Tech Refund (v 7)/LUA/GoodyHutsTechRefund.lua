print("This is the 'Goody Huts - Tech Refund' mod script")

-- This is to circumvent a bug introduced in 1.0.3.18 that caches the HandicapInfos in "pregame"
-- and doesn't reload it for "game" after mods have updated it
local refundCache = {}
for row in DB.Query("SELECT ID, GoodyHutTechRefundPercent FROM HandicapInfos") do
  refundCache[row.ID] = row.GoodyHutTechRefundPercent
end

--
-- This function is called whenever a tech is being considered for being gifted by a Goody Hut
--
-- Don't permit a tech in column N (GridX=N) if there are any techs still to be researched in columns 1 thru N-1
--
-- Note:
--   If you want to disallow a Goody Hut from gifting the tech that is currently being researched, DON'T just return false for that tech,
--   you also need to test if that tech is the only possibly Goody Hut tech and if so, return true.
--
function OnGoodyHutCanResearch(ePlayer, eTech)
  print(string.format("OnGoodyHutCanResearch(%d, %d)", ePlayer, eTech))
  local pTeam = Teams[Players[ePlayer]:GetTeam()]

  -- Count available goody techs by GridX - this is inefficient, but is called rarely so is not worth the effort to optimise it
  local gridTechs = {}
  for tech in GameInfo.Technologies("GoodyTech=1") do
    if (pTeam:IsHasTech(tech.ID) == false) then
      gridTechs[tech.GridX] = (gridTechs[tech.GridX] or 0) + 1
    end
  end

  -- If there are any techs in prior columns, pick one of those, ie not this one!
  for i = 1, GameInfo.Technologies[eTech].GridX-1, 1 do
    if ((gridTechs[i] or 0) > 0) then
      return false
    end
  end

  return true
end
GameEvents.GoodyHutCanResearch.Add(OnGoodyHutCanResearch)

--
-- This function is called when a Goody Hut tech has been choosen, but before it is given to the player/team
-- 
-- If this is the tech we are currently researching, refund a percentage of the lost research to a dependant tech
--
function OnGoodyHutTechResearched(ePlayer, eTech)
  print(string.format("OnGoodyHutTechResearched(%d, %d)", ePlayer, eTech))
  local pPlayer = Players[ePlayer]

  if (eTech == pPlayer:GetCurrentResearch()) then 
    local pTeamTechs = Teams[pPlayer:GetTeam()]:GetTeamTechs()
    local iProgress = pTeamTechs:GetResearchProgress(eTech)
    print(string.format("Progress: %d", iProgress))

    if (iProgress > 0) then 
  	  local iRefundPercent = refundCache[Game:GetHandicapType()] or 60
      local iRefundTimes100 = iProgress * iRefundPercent
      print(string.format("Refund percent: %d - Refund beakers (*100): %d", iRefundPercent, iRefundTimes100))

      if (iRefundTimes100 > 0) then
        -- Find all the techs with this one as a pre-req
        local dependantTechs = {}
  	    for row in GameInfo.Technology_PrereqTechs("PrereqTech='" .. GameInfo.Technologies[eTech].Type .."'") do
          table.insert(dependantTechs, row.TechType)
        end

        -- Pick a random one and give it the refund
        local eRefundTech = GameInfoTypes[dependantTechs[Game.Rand(#dependantTechs, "Tech Refund")+1]]
        print(string.format("Refund Tech: %d", eRefundTech))
        pTeamTechs:ChangeResearchProgressTimes100(eRefundTech, iRefundTimes100, ePlayer)
      end
    end
  end
end
GameEvents.GoodyHutTechResearched.Add(OnGoodyHutTechResearched)
