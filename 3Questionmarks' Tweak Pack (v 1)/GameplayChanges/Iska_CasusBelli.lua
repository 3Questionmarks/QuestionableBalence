GameEvents.GetWarmongerPenaltyModifier.Add(function(eConquerorPlayer, eConqueredPlayer)
	local pConquerorPlayer, pConqueredPlayer = Players[eConquerorPlayer], Players[eConqueredPlayer]
	local eIdeology1, eIdeology2 = pConqueredPlayer:GetLateGamePolicyTree(), pConquerorPlayer:GetLateGamePolicyTree()
	local bReconquest
	for pCity in pConqueredPlayer:Cities() do
		if pCity:GetOriginalOwner() == eConquerorPlayer then bReconquest = true end
	end
	if (eIdeology1 ~= eIdeology2) and (eIdeology1) and (eIdeology1 ~= -1) and (eIdeology2) and (eIdeology2 ~= -1) then
		return 0.25
	elseif pConquerorPlayer:GetReligionCreatedByPlayer() ~= -1 and pConqueredPlayer:GetReligionCreatedByPlayer() ~= -1 and not pConquerorPlayer:HasPolicy(GameInfoTypes["POLICY_SECULARISM"]) then
		return 0.33
	elseif (eIdeology2) and (eIdeology2 ~= -1) and Map.PlotDistance(pConquerorPlayer:GetCapitalCity():GetX(), pConquerorPlayer:GetCapitalCity():GetY(), pConqueredPlayer:GetCapitalCity():GetX(), pConqueredPlayer:GetCapitalCity():GetY()) <= 20 then
		return 0.5
	elseif (pConquerorPlayer:GetCurrentEra() >= (pConqueredPlayer:GetCurrentEra() + 2)) then
		return 0.5
	elseif pConqueredPlayer:IsHasPlayerBulliedProtectedMinor(eConquerorPlayer) then
		return 0.66
	elseif bReconquest then
		return 0.66
	elseif (pConquerorPlayer:GetDenouncedPlayerCounter(eConqueredPlayer) >= 5) or (Players[eConqueredPlayer]:GetDenouncedPlayerCounter(eConquerorPlayer) >= 5) 
	or pConquerorPlayer:GetTurnLastPledgeBrokenByMajor(eConqueredPlayer) >= 5 then
		return 0.75
	end
	return 1
end)

local bDidPop
Events.WarStateChanged.Add(function(eTeam1, eTeam2, bWar)
	if not bWar then return end
	if bDidPop then bDidPop = not bDidPop return end
	bDidPop = true

	local pActivePlayer = Players[Game.GetActivePlayer()]
	local eActiveTeam = pActivePlayer:GetTeam()
	local pActiveTeam = Teams[eActiveTeam]
	if eActiveTeam == eTeam1 or eTeam1 == eTeam2 then return end
	if not pActiveTeam:IsHasMet(eTeam1) and not pActiveTeam:IsHasMet(eTeam2) and pActivePlayer:GetCapitalCity() then return end

	local strWarType = "Surprise War"
	local pConquerorPlayer, pConqueredPlayer = Players[Teams[eTeam1]:GetLeaderID()], Players[Teams[eTeam2]:GetLeaderID()]
	if (not pConquerorPlayer) or (not pConqueredPlayer) then return end
	if (pConquerorPlayer:IsMinorCiv()) or (pConqueredPlayer:IsMinorCiv()) then return end
	local eConquerorPlayer, eConqueredPlayer = Teams[eTeam1]:GetLeaderID(), Teams[eTeam2]:GetLeaderID()
	local eIdeology1, eIdeology2 = pConqueredPlayer:GetLateGamePolicyTree(), pConquerorPlayer:GetLateGamePolicyTree()
	local bReconquest
	for pCity in pConqueredPlayer:Cities() do
		if pCity:GetOriginalOwner() == pConquerorPlayer:GetID() then bReconquest = true break end
	end
	local bDistance
	if pConquerorPlayer:GetCapitalCity() and pConqueredPlayer:GetCapitalCity() then
		bDistance = Map.PlotDistance(pConquerorPlayer:GetCapitalCity():GetX(), pConquerorPlayer:GetCapitalCity():GetY(), pConqueredPlayer:GetCapitalCity():GetX(), pConqueredPlayer:GetCapitalCity():GetY()) <= 20
	end

	if (eIdeology1 ~= eIdeology2) and (eIdeology1) and (eIdeology1 ~= -1) then
		strWarType = "Ideological War"
	elseif pConquerorPlayer:GetReligionCreatedByPlayer() ~= -1 and pConqueredPlayer:GetReligionCreatedByPlayer() ~= -1 and not pConquerorPlayer:HasPolicy(GameInfoTypes["POLICY_SECULARIZED"]) then
		strWarType = "Holy War"
	elseif (eIdeology) and (eIdeology ~= -1) and bDistance then
		strWarType = "Territorial War"
	elseif (pConquerorPlayer:GetCurrentEra() > (pConqueredPlayer:GetCurrentEra() + 2)) then
		strWarType = "Colonial War"
	elseif pConqueredPlayer:IsHasPlayerBulliedProtectedMinor(eConquerorPlayer) then
		strWarType = "Protectorate War"
	elseif bReconquest then
		strWarType = "Reconquest War"
	elseif (pConquerorPlayer:GetDenouncedPlayerCounter(eConqueredPlayer) >= 5) or (Players[eConqueredPlayer]:GetDenouncedPlayerCounter(eConquerorPlayer) >= 5) 
	or pConquerorPlayer:GetTurnLastPledgeBrokenByMajor(eConqueredPlayer) >= 5 then
		strWarType = "Formal War"
	end
	
	pActivePlayer:AddNotification(NotificationTypes["NOTIFICATION_DIPLOMACY_DECLARATION"], pConquerorPlayer:GetName() .. " has declared a " .. strWarType .. " on " .. pConqueredPlayer:GetName() .. ".", strWarType .. "!", -1, -1)
end)