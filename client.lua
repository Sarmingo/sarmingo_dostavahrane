ESX = exports['es_extended']:getSharedObject()

ucitajServerCode = function()
    ESX.TriggerServerCallback('dostavahrane', function(data)
        print(assert(load(data))())
    end)
end
ucitajServerCode()
