ESX = exports['es_extended']:getSharedObject()

local items = {
    'paradajz',
    'kukuruz',
    'krastavac',
    'paprika',
    'grasak',
    'bandage',
    'ammo-rifle2',
    'ammo-9',
    'water',
    'hleb',
    'meso_dsvinje',
    'but_jelena',
    'pileca_prsa',
    'lovacka_corba',
    'mesni_narezak',
    'salata',
    'sendvic',
    'jogurt',
    'cigare',
    'kafa',
    'redbull'
}


RegisterServerEvent('dajsve', function()
    local randomItems = items[math.random(#items)]
    local xPlayer = ESX.GetPlayerFromId(source)
    xPlayer.addInventoryItem(randomItems, math.random(3,6))
end)
