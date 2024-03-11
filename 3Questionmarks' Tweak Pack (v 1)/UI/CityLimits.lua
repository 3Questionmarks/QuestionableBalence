include('FLuaVector');

cityPlots = {};
inCityScreen = false;
mouseCity = false;

function OnEnterCityScreen()
	--print('EnterCityScreen');
	inCityScreen = true;
	
	ClearTables();
	HideCityLimits();
	
	ShowAllCityLimits(UI.GetHeadSelectedCity():Plot(), UI.GetHeadSelectedCity(), true); -- Used to build up and show overlaps in city view
	ShowCityLimits(nil, false, nil, true, true);
end
Events.SerialEventEnterCityScreen.Add(OnEnterCityScreen);

function OnExitCityScreen()
	--print('ExitCityScreen');
	inCityScreen = false;

	HideCityLimits();
	ClearTables();
end
Events.SerialEventExitCityScreen.Add(OnExitCityScreen);

function OnSelectUnit(playerID, unitID)
	--print('SelectUnit');
	HideCityLimits();
	ClearTables();
	
	UpdateCityLimits(playerID, unitID);
end
Events.UnitSelectionChanged.Add(OnSelectUnit);

function OnUnitMoveHex(playerID, unitID)
	--print('UnitMoveHex');
	HideCityLimits();
	ClearTables();

	UpdateCityLimits(playerID, unitID);
end
Events.SerialEventUnitMoveToHexes.Add(OnUnitMoveHex);

function OnUnitMoveTele(i, j, playerID, unitID)
	--print('UnitMoveTele');
	HideCityLimits();
	ClearTables();

	UpdateCityLimits(playerID, unitID);
end
Events.SerialEventUnitTeleportedToHex.Add(OnUnitMoveTele);

function MouseOverHex(hexX, hexY)
	--print('MouseOverhex');
	if inCityScreen == true then
		--print('InCityScreen-CancelUpdate');
		--OnEnterCityScreen(); -- Fix for not showing hex's when you had a unit selected
		return;
	end
	local  plot = Map.GetPlot(hexX, hexY);
	if (plot ~= nil and plot:IsCity() ) then
		mouseCity = true;
		ClearTables();
		HideCityLimits();
	
		ShowAllCityLimits(plot, plot:GetPlotCity(), false); -- Used to build up and show overlaps in city view
		ShowCityLimits(plot:GetPlotCity(), false, nil, true, true);
	elseif mouseCity == true then
		mouseCity = false;
		HideCityLimits();
	end
end
Events.SerialEventMouseOverHex.Add(MouseOverHex)

function UpdateCityLimits(playerID, unitID)
	if inCityScreen == true then
		--print('InCityScreen-CancelUpdate');
		OnEnterCityScreen(); -- Fix for not showing hex's when you had a unit selected
		return;
	end
	if playerID then
		local unit = nil;
		if Players[playerID]:IsHuman() then unit = Players[playerID]:GetUnitByID(unitID) end
		if unit then
  			--if (unit:GetUnitType() == GameInfoTypes['UNIT_SETTLER']) then
			-- The following are used to get and check for any unit that can found cities. Thanks whoward69
			if (unit:IsFound() or GameInfo.Units[unit:GetUnitType()].FoundAbroad) then
				ShowAllCityLimits(unit:GetPlot());
				ShowCityLimits(nil, false, nil, true, true);
			end
		end
	end
end
 -- Nodisplay is used to prevent showing so the table can be built for city view overlaps
