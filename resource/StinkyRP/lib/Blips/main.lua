local mps = {

    weed1 = '#Suszenie Marihuany', gz = 'Bezpieczna Strefa', hwp = 'Komenda HWP', milkman = 'Milkman', rpm = 'RPM Company', tfs = 'Twenty Four Seven', yacht23 = 'Napad na Yacht', safd = 'Komenda SAFD', molo = 'Molo Miłości', fib = 'FIB', psycholog = 'Psycholog', klub = 'Vanilla Unicorn', mechanikauto = 'Auto Naprawa', kasyno = 'Casino Royale', jubiler = 'Jubiler', krawiecbaza = 'Krawiec', kawiarniabaza = 'Kawiarnia', kurierbaza = 'Piekarz', zbrojownia = 'Napad na zbrojownie SASP', kawiarniaa = 'Napad na kawiarnie', pacyfik = 'Napad na skarbiec', humman = 'Napad na Humman Labs', robs = 'Robs Liquor',  ltd = 'LTD Gasoline', lspd = 'Komenda SASP', lssd = 'Komenda SASD', hypnonema = 'Kino Samochodowe', clotheshop = 'Sklep z Ubraniami', mcdonald = 'McDonald`s', gym = 'Siłownia', milk = 'Mleczarz', milk2 = 'Mleczarz #Pakowanie', milk3 = 'Mleczarz #Sprzedaż', court = 'Department of Justice', carzone = 'CarZone Garage', crouch = 'Kościół', bary = 'Bar', technik = 'Sklep Techniczny', repair = 'Stacja Naprawy', rybak = 'Rybak', rybaksell = 'Skup Ryb', benny = 'Warsztat "Benny`s"', weed = '#Plantacja Marihuany', mecanofajny = 'Los Santos Tuners', sad = 'Sad Jabłek',

    weed1c = 2, gzc = 2, lspdc = 26, milkmanc = 4, rpmc = 4, hwpc = 40, yacht23c = 49, safdc = 76, moloc = 48, fibc = 40, psychologc = 7, klubc = 8, mechanikautoc = 5, kasynoc = 5, jubilerc = 3, krawiecbazac = 5, kawiarniabazac = 5, kurierbazac = 5, zbrojowniac = 1, hummanc = 1, pacyfikc = 1, kawiarniaac = 1, lssdc = 5, hypnonemac = 6, shopc = 2, gasolinec = 3, clotheshopc = 2, mcdonaldc = 46, gymc = 5, milkc = 64, courtc = 0, carzonec = 28, crouchc = 5, baryc = 1, technikc = 5, repairc = 47, rybakc = 3, rybaksellc = 3, bennyc = 2, weedc = 2, mecanofajnyc = 27, sadc = 4,

    weed1b = 140, gzb = 429, lsb = 60, milkmanb = 442, rpmb = 311, molob = 489, yacht23b = 280, safdb = 436, psychologb = 205, klubb = 279, mechanikautob = 566, kasynob = 674, jubilerb = 617, krawiecbazab = 366, kawiarniabazab = 607, kurierbazab = 514, zbrojowniab = 150, hummanb = 158, pacyfikb = 160, kawiarniaab = 402, hypnonemab = 459, shopb = 52, gasolineb = 490, clotheshopb = 73, mcdonaldb = 78, gymb = 311, milkb = 285, courtb = 419, carzoneb = 523, crouchb = 305, baryb = 279, technikb = 459, repairb = 402, rybakb = 68, rybaksellb = 68, bennyb = 446, weedb = 140, mecanofajnyb = 446, sadb = 85,

    scale = 0.8, display = 4
}

