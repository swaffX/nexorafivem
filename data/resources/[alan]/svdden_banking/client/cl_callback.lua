-- svdden_banking: Client callback helpers
-- Provides Callbacks.Await(name, ...) -> first result, and Callbacks.Callback(name, handler, ...)
-- Keeps original behavior: server event "__svBanking:callback:" .. name, promise-based await, and handler execution

local _Callbacks = {}
local registeredEvents = {}
local pendingPromises = {}

local function ensureCallbackEvent(name)
  local eventName = "__svBanking:callback:" .. name
  if registeredEvents[eventName] then
    return eventName
  end

  registeredEvents[eventName] = true
  RegisterNetEvent(eventName, function(result)
    local pending = pendingPromises[eventName]
    if not pending then return end
    pendingPromises[eventName] = nil
    pending:resolve(result)
  end)

  return eventName
end

function _Callbacks.Await(name, ...)
  local eventName = ensureCallbackEvent(name)
  local p = promise.new()
  pendingPromises[eventName] = p
  TriggerServerEvent(eventName, ...)
  return Citizen.Await(p)
end

function _Callbacks.Callback(name, handler, ...)
  local result = _Callbacks.Await(name, ...)
  return handler(result)
end

Callbacks = _Callbacks
