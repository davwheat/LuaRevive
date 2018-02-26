AddEventHandler(
  "chatMessage",
  function(source, name, message)
    if string.starts(message, "/revive") then
      CancelEvent()
      -- if string.sub(message, 1, 8) ~= nil then
      --   if tonumber(string.sub(message, 9)) then
      --     if NetworkDoesNetworkIdExist(tonumber(string.sub(message, 9))) then
      --       TriggerClientEvent("reviveOther", string.sub(message, 9))
      --     else
      --       TriggerEvent("chatMessage", "Revive | ", {244, 67, 54}, "Invalid player ID")
      --     end
      --   else
      --     TriggerEvent("chatMessage", "Revive | ", {244, 67, 54}, "Invalid player ID")
      --   end
      -- else
      TriggerClientEvent("reviveSelf", source)
      -- end
    end
  end
)

function string.starts(String, Start)
  return string.sub(String, 1, string.len(Start)) == Start
end
