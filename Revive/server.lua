AddEventHandler(
  "chatMessage",
  function(source, name, message)
    if string.starts(message, "/revive") then
      CancelEvent()
      if string.sub(message, 1, 8) ~= nil then
        TriggerClientEvent("reviveOther", string.sub(message, 9))
      else
      TriggerClientEvent("reviveSelf", source)
      end
    end
  end
)

function string.starts(String, Start)
  return string.sub(String, 1, string.len(Start)) == Start
end
