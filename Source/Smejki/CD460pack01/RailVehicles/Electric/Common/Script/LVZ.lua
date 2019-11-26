function LVZ(LVZznak,vybaveni,delkaUpd,prenosKodu)
	local pribytek = delkaUpd * 30
	local signalCode = 0

	if prenosKodu then
		signalCode = LVZznak
		if prujezdKolemNavestidla and signalCode > 0 then
			prujezdKolemNavestidla = false
			casNekodovani = 0
			if lastSignalCode == 1 then
				nekodujCas = math.random(0,14) + math.random()
				pocetSumuPoPrujezdu = math.random(1,20)
			else
				nekodujCas = math.random(0,2) + math.random()
				pocetSumuPoPrujezdu = math.random(0,1)
			end
		else
			prujezdKolemNavestidla = false
		end

		casNekodovani = casNekodovani + delkaUpd

		if nekodujCas ~= nil then
			if casNekodovani > nekodujCas then
				nekodujCas = nil
				sumPoPrujezduKod = math.random(1,4)
				sumPoPrujezduDelka = math.random(5,10)/10
				sumPoPrujezduDelkaUbehle = 0
			else
				signalCode = 0
			end
		end

		sumPoPrujezduDelkaUbehle = sumPoPrujezduDelkaUbehle + delkaUpd

		if sumPoPrujezduDelka > sumPoPrujezduDelkaUbehle then
			signalCode = sumPoPrujezduKod
		elseif pocetSumuPoPrujezdu > 0 then
			pocetSumuPoPrujezdu = pocetSumuPoPrujezdu - 1
			sumPoPrujezduKod = math.random(1,4)
			sumPoPrujezduDelka = math.random(5,10)/10
			sumPoPrujezduDelkaUbehle = 0
		end

		-- zmenaParametruLast = zmenaParametru
		-- if zmenaParametruLast == nil then
		-- 	zmenaParametruLast = Call("GetCurvature")*Call("GetGradient")
		-- end
		-- zmenaParametru = Call("GetCurvature")*Call("GetGradient")
		-- local chybaLVZ = false
		-- if math.abs(zmenaParametru - zmenaParametruLast) > 0.1 and math.random(0,1) > 0.5 then
		-- 	chybaLVZ = true
		-- end

		-- if chybaLVZ == true and casChyby == nil then
		-- 	casChyby = math.random(1,3)
		-- 	LVZchyba = math.floor(math.random(1,4.9))
		-- end
		-- if casChyby ~= nil then
		-- 	if casChyby > casChybyUbehly then
		-- 		signalCode = LVZchyba
		-- 		casChybyUbehly = casChybyUbehly + delkaUpd
		-- 	else
		-- 		casChyby = nil
		-- 	end
		-- else
		-- 	casChybyUbehly = 0
		-- end

		local zhasleLVZ = false
		if math.random(0,10000) > 9990 and Call("GetSpeed") > 1 then
			zhasleLVZ = true
		end

		if zhasleLVZ and casZhasle == nil then
			casZhasle = math.random(0,2) + math.random()
		end

		if casZhasle ~= nil then
			if casZhasle > casZhasleUbehly then
				signalCode = 0
				casZhasleUbehly = casZhasleUbehly + delkaUpd
			else
				casZhasle = nil
			end
		else
			casZhasleUbehly = 0
		end
	end

	vystraha = false
	stuj = false
	volno = false
	mezikruzi = false
	if signalCode == 1 then
		mezikruzi = true
	elseif signalCode == 2 then
		volno = true
	elseif signalCode == 3 then
		stuj = true
	elseif signalCode == 4 then
		vystraha = true
	end
	
	if not vystraha and stavVystraha > 0 then
		stavVystraha = stavVystraha - pribytek
		if stavVystraha < 0 then stavVystraha = 0 end
	end
	if vystraha and stavVystraha < 10 then
		stavVystraha = stavVystraha + pribytek
		if stavVystraha > 10 then stavVystraha = 10 end
	end

	if not stuj and stavStuj > 0 then
		stavStuj = stavStuj - pribytek
		if stavStuj < 0 then stavStuj = 0 end
	end
	if stuj and stavStuj < 10 then
		stavStuj = stavStuj + pribytek
		if stavStuj > 10 then stavStuj = 10 end
	end

	if not volno and stavVolno > 0 then
		stavVolno = stavVolno - pribytek
		if stavVolno < 0 then stavVolno = 0 end
	end
	if volno and stavVolno < 10 then
		stavVolno = stavVolno + pribytek
		if stavVolno > 10 then stavVolno = 10 end
	end
	
	if not mezikruzi and stavMezikruzi > 0 then
		stavMezikruzi = stavMezikruzi - pribytek
		if stavMezikruzi < 0 then stavMezikruzi = 0 end
	end
	if mezikruzi and stavMezikruzi < 10 then
		stavMezikruzi = stavMezikruzi + pribytek
		if stavMezikruzi > 10 then stavMezikruzi = 10 end
	end
	
	if vybaveni == 0 and stavVybaveni > 0 then
		stavVybaveni = stavVybaveni - pribytek
		if stavVybaveni < 0 then stavVybaveni = 0 end
	end
	if vybaveni == 1 and stavVybaveni < 10 then
		stavVybaveni = stavVybaveni + pribytek
		if stavVybaveni > 10 then stavVybaveni = 10 end
	end

	Call("LVZvystraha:SetColour",1*stavVystraha,0.531*stavVystraha,0)
	Call("LVZvystraha:Activate",1)

	Call("LVZstuj:SetColour",1*stavStuj,0.0747*stavStuj,0)
	Call("LVZstuj:Activate",1)

	Call("LVZvolno:SetColour",0,stavVolno,0)
	Call("LVZvolno:Activate",1)

	Call("LVZmezikruzi:SetColour",1*stavMezikruzi,0.531*stavMezikruzi,0)
	Call("LVZmezikruzi:Activate",1)

	Call("LVZvybaveni:SetColour",0,0,stavVybaveni)
	Call("LVZvybaveni:Activate",1)

	return(signalCode)