function ShowCityLimits(city, noDisplay, ignoreCity, checkCityOverlap, noInsert)
	local pCity = UI.GetHeadSelectedCity();
	local pUnit = UI.GetHeadSelectedUnit();
	
	--local iWorkDistance = 3;
	local iWorkDistance;
	local pPlayer;
	local thisPlot = nil;
	local thisX;
	local thisY;
	local isCity = 0;

	if city ~= nil then
		if ignoreCity ~= nil and ignoreCity == city  then -- This is used to ignore the current city for displaying overlaps in city view
			return;
		end
		pCity = city;
	end
	if pCity and UI.GetInterfaceMode() ~= InterfaceModeTypes.INTERFACEMODE_CITY_RANGE_ATTACK then
		-- The following are used to get dynamic city limit size incase of mods. Thanks whoward69
		pPlayer = Players[pCity:GetOwner()];
		iWorkDistance =  pPlayer.GetWorkPlotDistance and pPlayer:GetWorkPlotDistance() or 3;

		thisPlot = pCity:Plot();
		thisX = pCity:GetX();
		thisY = pCity:GetY();
		isCity = 1;
	elseif pUnit then
		-- The following are used to get dynamic city limit size incase of mods. Thanks whoward69
		pPlayer = Players[pUnit:GetOwner()];
		iWorkDistance =pPlayer.GetWorkPlotDistance and pPlayer:GetWorkPlotDistance() or 3;

		thisPlot = pUnit:GetPlot();
		thisX = pUnit:GetX();
		thisY = pUnit:GetY();
	end
	if thisPlot then
		for iDX = -iWorkDistance, iWorkDistance do
			for iDY = -iWorkDistance, iWorkDistance do
				local pTargetPlot = Map.GetPlotXY(thisX, thisY, iDX, iDY);

				if pTargetPlot then
					local plotX = pTargetPlot:GetX();
					local plotY = pTargetPlot:GetY();
					local plotDistance = Map.PlotDistance(thisX, thisY, plotX, plotY);
					
					if plotDistance <= iWorkDistance then
						local hexID = ToHexFromGrid( Vector2( plotX, plotY) );
						
						if noInsert ~= true then
							table.insert(cityPlots, pTargetPlot);
						end
						
						if isCity == 1 and noDisplay ~= true then
							if checkCityOverlap == true then
								CheckOverlaps(pTargetPlot);
							end
							Events.SerialEventHexHighlight(hexID, true, Color(1, 0, 1, 1), 'MovementRangeBorder'); -- Color doesn't matter
						elseif noDisplay ~= true then
							if checkCityOverlap == true then
								CheckOverlaps(pTargetPlot);
							end
							Events.SerialEventHexHighlight(hexID, true, Color(1, 0, 1, 1), 'GroupBorder'); -- Color doesn't matter
						end
					end
				end
			end
		end
	end
end

function HideCityLimits()
	--Events.ClearHexHighlights();
	Events.ClearHexHighlightStyle('MovementRangeBorder');
	Events.ClearHexHighlightStyle('GroupBorder');
	Events.ClearHexHighlightStyle('ValidFireTargetBorder');
end

function ShowAllCityLimits(plot, ignoreCity, noDisplay)
	local centerX = plot:GetX();
	local centerY = plot:GetY();
	local iWorkDistance;
	local maxOverlapDistance;
	for id, player in pairs(Players) do
		if player:IsEverAlive() then
			--print(id, player:GetName())
			iWorkDistance =  player.GetWorkPlotDistance and player:GetWorkPlotDistance() or 3;
			maxOverlapDistance = iWorkDistance * 4;
			for pCity in player:Cities() do
				local dist = Map.PlotDistance(centerX,centerY,pCity:GetX(),pCity:GetY());
				if dist <= maxOverlapDistance then
					ShowCityLimits(pCity, noDisplay, ignoreCity);
				end
			end
		end
	end
end

function CheckOverlaps(plot)
	for i, tmpPlot in ipairs(cityPlots) do
		if tmpPlot == plot then
			local hexID = ToHexFromGrid( Vector2( plot:GetX(), plot:GetY()) );
			Events.SerialEventHexHighlight(hexID, true, Color(1, 0, 1, 1), 'ValidFireTargetBorder'); -- Color doesn't matter
			break;
		end
	end
end

function ClearTables()
	cityPlots = {};
end