print("^1 2015 Pierce Velocity Menu - JackTheDev ^0")

local mainMenu = RageUI.CreateMenu("Velocity Menu", "Pierce Velocity Menu")
local subMenu =  RageUI.CreateSubMenu(mainMenu, "A TITLE", "A SUB TITLE")

mainMenu:DisplayGlare(false)
mainMenu.Closed = function()
    print('Closed Showcase Menu')
end
mainMenu.EnableMouse = true
mainMenu.onIndexChange = function(Index)
    print(Index)
end

--> This will show the glare on the submenu : 
subMenu:DisplayGlare(true)

--> This will show the page counter on the submenu :
subMenu:DisplayPageCounter(false)

local index = {
    checkbox = false,
    list = 2,
}

local spawndesc = "Click here to spawn the Velocity Engine"
local doordesc = "Open the rear door of the velocity Engine"
local lightsdesc = "Turn on the rear cabinet lights for the Velocity Engine"
local extradesc = "Change the extras for the Velocity Engine"

Citizen.CreateThread(function()
    while (true) do
        Citizen.Wait(1.0)

        RageUI.IsVisible(mainMenu, function()

            RageUI.Button('Spawn Velocity Engine', spawndesc, {}, true, {
                onSelected = function()
                    local x,y,z = table.unpack(GetOffsetFromEntityInWorldCoords(PlayerPedId(), 0.0, 8.0, 0.5))
                    local veh = "velocity"
                    vehiclehash = GetHashKey(veh)
                    RequestModel(vehiclehash)

                    function ShowNotification( text )
                        SetNotificationTextEntry("STRING")
                        AddTextComponentSubstringPlayerName(text)
                        DrawNotification(false, false)
                    end

                    Citizen.CreateThread(function() 
                        local waiting = 0
                        while not HasModelLoaded(vehiclehash) do
                            waiting = waiting + 100
                            Citizen.Wait(100)
                            if waiting > 5000 then
                                ShowNotification("~r~Could not load the vehicle model in time, a crash was prevented.")
                                break
                            end
                        end
                        CreateVehicle(vehiclehash, x, y, z, GetEntityHeading(PlayerPedId())+90, 1, 0)
                    end)
                end
            });
 

            RageUI.List("Extra's", {
                { Name = "All Doors Closed", Value = 1 },
                { Name = "Mainly Left Open", Value = 2 },
                { Name = "mainly Right Open", Value = 3 },
                { Name = "Rota Ray", Value = 4 },
                { Name = "Chocks", Value = 5 },
                { Name = "Water poles", Value = 6 },
                { Name = "Right Scene", Value = 7 },
                { Name = "Left Scene", Value = 8 },
                { Name = "Front Fire extinguisher", Value = 9 },
                { Name = "Extra #10", Value = 10 },
                { Name = "Extra #11", Value = 11 },
                { Name = "Extra #12", Value = 12 },
            }, index.list, extradesc, {}, true, {
                onListChange = function(Index, Item)
                    index.list = Index;
                end,
                onSelected = function(Index, Item)
                    local veh = GetVehiclePedIsIn(PlayerPedId(), false)
                        if IsVehicleExtraTurnedOn(veh, Index) then
                            SetVehicleExtra(veh, Index, 1)
                            Visual.Subtitle("Extra turned off")
                        else 
                            SetVehicleExtra(veh, Index, 0)
                            Visual.Subtitle("Extra turned on")
                        end 
                end,
            })

            RageUI.Button('Toggle rear door', doordesc, {}, true, {
                onSelected = function()
                    --Visual.Subtitle("Doors opening")
                    local vehic = GetVehiclePedIsIn(PlayerPedId(), false)
                    local closed = GetVehicleDoorAngleRatio(vehic, 5) < 0.1
                   
                    if closed then 
                        SetVehicleDoorOpen(vehic, 5, false, false)
                    end
                    if not closed then
                        SetVehicleDoorsShut(vehic, false)
                    end
                end

            });

            RageUI.Checkbox('Rear Lights', lightsdesc, index.checkbox, {}, {
                onChecked = function()
                    local vehi = GetVehiclePedIsIn(PlayerPedId())
                    SetVehicleNeonLightEnabled(vehi, 0, true)
                    SetVehicleNeonLightEnabled(vehi, 1, true)
                    SetVehicleNeonLightEnabled(vehi, 2, true)
                    SetVehicleNeonLightEnabled(vehi, 3, true)
                    Wait(0)
                    SetVehicleNeonLightsColour(vehi, 222, 222, 255)
                end,
                onUnChecked = function()
                    local vehi = GetVehiclePedIsIn(PlayerPedId())
                    SetVehicleNeonLightEnabled(vehi, 0, false)
                    SetVehicleNeonLightEnabled(vehi, 1, false)
                    SetVehicleNeonLightEnabled(vehi, 2, false)
                    SetVehicleNeonLightEnabled(vehi, 3, false)
                end,
                onSelected = function(Index)
                    index.checkbox = Index
                    
                end
            })

            RageUI.Separator("Made by JackTheDev")

        end)
    end
end)


Keys.Register('F10', 'F10', 'Open RageUI Showcase menu default.', function()
    RageUI.Visible(mainMenu, not RageUI.Visible(mainMenu))
end)