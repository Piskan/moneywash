if Config.framework == "ESX" then
    local yes = Initialized()
    RegisterServerEvent('bp_moneywash:getinfos')
    AddEventHandler('bp_moneywash:getinfos', function()
        local src = source
        local xPlayer = ESX.GetPlayerFromId(src)
        local getblack = xPlayer.getAccount(Config.blackmoneytype).money
       
        TriggerClientEvent('bp_moneywash:send', src, getblack)
        
    end)


    RegisterServerEvent('bp_moneywash:heyyy')
    AddEventHandler('bp_moneywash:heyyy', function(data)
        local src = source
        local xPlayer = ESX.GetPlayerFromId(src)
        local getblack = xPlayer.getAccount(Config.blackmoneytype).money

        if tonumber(getblack) >= tonumber(data.playermoney) then
      
           xPlayer.removeAccountMoney(Config.blackmoneytype, tonumber(data.playermoney))

           xPlayer.addMoney(tonumber(data.givinmoney))
         

        else
            xPlayer.showNotification("Something Went Wrong", 6)
     
        end
        
        
    end)


    ESX.RegisterServerCallback('bp_moneywash:meslekcek', function(source,cb) 
        local src = source
        local xPlayer = ESX.GetPlayerFromId(src)
        cb(xPlayer.job.name)

      
    end)


   

   


elseif Config.framework == "QBCORE" then


    local yes = Initialized()
    RegisterServerEvent('bp_moneywash:getinfos')
    AddEventHandler('bp_moneywash:getinfos', function()
        local src = source
        local Player = QBCore.Functions.GetPlayer(src)
        local getblack = Player.PlayerData.money[Config.blackmoneytype]

        TriggerClientEvent('bp_moneywash:send', src, getblack)
        
    end)


    RegisterServerEvent('bp_moneywash:heyyy')
    AddEventHandler('bp_moneywash:heyyy', function(data)
        local src = source
        local Player = QBCore.Functions.GetPlayer(src)
        local getblack = Player.PlayerData.money[Config.blackmoneytype]


        if tonumber(getblack) >= tonumber(data.playermoney) then
            Player.Functions.RemoveMoney(Config.blackmoneytype, tonumber(data.playermoney), 'moneywash')
            Player.Functions.AddMoney('cash', tonumber(data.givinmoney))


        else
         
            TriggerClientEvent('QBCore:Notify', src, 'Something went wrong', 'error')
        end
        
        
    end)


    QBCore.Functions.CreateCallback('bp_moneywash:meslekcek', function(playerId,cb) 
        local src = playerId
        local Player = QBCore.Functions.GetPlayer(src)
        local job = Player.PlayerData.job
        cb(job.name)

      
    end)

end