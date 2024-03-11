-- Air Recon
-- Author: Labby
-- DateCreated: 7/18/2014 10:11:10 PM
--------------------------------------------------------------
include("FLuaVector.lua")
function InputHandler( uiMsg, wParam, lParam )
	local interfaceMode = UI.GetInterfaceMode()
	if interfaceMode == InterfaceModeTypes.INTERFACEMODE_AIR_SWEEP then
		local pSelUnit = UI.GetHeadSelectedUnit()
		local selUnitPlot = pSelUnit:GetPlot()
		local selX = selUnitPlot:GetX()
		local selY = selUnitPlot:GetY()
		local range = pSelUnit:Range()
		if uiMsg == MouseEvents.LButtonUp then
			local pPlot = Map.GetPlot(UI.GetMouseOverHex())
			if pPlot ~= nil then
				local pX = pPlot:GetX()
				local pY = pPlot:GetY()
				local distance = Map.PlotDistance(selX,selY,pX,pY)
				if distance <= range then
					pSelUnit:SetReconPlot(pPlot)
				end
			end
		end
	end
end
function AirSweepHighlight()
	local interfaceMode = UI.GetInterfaceMode()
	if interfaceMode == InterfaceModeTypes.INTERFACEMODE_AIR_SWEEP then
		local pSelUnit = UI.GetHeadSelectedUnit()
		local selUnitPlot = pSelUnit:GetPlot()
		local selX = selUnitPlot:GetX()
		local selY = selUnitPlot:GetY()
		local range = pSelUnit:Range()
		for x = -range,range do
			for y = -range,range do
				local tPlot = Map.GetPlotXY(selX,selY,x,y)
				if tPlot ~= nil then
					local tX = tPlot:GetX()
					local tY = tPlot:GetY()
					local tdist = Map.PlotDistance(selX,selY,tX,tY)
					if tdist <= range then
						local hex = ToHexFromGrid(Vector2(tX,tY))
						Events.SerialEventHexHighlight(hex,true,Vector4(0.7,0.7,0,1),"MovementRangeBorder")
					end
				end
			end
		end
	end
end
Events.InterfaceModeChanged.Add(AirSweepHighlight)
ContextPtr:SetInputHandler(InputHandler)