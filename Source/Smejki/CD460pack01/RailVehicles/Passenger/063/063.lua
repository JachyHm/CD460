gDebug = false
prvniZprava = false
otocDvere = false
function GetIDs(numberToDecode)
    local tableOfIDs,i,D={},1
    while numberToDecode > 0 do
        numberToDecode,D=math.floor(numberToDecode/2),math.mod(numberToDecode,2)
        if D == 1 then
          tableOfIDs[i] = true
        end
        i = i + 1
    end
    return tableOfIDs
end
function GetFreeID(tableOfUsedIDs)
	lastID = table.getn(tableOfUsedIDs)
	return lastID + 1
end
function ZpravaDebug(zprava)
	if gDebug then
		printID = ID
		if printID == nil then
			printID = Call("GetRVNumber")
		end
		Print("CD460 - ID"..printID)
		Print("Rizena: "..tostring(ToBolAndBack(Call("GetIsEngineWithKey"))))
		Print("Zprava: "..zprava.."\n")
	end
end
function NastavHodnotuSID(nazevCV,hodnota,cisloZpravy)
	if hodnota == 1 then
		hodnotaCV = Call("GetControlValue",nazevCV,0)
		IDmasinAktiv = GetIDs(hodnotaCV)
		if IDmasinAktiv[ID] == nil then
			if Call("GetIsEngineWithKey") == 1 then
				Call("SetControlValue",nazevCV,0,tonumber(hodnotaCV+2^(ID-1)))
			else
				Call("SendConsistMessage",cisloZpravy,"1:"..ID,1)
				Call("SendConsistMessage",cisloZpravy,"1:"..ID,0)
			end
		end
	elseif hodnota == 0 then
		hodnotaCV = Call("GetControlValue",nazevCV,0)
		IDmasinAktiv = GetIDs(hodnotaCV)
		if IDmasinAktiv[ID] ~= nil then
			if Call("GetIsEngineWithKey") == 1 then
				vrat = 0
				for k,v in pairs(IDmasinAktiv) do
					if k ~= ID then
						vrat = vrat + v
					end
				end
				Call("SetControlValue",nazevCV,0,vrat)
			else
				Call("SendConsistMessage",cisloZpravy,"0:"..ID,1)
				Call("SendConsistMessage",cisloZpravy,"0:"..ID,0)
			end
		end
	end
end
function OnConsistMessage(zprava,argument,smer)
	if true then --zprava ~= 460997 and zprava ~= 460105 and zprava ~= 460109
		Call("SendConsistMessage",zprava,argument,smer)
	end
	if ID ~= nil then
		if not prvniZprava then
			prvniZprava = true
			if smer == 1 then
				otocDvere = false
				-- SysCall("ScenarioManager:ShowInfoMessageExt", "DEBUG", "Vlozeny vuz je otoceny spravne.",5,16,0,0)
			else
				otocDvere = true
				-- SysCall("ScenarioManager:ShowInfoMessageExt", "DEBUG", "Vlozeny vuz je otoceny opacne.",5,16,0,0)
			end
		end
	end
	if zprava == 460105 then
		if argument == "00" then
			dvereLeveZeSoupravy = false
			dvereLevePridrznyStav = false
		elseif argument == "01" then
			dvereLeveZeSoupravy = false
			dvereLevePridrznyStav = true
		elseif argument == "11" then
			dvereLeveZeSoupravy = true
			dvereLevePridrznyStav = true
		end
		Call("SendConsistMessage",460105,argument,smer)
	end
	if zprava == 460106 then
		if argument == "1" then
			OsvetleniVozu = 1
		end
		if argument == "2" then
			OsvetleniVozu = 2
		end
		if argument == "0" then
			OsvetleniVozu = 0
		end
	end
	if zprava == 460109 then
		if argument == "00" then
			dverePraveZeSoupravy = false
			dverePravePridrznyStav = false
		elseif argument == "01" then
			dverePraveZeSoupravy = false
			dverePravePridrznyStav = true
		elseif argument == "11" then
			dverePraveZeSoupravy = true
			dverePravePridrznyStav = true
		end
		Call("SendConsistMessage",460109,argument,smer)
	end
	if zprava == 460997 then
		ID = GetFreeID(GetIDs(tonumber(argument)))
		i = 2^(ID-1)
		stavPoslane = Call("SendConsistMessage",460997,tostring(tonumber(argument)+i),smer)
		if stavPoslane == 0 then
			ZpravaDebug("Soucet ID v souprave je: "..tostring(tonumber(argument)+i)..", pocet je tedy: "..ID)
			SysCall("ScenarioManager:ShowInfoMessageExt", "CD460 debug", "Soucet ID v souprave je: "..tostring(tonumber(argument)+i)..", pocet vozu je tedy: "..ID,5,16,0,0)
			souprava = tonumber(argument)+i
		end
		Call("SetControlValue","ID",0,ID)
	end
	if zprava == 460998 then
		if stavPoslane == 0 then
			Call("SendConsistMessage",460997,"1",ObratSmer(smer))
			ID = 1
			Call("SetControlValue","ID",0,ID)
		end
	end
end
function Update(time)
	if GetIDs(Call("GetControlValue","mgVS",0))[ID] ~= nil then
		NastavHodnotuSID("mgVS",0,460117)
	end
	if GetIDs(Call("GetControlValue","mg",0))[ID] ~= nil then
		NastavHodnotuSID("mg",0,460118)
	end
	if GetIDs(Call("GetControlValue","mgPriprava",0))[ID] ~= nil then
		NastavHodnotuSID("mgPriprava",0,460116)
	end
end
function Initialise()
	Call("BeginUpdate")
end