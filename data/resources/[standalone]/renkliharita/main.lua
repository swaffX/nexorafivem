-- Viceroy
Citizen.CreateThread(function()
  RequestIpl("gabz_pillbox_milo_")
  RequestIpl("gabz_pillbox_2_milo_")

  local interiorID = GetInteriorAtCoords(311.2546, -592.4204, 42.32737)

  if IsValidInterior(interiorID) then
    RemoveIpl("rc12b_fixed")
    RemoveIpl("rc12b_destroyed")
    RemoveIpl("rc12b_default")
    RemoveIpl("rc12b_hospitalinterior_lod")
    RemoveIpl("rc12b_hospitalinterior")
    RefreshInterior(interiorID)
  end
end)

-- Minimap
Citizen.CreateThread(function()
  SetMapZoomDataLevel(0, 0.96, 0.9, 0.08, 0.0, 0.0)
  SetMapZoomDataLevel(1, 1.6, 0.9, 0.08, 0.0, 0.0)
  SetMapZoomDataLevel(2, 8.6, 0.9, 0.08, 0.0, 0.0)
  SetMapZoomDataLevel(3, 12.3, 0.9, 0.08, 0.0, 0.0)
  SetMapZoomDataLevel(4, 22.3, 0.9, 0.08, 0.0, 0.0)
end)

Citizen.CreateThread(function()
  while true do
  Citizen.Wait(1)
  if IsPedOnFoot(GetPlayerPed(-1)) then 
    SetRadarZoom(1100)
  elseif IsPedInAnyVehicle(GetPlayerPed(-1), true) then
    SetRadarZoom(1100)
  end
  end
end)