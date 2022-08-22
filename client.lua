  lib.locale()
    ESX = exports['es_extended']:getSharedObject()
    local pokrenuo = false
    ------------------------------------------------
    
    CreateThread(function ()
      while true do
          Wait(0)
          local distance = GetDistanceBetweenCoords(GetEntityCoords(PlayerPedId()), vector3(-569.197, -165.852, 38.029), true)
    
          local letSleep = true
          if distance < 8.0 and pokrenuo == true then
              DrawText3Ds(-569.197, -165.852, 38.029, 'Istovarite kutiju ~b~(E)')      
              letSleep = false
        if distance < 3.0 and pokrenuo == true then
                if IsControlJustPressed(0, 38) then
                  ESX.Game.DeleteObject(GetClosestObjectOfType(GetEntityCoords(PlayerPedId()), 5.0, `prop_box_wood01a`, false, false, false))
                  RemoveBlip(blip2)
                  TriggerServerEvent('dajsve')
                  lib.notify({ description = 'Istovarili ste kutiju, vozite na oznacenu lokaciju' })
                  nazad()
                end
        end
    
          end
          if letSleep then
              Citizen.Wait(1000)
          end
      end
    end)
    
    CreateThread(function ()
      while true do
          Wait(0)
          local distance = GetDistanceBetweenCoords(GetEntityCoords(PlayerPedId()), vector3(1739.521, -1605.42, 112.49), true)
          local letSleep = true
          if distance < 8.0 and pokrenuo == false then
              DrawText3Ds(1739.521, -1605.42, 112.49, 'Pokrenite posao ~b~(E)')      
              letSleep = false
        if distance < 3.0 and pokrenuo == false then
                if IsControlJustPressed(0, 38) then
                  DoScreenFadeOut(10)
                lib.progressCircle({
                  duration = 30000,
                  useWhileDead = false,
                  canCancel = false,
                  label = 'Utovaranje kutije',
                  disable = {
                      move = true,
                      car = true,
                      combat = true,
                  },
                })
                DoScreenFadeIn(10)
                ESX.Game.SpawnVehicle('bison', vector3(1725.894, -1605.86, 112.49), 192.027, function(vozilo)
                TaskWarpPedIntoVehicle(PlayerPedId(), vozilo, -1)
                local vehicle = GetVehiclePedIsIn(PlayerPedId(), true)
                local gepek = GetOffsetFromEntityInWorldCoords(vozilo, 0, 5, 0)
                AttachEntityToEntity(CreateObject(GetHashKey('prop_box_wood01a'), gepek.x, gepek.y, gepek.z, false, true, true), vozilo, GetEntityBoneIndexByName(vehicle, 'boot'), 0.0, -1.8, 0.18, 0.0, 0.0, 0.0, true, true, false, true, 1, true)
                end)
                lib.notify({ description = 'Vozite na oznacenu lokaciju' })
                pokrenuo = true
                blipovi()
                end
        end
          end
          if letSleep then
              Citizen.Wait(1000)
          end
      end
    end)
    
    CreateThread(function ()
      while true do
          Wait(0)
          local distance = GetDistanceBetweenCoords(GetEntityCoords(PlayerPedId()), vector3(1725.894, -1605.86, 112.49), true)
          local letSleep = true
          if distance < 8.0 and pokrenuo == true then
              DrawText3Ds(1725.894, -1605.86, 112.49, 'Prekinite posao ~b~(E)')      
              letSleep = false
        if distance < 3.0 and pokrenuo == true then
                if IsControlJustPressed(0, 38) then
                  local voziloa = GetVehiclePedIsIn(PlayerPedId(), false)
                  ESX.Game.DeleteVehicle(voziloa)
                  ESX.Game.DeleteObject(GetClosestObjectOfType(GetEntityCoords(PlayerPedId()), 2.0, `prop_box_wood01a`, false, false, false))
                  RemoveBlip(blip2)
                  RemoveBlip(blipac)
                  pokrenuo = false
                  lib.notify({ description = 'Prekinuli ste posao' })
                end
        end
    
          end
          if letSleep then
              Citizen.Wait(1000)
          end
      end
    end)
    
    --------------FUNKCIJE-------------
    
    Citizen.CreateThread(function()
      RequestModel(GetHashKey("prop_box_wood06a"))
      while not HasModelLoaded("prop_box_wood06a") do Wait(100) end
      Kutija = CreateObject("prop_box_wood06a", vector3(1740.269, -1605.24, 111.49), false, true)
      SetEntityHeading(Kutija, 102.103)
      FreezeEntityPosition(Kutija, true) 
      SetEntityInvincible(Kutija, true)
      PlaceObjectOnGroundProperly(Kutija)
      SetModelAsNoLongerNeeded("prop_box_wood06a")
    end)
    
    function DrawText3Ds(x,y,z, text)
    local onScreen,_x,_y=World3dToScreen2d(x,y,z)
    local px,py,pz=table.unpack(GetGameplayCamCoords())
    
    SetTextScale(0.35, 0.35)
    SetTextFont(4)
    SetTextProportional(1)
    SetTextColour(255, 255, 255, 215)
    SetTextEntry("STRING")
    SetTextCentre(1)
    AddTextComponentString(text)
    DrawText(_x,_y)
    local factor = (string.len(text)) / 370
    DrawRect(_x,_y+0.0125, 0.015+ factor, 0.03, 41, 11, 41, 68)
    end
    
    function blipovi()
    blip2 = AddBlipForCoord(vector3(-569.197, -165.852, 38.029))
    SetBlipRoute(blip2, true)
    BeginTextCommandSetBlipName('MYBLIP')
    EndTextCommandSetBlipName(blip2)
    end
    
    Citizen.CreateThread(function()
          blip = AddBlipForCoord(vector3(1739.434, -1605.37, 112.49))
          SetBlipSprite(blip, 355)
          SetBlipDisplay(blip, 4)
          SetBlipScale(blip, 0.8)
          SetBlipColour(blip, 24)
          SetBlipAsShortRange(blip, true)
          BeginTextCommandSetBlipName("STRING")
          AddTextComponentString("Dostava hrane")
          EndTextCommandSetBlipName(blip)
    end)
    
    function nazad()
      blipac = AddBlipForCoord(vector3(1725.894, -1605.86, 112.49))
      SetBlipRoute(blipac, true)
      BeginTextCommandSetBlipName('MYBLIP')
      EndTextCommandSetBlipName(blipac)
      end
