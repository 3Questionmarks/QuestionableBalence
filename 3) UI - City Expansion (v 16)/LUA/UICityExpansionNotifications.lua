-- If "UI - Notification Options" is also in use ...
-- ... switch the custom City Tile notification off
local queries = {{key = "CITY_NOTIFICATIONS_TILE"}}
LuaEvents.NotificationOptionsQuery(queries)
if (queries[1] and queries[1].id) then
  queries[1].show = false
  queries[1].ui = false
  LuaEvents.CustomNotificationAddin(queries[1])
end

-- ... switch the standard City Tile notification back on
LuaEvents.CustomNotificationAddin({id=NotificationTypes.NOTIFICATION_CITY_TILE, show=true, ui=true})