end

----------------------------------------LVZ-----------------------------------------------
local LVZnapeti = Call("GetControlValue", "LVZnapeti", 0) --nacti hodnotu Vmetru do promenne
local LVZrezim = Call("GetControlValue", "LVZrezim", 0) --nacti hodnotu voliciho prepinace do promenne
local LVZstanoviste = Call("GetControlValue", "LVZstan", 0) --nacti hodnotu aktivniho stanoviste do promenne
local LVZvypinac = ToBolAndBack(Call("GetControlValue", "LVZhv", 0)) --vrat bool pro stav HV LVZ
local LVZstart = ToBolAndBack(Call("GetControlValue", "LVZstart", 0)) --vrat bool pro tlacitko startu bezkontaktniho menice
local LVZzkouseni = false --definuj volbu zkouseni

if baterie == 1 then
    if LVZnapeti < 1 and LVZvypinac then --pokud je napeti mensi nez 1 (24V) a je sepnuty vypinac VZ
        LVZnapeti = LVZnapeti + cas --napeti roste umerne s casem PC - kompenzace malych FPS
        Call("SetControlValue", "LVZnapeti", 0, LVZnapeti) --zapis hodnoty Vmetru
    end

    if LVZvypinac and LVZrezim < 0.25 and releEPV and soupatkoVZ == 0 then --pokud je zapaty HV, rezim je provoz, bezkontaktni menic bezi a je natazene soupatko, je VZ aktivni
        kontrolaBdelosti = true
    elseif LVZvypinac and LVZrezim < 0.25 then --pokud je zapaty HV a rezim je provoz a zaroven neni natazene soupatko, nebo vubec nebezi bezkontaktni menic
        releEPV = false --rozhod rele EPV
        kontrolaBdelosti = false
        soupatkoVZ = 1 --odpadni soupatko
    end
    if LVZvypinac and releEPV and LVZrezim > 0.25 and LVZrezim < 0.75 and soupatkoVZ == 0 then --je zapate HV, menic bezi, rezim je zkouseni a je natazene soupatko
        kontrolaBdelosti = true
        LVZzkouseni = true --aktivuj volbu "zkouseni"
    elseif LVZvypinac and LVZrezim > 0.25 and LVZrezim < 0.75 then --pokud je zapaty HV a rezim je testovani a nejsou splnene podm. vyse
        releEPV = false --rozhod rele EPV
        kontrolaBdelosti = false
        soupatkoVZ = 1 --odpadni soupatko
    end
    if LVZstart and LVZrezim > 0.75 and LVZvypinac and valcePrimocinne >= 1.8 and Rychlost < 15 then --pokud je rezim postrk a je zapaty vypinac, je mozne nazhavit bezkontaktni menic
        releEPV = true --natahni rele EPV
        soupatkoVZ = 0 --natahuje soupatko
    end
    if LVZrezim > 0.75 then --pokud je rezim postrk
        kontrolaBdelosti = false
        if not LVZvypinac then --zaroven pokud je zapaty HV
            soupatkoVZ = 0 --pritahni soupatko
        end
    end
    if not LVZvypinac then --pokud je vypaty vypinac LVZ
        releEPV = false --rozhod rele EPV
        kontrolaBdelosti = false
        if LVZrezim < 0.75 then --pokud je rezim vlak
            soupatkoVZ = 1 --odpada soupatko - v rezimu postrk zustava, soupatko drzi
        end
        Call("SetControlValue", "LVZmenic", 0, 0)
        Call("SetControlValue", "LVZzivak", 0, 0)
    else --pokud bezi bezkontaktni menic, tj. je zapaty HV a baterie, sviti jeho kontrolka
        Call("SetControlValue", "LVZmenic", 0, 1)
    end
