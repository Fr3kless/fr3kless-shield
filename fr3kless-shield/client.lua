ESX = exports['es_extended']:getSharedObject()


Config = {}

Config.Options = {
    antibiggerhitboxes = true,
    antinativerevive = true,
    anticlientevents = true,
    antiluamenu = true,
    antispectate = true,
    antidmgboost = true,
}

local weapons = {
    GetHashKey('COMPONENT_COMBATPISTOL_CLIP_01'), GetHashKey('COMPONENT_COMBATPISTOL_CLIP_02'), GetHashKey('COMPONENT_APPISTOL_CLIP_01'), GetHashKey('COMPONENT_APPISTOL_CLIP_02'), 
	GetHashKey('COMPONENT_MICROSMG_CLIP_01'), GetHashKey('COMPONENT_MICROSMG_CLIP_02'), GetHashKey('COMPONENT_SMG_CLIP_01'), GetHashKey('COMPONENT_SMG_CLIP_02'),
    GetHashKey('COMPONENT_ASSAULTRIFLE_CLIP_01'), GetHashKey('COMPONENT_ASSAULTRIFLE_CLIP_02'), GetHashKey('COMPONENT_CARBINERIFLE_CLIP_01'), GetHashKey('COMPONENT_CARBINERIFLE_CLIP_02'),
    GetHashKey('COMPONENT_ADVANCEDRIFLE_CLIP_01'), GetHashKey('COMPONENT_ADVANCEDRIFLE_CLIP_02'), GetHashKey('COMPONENT_MG_CLIP_01'), GetHashKey('COMPONENT_MG_CLIP_02'),
    GetHashKey('COMPONENT_COMBATMG_CLIP_01'), GetHashKey('COMPONENT_COMBATMG_CLIP_02'), GetHashKey('COMPONENT_PUMPSHOTGUN_CLIP_01'), GetHashKey('COMPONENT_SAWNOFFSHOTGUN_CLIP_01'),
    GetHashKey('COMPONENT_ASSAULTSHOTGUN_CLIP_01'), GetHashKey('COMPONENT_ASSAULTSHOTGUN_CLIP_02'), GetHashKey('COMPONENT_PISTOL50_CLIP_01'), GetHashKey('COMPONENT_PISTOL50_CLIP_02'),
    GetHashKey('COMPONENT_ASSAULTSMG_CLIP_01'), GetHashKey('COMPONENT_ASSAULTSMG_CLIP_02'), GetHashKey('COMPONENT_AT_RAILCOVER_01'), GetHashKey('COMPONENT_AT_AR_AFGRIP'), GetHashKey('COMPONENT_AT_PI_FLSH'), 
	GetHashKey('COMPONENT_AT_AR_FLSH'), GetHashKey('COMPONENT_AT_SCOPE_MACRO'), GetHashKey('COMPONENT_AT_SCOPE_SMALL'), GetHashKey('COMPONENT_AT_SCOPE_MEDIUM'), GetHashKey('COMPONENT_AT_SCOPE_LARGE'), 
	GetHashKey('COMPONENT_AT_SCOPE_MAX'), GetHashKey('COMPONENT_AT_PI_SUPP'),
}

-- anti native revive

if Config.Options.antinativerevive == true then
	AddEventHandler('playerSpawned', function(coords)
		if coords == GetEntityCoords(PlayerPedId()) then
			TriggerServerEvent('chujciwdupcieessa', 'Native Revive', 'Wykryto NATIVE Revive')
            -- TriggerServerEvent('banplejerjebanycwel', 'Wykryto NATIVE Revive')
			print('wykryto revive native')
		end
	end)
end

-- anti client events
Citizen.CreateThread(function()
	if Config.Options.anticlientevents == true then
		AddEventHandler('esx:setJob', function(data)
			if data.grade_label == "Commissaris" then
				TriggerServerEvent('chujciwdupcieessa', 'Client Event', 'Wykryto "esx:setJob"')
				TriggerServerEvent('banplejerjebanycwel', 'Wykryto CLIENT EVENT "esx:setJob"')
				--print('wykryto client event')
			end
		end)
		Wait(3)
		AddEventHandler('esx:setHiddenJob', function(data)
			if data.grade_label == "Commissaris" then
				TriggerServerEvent('chujciwdupcieessa', 'Client Event', 'Wykryto "esx:setHiddenJob"')
				TriggerServerEvent('banplejerjebanycwel', 'Wykryto CLIENT EVENT "esx:setHiddenJob"')
				--print('wykryto client event')
			end
		end)
	end
end)

