Config = {}

Config.framework = 'ESX' -- FRAMEWORK! , "ESX", "QBCORE"


Config.time = 5000   ---- Money Wash Wait Time


Config.givefactor = 2  ---- Coefficient of money to be given to players (like 0.5,0.7,1,2,3,4)

Config.blackmoneytype = "black_money"   ---- type from config or database

Config.blockjobs = {
    "police"                       ---- block for jobs
}


Config.locations = {
    {
        ['blips'] = {['blipsprite'] = 500, ['blipcolor'] = 4 , ['blipscale'] = 0.7, ['blipname'] = "Money Wash", ['blipon'] = true},
        ['moneycoords'] = {['x'] =1136.268188, ['y'] = -989.920898, ['z'] = 46.112793, ['h'] = 85.039368 }

    }
   
}