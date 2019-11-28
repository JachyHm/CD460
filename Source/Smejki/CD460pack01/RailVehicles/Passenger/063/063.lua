gDebug = false

prvniZprava = false
otocDvere = false

predMasinouTornado = nil
zaMasinouTornado = nil
predMasinouTornadoCas = nil
predMasinouTornadoPosledniZpravaCas = 0
zaMasinouTornadoCas = nil
zaMasinouTornadoPosledniZpravaCas = 0
maxVzdalenost = 25000
poleKOdeslani = {}
prijateZpravy = {{}, {}}

delkaVlakuLast = 0
delkaVlaku = 0

casMinuly = 0
casProcesor = 0

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
		Print("CD063 - ID"..printID)
		Print("Rizena: "..tostring(ToBolAndBack(Call("GetIsEngineWithKey") or 0)))
		Print("Zprava: "..zprava.."\n")
		f = assert(io.open("063.log", "a"))
		f:write("CD063 - ID: "..printID.." :: Rizena: "..tostring(ToBolAndBack(Call("GetIsEngineWithKey") or 0)).." :: Zprava: "..zprava.."\n")
		f:close()
	end
end
function NastavHodnotuSID(nazevCV,hodnota,cisloZpravy)
	if hodnota == 1 then
		hodnotaCV = Call("GetControlValue",nazevCV,0)
		IDmasinAktiv = GetIDs(hodnotaCV)
		if IDmasinAktiv[ID] == nil then
			if Call("GetIsEngineWithKey") or 0 == 1 then
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
			if Call("GetIsEngineWithKey") or 0 == 1 then
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
function Initialise()
	predMasinou = Call("SendConsistMessage",460999,"DUMMY",0)
	zaMasinou = Call("SendConsistMessage",460999,"DUMMY",1)
end
function OnConsistMessage(zprava,argument,smer)
	ZpravaDebug("Prijata message: "..zprava.." s argumentem: "..argument.." ve smeru: "..smer)
	if zprava ~= 460995 and zprava ~= 460994 and zprava ~= 460997 and zprava ~= 460104 then --zprava ~= 460997 and zprava ~= 460105 and zprava ~= 460109
		if smer == 1 and zaMasinouTornado then
			stavPoslane = Call("SendConsistMessage",zprava,argument,1)
			ZpravaDebug("Preposilam zpravu: "..zprava.." s argumentem: "..argument.." ve smeru: "..smer)
		elseif smer == 0 and predMasinouTornado then
			stavPoslane = Call("SendConsistMessage",zprava,argument,0)
			ZpravaDebug("Preposilam zpravu: "..zprava.." s argumentem: "..argument.." ve smeru: "..smer)
		elseif predMasinouTornado == nil or zaMasinouTornado == nil then
			table.insert(poleKOdeslani, {zprava, argument, smer})
		end
		-- stavPoslane = Call("SendConsistMessage",zprava,argument,smer)
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
    if zprava == 460104 then
        delimpos = string.find(argument, ":")
        delim2pos = string.find(argument, ";")
        ujeteMetry = tonumber(string.sub(argument, 1, delimpos-1))
        noveNapeti = tonumber(string.sub(argument, delimpos+1, delim2pos-1))
        stareNapeti = tonumber(string.sub(argument, delim2pos+1))
		Call("SendConsistMessage",460104,(ujeteMetry-24.6)..":"..noveNapeti..";"..stareNapeti,smer)
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
		--Call("SendConsistMessage",460105,argument,smer)
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
		--Call("SendConsistMessage",460109,argument,smer)
	end
	if zprava == 460994 then
		prijateZpravy[smer+1]["x"] = argument
		xZS = argument
	end
	if zprava == 460995 then
		if prijateZpravy[smer+1]["x"] ~= nil then
			local yZS = argument
			x, _, y = Call("*:getNearPosition")
			ZpravaDebug("yZS: "..yZS)
			ZpravaDebug("xZS: "..xZS)
			ZpravaDebug("y: "..y)
			ZpravaDebug("x: "..x)
			local vzdalenost = math.sqrt((xZS-x)^2 + (yZS-y)^2)
			if vzdalenost < maxVzdalenost then
				if smer == 1 then
					predMasinouTornado = true
					predMasinouTornadoCas = nil
					predMasinouTornadoPosledniZpravaCas = os.clock()
				else
					zaMasinouTornado = true
					zaMasinouTornadoCas = nil
					zaMasinouTornadoPosledniZpravaCas = os.clock()
				end
			else
				if smer == 1 then
					predMasinouTornado = false
					predMasinouTornadoCas = nil
					predMasinouTornadoPosledniZpravaCas = os.clock()
				else
					zaMasinouTornado = false
					zaMasinouTornadoCas = nil
					zaMasinouTornadoPosledniZpravaCas = os.clock()
				end
			end
		else
			prijateZpravy[smer+1]["y"] = argument
		end
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
		ZpravaDebug("Posilam zpravu 460997! ve smeru "..smer)
		Call("SetControlValue","ID",0,ID)
	end