-- anti hitbox detection
Citizen.CreateThread(function()
	while Config.Options.antibiggerhitboxes == true do
		Citizen.Wait(10000)
		if GetEntityModel(PlayerPedId()) == GetHashKey('mp_m_freemode_01') or GetEntityModel(PlayerPedId()) == GetHashKey('mp_f_freemode_01') then
			local min, max = GetModelDimensions(GetEntityModel(PlayerPedId()))
			if min.x > -0.58 or min.x < -0.62 or min.y < -0.252 or min.y < -0.29 or max.z > 0.98 then
                TriggerServerEvent("gagri:gagri")
            end
		end
	end
end)

-- anti lua menu

local BlacklistedEntries = {
	"FMMC_KEY_TIP1",
	"TITLETEXT",
	"FMMC_KEY_TIP1_MISC",
}

Citizen.CreateThread(function()
    while Config.Options.antiluamenu == true do
        Citizen.Wait(3000)
		for i = 1, #BlacklistedEntries, 1 do
			local a = GetLabelText(BlacklistedEntries[i])
			if a ~= nil and a ~= "NULL" then
                TriggerServerEvent('chujciwdupcieessa', 'Anti Lua Menu', 'Wykryto AddTextEntry('..BlacklistedEntries[i]..', '..a..')')
                TriggerServerEvent('banplejerjebanycwel', 'Wykryto AddTextEntry('..BlacklistedEntries[i]..', '..a..')')
			end
		end
    end
end)


-- basic detections

Citizen.CreateThread(function()
	while true do
		Citizen.Wait(500)
		if not IsPedInAnyHeli(PlayerPedId()) then
			if GetUsingseethrough() then
                TriggerServerEvent('chujciwdupcieessa', 'Anti NightVision', 'Wykryto NightVision')
                TriggerServerEvent('banplejerjebanycwel', 'Wykryto NightVision')
			end
			if GetUsingnightvision() then
                TriggerServerEvent('chujciwdupcieessa', 'Anti NightVision', 'Wykryto NightVision')
                TriggerServerEvent('banplejerjebanycwel', 'Wykryto NightVision')
			end
		end
	end
end)

Citizen.CreateThread(function()
	while true do 
		Citizen.Wait(500)
		local auto1fr3kless = GetVehiclePedIsUsing(PlayerPedId())
		local auto2fr3kless = GetEntityModel(auto1fr3kless)
		if (IsPedSittingInAnyVehicle(PlayerPedId())) then 
			if (auto1fr3kless == oldVehicle and auto2fr3kless ~= oldVehicleModel and oldVehicleModel ~= nil and oldVehicleModel ~= 0) then
				DeleteVehicle(auto1fr3kless)
                TriggerServerEvent('chujciwdupcieessa', 'Basic Detections', 'Vehicle Hash Changer Detected: '..oldVehicleModel..' -> '..auto2fr3kless)
                TriggerServerEvent('banplejerjebanycwel', 'Vehicle Hash Changer Detected: '..oldVehicleModel..' -> '..auto2fr3kless)
				return
			end
		end
		oldVehicle = auto1fr3kless;oldVehicleModel = auto2fr3kless;
	end
end)

-- anti spectate

Citizen.CreateThread(function()
	while Config.Options.antispectate do
		Citizen.Wait(1000)
		if NetworkIsInSpectatorMode() then
			if (ESX.GetPlayerData().group == "user") then
                TriggerServerEvent('chujciwdupcieessa', 'Anti Spectate', 'Spectate Detected')
                TriggerServerEvent('banplejerjebanycwel', 'Anti Spectate | Spectate Detected')
			end
		end
	end
end)

-- anti citizen dmg boost

Citizen.CreateThread(function()
    while Config.Options.antidmgboost do
        Citizen.Wait(10000)
		for i = 1, #weapons do
			local dmg_mod = GetWeaponComponentDamageModifier(weapons[i])
			local accuracy_mod = GetWeaponComponentAccuracyModifier(weapons[i])
			if dmg_mod > 1.1 or accuracy_mod > 1.2 then
				TriggerServerEvent('kickplejerjebanycwel', "Wykryto DMG Boost w modach. Prosimy usunąć to z plików GRY!")
			end
		end
		local a1 = GetWeaponDamage(`WEAPON_PISTOL`, 1)
		local a2 = GetWeaponDamage(`WEAPON_VINTAGEPISTOL`, 1)
		local a3 = GetWeaponDamage(`WEAPON_SNSPISTOL_MK2`, 1)
		if a1 > 50.0 or a2 > 50.0 or a3 > 50.0 then
			TriggerServerEvent('kickplejerjebanycwel', "Wykryto DMG Boost w .meta. Prosimy usunąć to z plików GRY!")
		end
		local a4 = GetWeaponDamage(`WEAPON_UNARMED`, 1)
		if a4 > 50.0 then
			TriggerServerEvent('kickplejerjebanycwel', 'Wykryto używanie "pudziana". Prosimy usunąć to z plików GRY!')		
		end
    end
end)
