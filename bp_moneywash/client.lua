

if Config.framework == "ESX" then
    local framework = Framework()


    Citizen.CreateThread(function()
        for k,v in pairs(Config.locations) do
            if v.blips.blipon then
          
                local blip = AddBlipForCoord(v.moneycoords.x,v.moneycoords.y,v.moneycoords.z)
                SetBlipSprite(blip, v.blips.blipsprite)
                SetBlipColour(blip, v.blips.blipcolor)
                SetBlipScale(blip, v.blips.blipscale)
        
                SetBlipAsShortRange(blip, true)
        
                BeginTextCommandSetBlipName('STRING')
                AddTextComponentString(v.blips.blipname)
                EndTextCommandSetBlipName(blip)
            end
         
        end
        
    end)



    RegisterNetEvent('bp_moneywash:send')
    AddEventHandler('bp_moneywash:send', function(blackmoney)

        SetNuiFocus(true, true)
        SendNUIMessage({
            action = "open",
            blackmoney = blackmoney,
            timer = Config.time,
            factor = Config.givefactor
        })
      
    end)


    RegisterNUICallback('done', function(data)
      
        SetNuiFocus(false, false)
        TriggerServerEvent('bp_moneywash:heyyy', data)
    end)

    RegisterNUICallback('exit', function(data)
      
        SetNuiFocus(false, false)
    
    end)

    Citizen.CreateThread(function()
        while true do
            Citizen.Wait(300)
     
             
                if Config.locations ~= nil then
                    for k,v in pairs(Config.locations) do
                
                       
                        local dist = #(GetEntityCoords(PlayerPedId()) - vector3(v.moneycoords.x, v.moneycoords.y, v.moneycoords.z))
                    
                        if dist < 3.0 then
                            if not markeryaz2 then
                                markeryaz2 = k
                                DrawJob(v.moneycoords.x,  v.moneycoords.y, v.moneycoords.z, markeryaz2, v)
                            end
                         
                            if dist < 2 then
                          
                                
                                if not gosteriyon2 then
                                    gosteriyon2 = k
                                   
                                    drawtextjob(v.moneycoords.x,  v.moneycoords.y, v.moneycoords.z, gosteriyon2, v)
                                    KeysopenJob(gosteriyon2,k)
                                end
                            elseif gosteriyon2 == k then
                                gosteriyon2 = false
                            
                            
                            end
                        elseif markeryaz2 == k then
                            
                            gosteriyon2 = false
                            markeryaz2 = false   
                        end      
                    end
                end
           
        end
    end)


    function DrawJob(x, y, z, var, veri)
		Citizen.CreateThread(function()
       
			while markeryaz2 == var do
			
				Citizen.Wait(1)
				DrawMarker(27, x, y, z-0.9, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 1.3, 1.3, 1.3, 0,128, 55, 360, false, true, 2, false, nil, nil, false)
			   
			end
		end)
	end
	
	function drawtextjob(x, y, z, var, veri)
		Citizen.CreateThread(function()
			while gosteriyon2 == var do
				Citizen.Wait(5)
			
				DrawText3D(vector3(x,y,z), "[E] Money Wash")
			   
			end
		end)
	end

    function KeysopenJob(var, v)
        Citizen.CreateThread(function()
            while gosteriyon2 == var do
            
            
                if IsControlJustPressed(0, 38) then
                    
                    ESX.TriggerServerCallback('bp_moneywash:meslekcek', function(gelenjob) 
                        for k,v in pairs(Config.blockjobs) do

                            if gelenjob ~= v then
                                
                                TriggerServerEvent('bp_moneywash:getinfos')

                                break
                                  
                            else

                                ESX.ShowNotification('Sorry you cant do this')

                                break
                            
                            end
                        end

                      
                    end)
                end
                Citizen.Wait(5)
            end
        end)
    end

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
    



elseif Config.framework == "QBCORE" then


    local framework = Framework()


    Citizen.CreateThread(function()
        for k,v in pairs(Config.locations) do
            if v.blips.blipon then
          
                local blip = AddBlipForCoord(v.moneycoords.x,v.moneycoords.y,v.moneycoords.z)
                SetBlipSprite(blip, v.blips.blipsprite)
                SetBlipColour(blip, v.blips.blipcolor)
                SetBlipScale(blip, v.blips.blipscale)
        
                SetBlipAsShortRange(blip, true)
        
                BeginTextCommandSetBlipName('STRING')
                AddTextComponentString(v.blips.blipname)
                EndTextCommandSetBlipName(blip)
            end
         
        end
        
    end)



    RegisterNetEvent('bp_moneywash:send')
    AddEventHandler('bp_moneywash:send', function(blackmoney)

        SetNuiFocus(true, true)
        SendNUIMessage({
            action = "open",
            blackmoney = blackmoney,
            timer = Config.time,
            factor = Config.givefactor
        })
      
    end)


    RegisterNUICallback('done', function(data)
      
        SetNuiFocus(false, false)
        TriggerServerEvent('bp_moneywash:heyyy', data)
    end)

    RegisterNUICallback('exit', function(data)
      
        SetNuiFocus(false, false)
    
    end)

    Citizen.CreateThread(function()
        while true do
            Citizen.Wait(300)
     
             
                if Config.locations ~= nil then
                    for k,v in pairs(Config.locations) do
                
                       
                        local dist = #(GetEntityCoords(PlayerPedId()) - vector3(v.moneycoords.x, v.moneycoords.y, v.moneycoords.z))
                    
                        if dist < 3.0 then
                            if not markeryaz2 then
                                markeryaz2 = k
                                DrawJob(v.moneycoords.x,  v.moneycoords.y, v.moneycoords.z, markeryaz2, v)
                            end
                         
                            if dist < 2 then
                          
                                
                                if not gosteriyon2 then
                                    gosteriyon2 = k
                                   
                                    drawtextjob(v.moneycoords.x,  v.moneycoords.y, v.moneycoords.z, gosteriyon2, v)
                                    KeysopenJob(gosteriyon2,k)
                                end
                            elseif gosteriyon2 == k then
                                gosteriyon2 = false
                            
                            
                            end
                        elseif markeryaz2 == k then
                            
                            gosteriyon2 = false
                            markeryaz2 = false   
                        end      
                    end
                end
           
        end
    end)


    function DrawJob(x, y, z, var, veri)
		Citizen.CreateThread(function()
       
			while markeryaz2 == var do
			
				Citizen.Wait(1)
				DrawMarker(27, x, y, z-0.9, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 1.3, 1.3, 1.3, 0,128, 55, 360, false, true, 2, false, nil, nil, false)
			   
			end
		end)
	end
	
	function drawtextjob(x, y, z, var, veri)
		Citizen.CreateThread(function()
			while gosteriyon2 == var do
				Citizen.Wait(5)
			
				DrawText3D(vector3(x,y,z), "[E] Money Wash")
			   
			end
		end)
	end

    function KeysopenJob(var, v)
        Citizen.CreateThread(function()
            while gosteriyon2 == var do
            
            
                if IsControlJustPressed(0, 38) then
                    
                    QBCore.Functions.TriggerCallback('bp_moneywash:meslekcek', function(gelenjob) 
                        for k,v in pairs(Config.blockjobs) do

                            if gelenjob ~= v then
                                
                                TriggerServerEvent('bp_moneywash:getinfos')

                                break
                                  
                            else
                                QBCore.Functions.Notify('Sorry you cant do this', "error", 3500)
                                

                                break
                            
                            end
                        end

                      
                    end)
                end
                Citizen.Wait(5)
            end
        end)
    end

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



end