end
    
if LVZnapeti > 0 and (not LVZvypinac or baterie ~= 1) then --pokud je na Vmetru napeti a je vypaty HV
    LVZnapeti = LVZnapeti - cas*2 --zmiz napeti
    Call("SetControlValue", "LVZnapeti", 0, LVZnapeti) --zapis napeti
end

--zakomentovane, LVZ ma vlastni privod mimo stykac baterii

if baterie ~= 1 then
    releEPV = false --rozhod rele EPV
    soupatkoVZ = 1
    kontrolaBdelosti = false
    Call("SetControlValue", "LVZmenic", 0, 0)
    Call("SetControlValue", "LVZzivak", 0, 0)
end

if LVZrezim > 0.75 then  --rezim posun
    if baterie == 1 and LVZstanoviste < 0.5 and LVZvypinac then --pokud je zapnuty HV, sviti vybaveni
        Call("SetControlValue", "LVZzivak", 0, 1)
    else
        Call("SetControlValue", "LVZzivak", 0, 0)
    end
end

Call("SetControlValue", "LVZvybaveni", 0, Call("GetControlValue","LVZzivak",0)) --kontrolka vybaveni

local kodNavesti = LVZ(Call("GetControlValue","SkutecnyKod",0),Call("GetControlValue","LVZzivak",0),cas,ToBolAndBack(Call("GetControlValue", "LVZmenic", 0)) and LVZstanoviste < 0.5)
--zavolej fci LVZ (fakove poruchy prenosu) a predej ji:
--      -skutecny prijaty kod z navestidla
--      -stav kontrolky vybaveni
--      -cas od posledniho update, ale realny z PC, nikoli "skoro cas" ze hry
--      -info o zapnutem / vypnutem LVZ

Call("SetControlValue","Mirel",0, kodNavesti) --watafuck??? Sorry, ale fakt netusim :D 

if kontrolaBdelosti and baterie == 1 and soupatkoVZ == 0 then --kontrola bdelosti
    LVZtimer = LVZtimer + cas
    if LVZreset <= 0.25 and LVZresetOld == 1 and LVZstanoviste < 0.5 then
        if LVZtimer > 7 then
            LVZtimer = 0
        end
        LVZresetOld = 0
    end
    if valcePrimocinne >= 1.8 and Rychlost < 15 and not LVZzkouseni then
        LVZtimer = 0
    end
    if kodNavesti == 2 or kodNavesti == 4 then
        if LVZreset >= 0.25 and LVZstanoviste < 0.5 then
            nadbytecnaObsluha = true
            Call ("SetControlValue", "ZivakPip", 0, 1)
        end
        if LVZtimer > 10 then
            LVZtimer = 10
        end
    end
    if LVZreset <= 0.25 or LVZstanoviste > 0.5 then
        nadbytecnaObsluha = false
    end
    if LVZtimer <= 7 and LVZstanoviste < 0.5 then
        Call ("SetControlValue", "LVZzivak", 0, 1)
        if not nadbytecnaObsluha then
            Call ("SetControlValue", "ZivakPip", 0, 0)
        end
    elseif LVZtimer <= 15 and LVZstanoviste < 0.5 then
        if LVZreset >= 0.25 then
            Call ("SetControlValue", "LVZzivak", 0, 1)
        else
            Call ("SetControlValue", "LVZzivak", 0, 0)
        end
        if not nadbytecnaObsluha then
            Call ("SetControlValue", "ZivakPip", 0, 0)
        end
    elseif LVZtimer <= 19 and LVZstanoviste < 0.5 then
        if LVZreset >= 0.25 then
            Call ("SetControlValue", "LVZzivak", 0, 1)
        else
            Call ("SetControlValue", "LVZzivak", 0, 0)
        end
        Call ("SetControlValue", "ZivakPip", 0, 1)
    elseif LVZtimer > 19 then
        Call ("SetControlValue", "ZivakPip", 0, 0)
        if LVZreset >= 0.25 and LVZstanoviste < 0.5 then
            Call ("SetControlValue", "LVZzivak", 0, 1)
        else
            Call ("SetControlValue", "LVZzivak", 0, 0)
        end
        soupatkoVZ = 1
    elseif LVZstanoviste > 0.5 then
        Call ("SetControlValue", "LVZzivak", 0, 0)
    end
else
    Call ("SetControlValue", "ZivakPip", 0, 0)
    Call ("SetControlValue", "LVZzivak", 0, 0)
    LVZtimer = 0
end