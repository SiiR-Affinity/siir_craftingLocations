-- ESX Load
ESX = nil
TriggerEvent('esx:getSharedObject', function(obj) ESX = obj end)


ESX.RegisterServerCallback('siir_craftingLocations:checkLevel', function(source, callback)
    local xPlayer = ESX.GetPlayerFromId(source)

    exports.ghmattimysql:execute('SELECT `crafting_level` FROM `users` WHERE `identifier` = @identifier', {
        ['@identifier'] = xPlayer.getIdentifier()
    }, function(result)
        local craftLevel
        for k, v in pairs(result) do
            craftLevel = v.crafting_level
        end
        callback(craftLevel)
    end)
end)

RegisterNetEvent('siir_craftingLocations:updateXp')
AddEventHandler('siir_craftingLocations:updateXp', function(source, amount)
    local xPlayer = source
    exports.ghmattimysql:execute('SELECT `crafting_level` FROM `users` WHERE `identifier` = @identifier', {
        ['@identifier'] = xPlayer.getIdentifier()
    }, function(result)
        for k, v in pairs(result) do
            currentLevel = v.crafting_level
        end
        exports.ghmattimysql:execute('UPDATE `users` SET `crafting_level` = @crafting_level WHERE identifier = @identifier', {
            ['@identifier'] = xPlayer.getIdentifier(),
            ['@crafting_level'] = currentLevel + amount
        })
    end)
end)