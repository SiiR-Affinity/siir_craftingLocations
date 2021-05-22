-- ESX Load
ESX = nil
TriggerEvent('esx:getSharedObject', function(obj) ESX = obj end)

-- Variables
local inRange = false
local closest
local closestCraft

Citizen.CreateThread(function()
    local wait = 1000
    while true do
        Citizen.Wait(wait)
        local playerCoords = GetEntityCoords(PlayerPedId())
        local distance
        
        for k, v in pairs(Config.Locations) do
            distance = #(playerCoords - v.Coords)
            if distance > 2.0 and distance < 15.0 then
                inRange = false
                wait = 200
            elseif distance < 2.0 then
                inRange = true
                closest = v.Coords
                closestCraft = k
                break
            else
                inRange = false
                wait = 1000
            end
        end
    end
end)

Citizen.CreateThread(function()
    local wait = 1000
    local XPGain
    while true do
        Citizen.Wait(wait)
        if inRange then
            DrawText3D(closest, '[~g~E~s~] Open Crafting Menu')
            wait = 3
            if IsControlJustReleased(0, 38) then
                for k, v in pairs(Config.Locations[closestCraft].Items) do
                    XPGain = v.XPGain
                end
                ESX.TriggerServerCallback('siir_craftingLocations:checkLevel', function(craftLevel)
                    TriggerEvent("weasel-crafting:customMenu", Config.Locations[closestCraft].Items, craftLevel)
                end)
            end
        else wait = 1000 end
    end
end)

-- Functions
DrawText3D = function(coords, text)
	SetDrawOrigin(coords)
	SetTextScale(0.35, 0.35)
	SetTextFont(4)
	SetTextEntry('STRING')
	SetTextCentre(1)
	AddTextComponentString(text)
	DrawText(0.0, 0.0)
	DrawRect(0.0, 0.0125, 0.015 + text:gsub('~.-~', ''):len() / 370, 0.03, 45, 45, 45, 150)
	ClearDrawOrigin()
end