local blips = {
--									  ['Police Stations']
    {title= mps.lspd , colour= mps.lspdc , id= mps.lsb , x=425.130, y=-979.558, z=30.711},
    --{title= mps.hwp , colour= mps.hwpc , id= mps.lsb , x=1533.53, y=821.16, z=77.48},
    --{title= mps.lspd , colour= mps.lspdc , id= mps.lsb , x=-1098.74, y=-841.07, z=19.0},
    --{title= mps.lspd , colour= mps.lspdc , id= mps.lsb , x=-52.83, y=-2516.42, z=14.57},
    --{title= mps.lssd , colour= mps.lssdc , id= mps.lsb , x=391.44, y=-1619.65, z=29.29},  
    {title= mps.lssd , colour= mps.lssdc , id= mps.lsb , x = 1856.99, y = 3680.36, z = 33.82},
    --{title= mps.lssd , colour= mps.lssdc , id= mps.lsb , x = 1680.87, y = 4878.73, z = 42.16},
    --{title= mps.hwp , colour= mps.hwpc , id= mps.lsb , x = 827.46, y = -1289.92, z = 28.24},
    --{title= mps.lspd , colour= mps.lspdc , id= mps.lsb , x = 639.2009, y = 1.6311, z = 81.8369}, 
    --{title= mps.lssd , colour= mps.lssdc , id= mps.lsb , x = -443.95, y = 6015.32, z = 33.82},

    --{title= mps.safd , colour= mps.safdc , id= mps.safdb , x = 1201.1757, y = -1461.5619, z = 33.8568},
    --{title= mps.safd , colour= mps.safdc , id= mps.safdb , x = 213.5345, y = -1642.0516, z = 28.7969},

    --{title= mps.fib , colour= mps.fibc , id= mps.lsb , x = 2512.52, y = -422.77, z = 94.11},
--                                        ['FIRMY']     
    {title= mps.milkman , colour= mps.milkmanc , id= mps.milkmanb , x = 60.48, y = -1579.76, z = 29.6},
    --{title= mps.rpm , colour= mps.rpmc , id= mps.rpmb , x = -277.7, y = -2038.07, z = 30.15},
    --{title= mps.krawiecbaza , colour= mps.krawiecbazac , id= mps.krawiecbazab , x = 708.45, y = -963.65, z = 29.41},
    {title= mps.kawiarniabaza , colour= mps.kawiarniabazac , id= mps.kawiarniabazab , x = -625.67, y = 237.88, z = 81.88},
--                                        ['NAPADY']    
    {title= mps.zbrojownia , colour= mps.zbrojowniac , id= mps.zbrojowniab , x = -220.58, y = -2370.47, z = 25.33},
    {title= mps.humman , colour= mps.hummanc , id= mps.hummanb , x = 3536.96, y = 3659.69, z = 28.12},
    {title= mps.pacyfik , colour= mps.pacyfikc , id= mps.pacyfikb , x = 254.97, y = 226.15, z = 101.88},
    {title= mps.kawiarniaa , colour= mps.kawiarniaac , id= mps.kawiarniaab , x = -635.17, y = 235.28, z = 81.88},

--										  ['INNE']
    --{title= mps.psycholog , colour= mps.psychologc , id= mps.psychologb , x = -1011.39, y = -480.03, z = 39.98},
    {title= mps.gz , colour= mps.gzc , id= mps.gzb , x = 2640.7, y = 3266.5, z = 54.272},
    {title= mps.gz , colour= mps.gzc , id= mps.gzb , x = -458.2936, y = -1716.3597, z = 18.3779},
    {title= mps.gz , colour= mps.gzc , id= mps.gzb , x = 182.218, y = 2779.2056, z = 44.7252},
    {title= mps.weed , colour= mps.weedc , id= mps.weedb , x = 2224.01, 	y = 5577.02, 	z = 52.85},
    {title= mps.weed1 , colour= mps.weed1c , id= mps.weed1b , x = 1540.55,	y = 6335.8,	z =  23.15},
--										  ['LSC']
    {title= mps.mechanikauto , colour= mps.mechanikautoc , id= mps.mechanikautob , x = 46.04, y = 6459.14, z = 30.45},
    {title= mps.mechanikauto , colour= mps.mechanikautoc , id= mps.mechanikautob , x = -1610.26, y = -824.17, z = 9.10},
    {title= mps.mechanikauto , colour= mps.mechanikautoc , id= mps.mechanikautob , x = 1150.4, y = -777.16, z = 56.7},
    {title= mps.mechanikauto , colour= mps.mechanikautoc , id= mps.mechanikautob , x = 541.3936, y = -177.1369, z = 53.5313},
    {title= mps.mechanikauto , colour= mps.mechanikautoc , id= mps.mechanikautob , x = 1776.81, y = 3334.64, z = 40.31},
--										  ['Addons']
    --{title= mps.hypnonema , colour= mps.hypnonemac , id= mps.hypnonemab , x = -1671.51, y = -902.78, z = 8.39},
    --{title= mps.benny , colour= mps.bennyc , id= mps.bennyb , x = -205.49, y = -1307.55, z = 31.26},
    --{title= mps.sad , colour= mps.sadc , id= mps.sadb , x = 355.8, y = 6505.1, z = 27.5},
    {title= mps.mecanofajny , colour= mps.mecanofajnyc , id= mps.mecanofajnyb , x = 823.89, y = -880.80, z = 24.25},
    --{title= mps.rybak , colour= mps.rybakc , id= mps.rybakb , x = -1820.23, y = -1220.44, z = 12.05},
    --{title= mps.rybaksell , colour= mps.rybaksellc , id= mps.rybaksellb , x = 1089.27, y = -774.54, z = 58.26},
    --{title= mps.gym , colour= mps.gymc , id= mps.gymb , x = -1201.2257, y = -1568.8670, z = 4.6101},
    --{title= mps.kasyno, colour= mps.kasynoc, id= mps.kasynob, x = 928.93, y = 45.16, z = 81.09},
    {title= mps.jubiler, colour= mps.jubilerc, id= mps.jubilerb, x = -628.18, y = -235.29, z = 38.06},
    {title= mps.court, colour= mps.courtc, id= mps.courtb, x = -68.0209, y =  -801.3398, z =  43.2773},
    --{title= mps.crouch, colour= mps.crouchc, id= mps.crouchb, x = -1681.18, y =  -290.94, z =  51.88},
    --{title= mps.klub, colour= mps.klubc , id= mps.klubb , x = 129.37, y = -1299.16, z = 29.23},
--										['CltoheSHOPS']
    {title= mps.clotheshop , colour= mps.clotheshopc , id= mps.clotheshopb , x = 72.254,    y = -1399.102, z = 28.376},
    {title= mps.clotheshop , colour= mps.clotheshopc , id= mps.clotheshopb , x = -703.776,  y = -152.258,  z = 36.415},
    {title= mps.clotheshop , colour= mps.clotheshopc , id= mps.clotheshopb , x = -167.863,  y = -298.969,  z = 38.733},
    {title= mps.clotheshop , colour= mps.clotheshopc , id= mps.clotheshopb , x = 428.694,   y = -800.106,  z = 28.491},
    {title= mps.clotheshop , colour= mps.clotheshopc , id= mps.clotheshopb , x = -829.413,  y = -1073.710, z = 10.328},
    {title= mps.clotheshop , colour= mps.clotheshopc , id= mps.clotheshopb , x = -1447.797, y = -242.461,  z = 48.820},
    {title= mps.clotheshop , colour= mps.clotheshopc , id= mps.clotheshopb , x = 11.632,    y = 6514.224,  z = 30.877},
    {title= mps.clotheshop , colour= mps.clotheshopc , id= mps.clotheshopb , x = 123.646,   y = -219.440,  z = 53.557},
    {title= mps.clotheshop , colour= mps.clotheshopc , id= mps.clotheshopb , x = 1696.291,  y = 4829.312,  z = 41.063},
    {title= mps.clotheshop , colour= mps.clotheshopc , id= mps.clotheshopb , x = 618.093,   y = 2759.629,  z = 41.088},
    {title= mps.clotheshop , colour= mps.clotheshopc , id= mps.clotheshopb , x = 1190.550,  y = 2713.441,  z = 37.222},
    {title= mps.clotheshop , colour= mps.clotheshopc , id= mps.clotheshopb , x = -1193.429, y = -772.262,  z = 16.324},
    {title= mps.clotheshop , colour= mps.clotheshopc , id= mps.clotheshopb , x = -3172.496, y = 1048.133,  z = 19.863},
    {title= mps.clotheshop , colour= mps.clotheshopc , id= mps.clotheshopb , x = -1108.441, y = 2708.923,  z = 18.107},
}
  
CreateThread(function()
    Citizen.Wait(5000)
    for _, info in pairs(blips) do
        info.blip = AddBlipForCoord(info.x, info.y, info.z)
        SetBlipSprite(info.blip, info.id)
        SetBlipDisplay(info.blip, mps.display)
        SetBlipScale(info.blip, 0.8)
        SetBlipColour(info.blip, info.colour)
        SetBlipAsShortRange(info.blip, true)
        BeginTextCommandSetBlipName("STRING")
        AddTextComponentString(info.title)
        EndTextCommandSetBlipName(info.blip)
        Citizen.Wait(1)
    end
end)
