-- UA_Initialize
-- Author: FramedArchitecture
-- DateCreated: 5/1/2014
--------------------------------------------------------------------
include("UA_Functions.lua")
--------------------------------------------------------------------
local bExpansion = g_IsBNW or g_IsGnK
--------------------------------------------------------------------
function Initialize()
	for row in GameInfo.Traits() do
		if row.LuaToInclude then
			local bInclude = true
			if row.RequiresExpansion and not bExpansion then 
				bInclude = false 
			end
			if bInclude then
				include(row.LuaToInclude)
			end
		end
	end
end
--------------------------------------------------------------------
Initialize();