end
function ToBolAndBack (hodnota,hranice)
	if hodnota == true then return(1) elseif hodnota == false then return(0) else
		if hranice ~= nil then
			if hodnota > hranice then
				return(true) 
			else
				return(false)
			end
		else
			if hodnota > 0.5 then
				return(true)
			else
				return(false)
			end
		end
	end
end
function Update(time)
	if ToBolAndBack (Call("GetIsNearCamera")) then
		if Call("GetIsPlayer") == 1 then
			casMinuly = casProcesor
			casProcesor = os.clock()
			cas = math.abs(casProcesor - casMinuly)

			delkaVlakuLast = delkaVlaku
			delkaVlaku = Call("GetConsistLength")
			
			if delkaVlakuLast ~= delkaVlaku then
				x, _, y = Call("*:getNearPosition")
				Call("SendConsistMessage",460994,string.sub(x, 1, 10),0)
				predMasinou = Call("SendConsistMessage",460995, string.sub(y, 1, 10),0)
				ZpravaDebug("Poslana pozice dopredu: "..predMasinou)
				if predMasinou == 0 then
					predMasinouTornado = false
				elseif predMasinouTornadoPosledniZpravaCas + (cas * 5) < os.clock() then
					predMasinouTornadoCas = os.clock()
				end
				Call("SendConsistMessage",460994,string.sub(x, 1, 10),1)
				zaMasinou = Call("SendConsistMessage",460995,string.sub(y, 1, 10),1)
				ZpravaDebug("Poslana pozice dozadu: "..zaMasinou)
				if zaMasinou == 0 then
					zaMasinouTornado = false
				elseif zaMasinouTornadoPosledniZpravaCas + (cas * 5) < os.clock() then
					zaMasinouTornadoCas = os.clock()
				end
			end

			if table.getn(prijateZpravy) > 0 then
				for i in prijateZpravy do
					if prijateZpravy[i]["x"] ~= nil and prijateZpravy[i]["y"] ~= nil then
						prijateZpravy[i] = nil
						local xZS, yZS = prijateZpravy[i]["x"], prijateZpravy[i]["y"]
						x, _, y = Call("*:getNearPosition")
						ZpravaDebug("yZS: "..yZS)
						ZpravaDebug("xZS: "..xZS)
						ZpravaDebug("y: "..y)
						ZpravaDebug("x: "..x)
						local vzdalenost = math.sqrt((xZS-x)^2 + (yZS-y)^2)
						if vzdalenost < maxVzdalenost then
							if i == 2 then
								predMasinouTornado = true
								predMasinouTornadoCas = nil
								predMasinouTornadoPosledniZpravaCas = os.clock()
							else
								zaMasinouTornado = true
								zaMasinouTornadoCas = nil
								zaMasinouTornadoPosledniZpravaCas = os.clock()
							end
						else
							if i == 2 then
								predMasinouTornado = false
								predMasinouTornadoCas = nil
								predMasinouTornadoPosledniZpravaCas = os.clock()
							else
								zaMasinouTornado = false
								zaMasinouTornadoCas = nil
								zaMasinouTornadoPosledniZpravaCas = os.clock()
							end
						end
					end
				end
			end

			if predMasinouTornadoCas ~= nil then
				if predMasinouTornadoCas + (cas*5) < os.clock() then
					predMasinouTornado = false
					ZpravaDebug("Prekroceni casu dopredu!")
				end
			end
			if zaMasinouTornadoCas ~= nil then
				if zaMasinouTornadoCas + (cas*5) < os.clock() then
					zaMasinouTornado = false
					ZpravaDebug("Prekroceni casu dozadu!")
				end
			end

			if predMasinouTornado ~= nil and zaMasinouTornado ~= nil then
				for _, v in pairs(poleKOdeslani) do
					Call("SendConsistMessage", v[1], v[2], v[3])
				end
				poleKOdeslani = {}
				if ID ~= nil then
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
			end
		end
	end
end
function Initialise()
	Call("BeginUpdate")
end