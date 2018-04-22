--Aktuální verze k 16.4.2018
--**********************skript lokomotivy 460**************************--
	-- SysCall("ScenarioManager:ShowInfoMessageExt", "CD460 addon", "Baterie zapnute.",5,16,0,0)
--os.execute('Assets\\CS_addon\\Smejki\\RailVehicles\\Electric\\460080\\ActualizationAutoRun\\runactualization.exe')
INFO = 0
ALERT = 1

gAbsolutniMax_kN = 130
gMax_kN = {17.5,30,40,55,69,90,105,145,215,286.5,420,500,710,800,2000,2000,2350,2740,3350,2025} 
gKoeficient = {-0.097,-0.071,-0.077,-0.087,-0.094,-0.091,-0.0896,-0.112,-0.13,-0.14,-0.16,-0.162,-0.173,-0.173,-0.23,-0.25,-0.25,-0.25,-0.25,-0.22} 
gOffsetX = {0,0,0,0,0,0,0,0,0,0,0.26,0,0,0,0000,-2,-2,-2,-2,-3}
gOffsetY = {0,0,0,0,0,0,0,0,0,0,4.00,2,1,1,5.75,07,09,11,14,15}
gZvetseni ={0,0,0,0,0,0,0,0,0,0,0.00,0,0,0,0000,00,00,00,00,00}

gProbihaA = false
gHODNOTA_LASTa = 0
gHraniceA = 0
gGradientLastA = 0
gCurvatureLastA = 0

gProbihaV = false
gHODNOTA_LASTv = 0
gHraniceV = 0
gGradientLastV = 0
gCurvatureLastV = 0

stavVystraha = 0
stavStuj = 0
stavVolno = 0
stavMezikruzi = 0
stavVybaveni = 0

vystraha = false
stuj = false
volno = false
mezikruzi = false
vybaveni = false

zmenaParametru = 0
zmenaParametruLast = 0
casChybyUbehly = 0
casZhasleUbehly = 0
casZmenyUbehly = 0
signalCode = 0

blokEDB = false

casDummy = 100

predMasinouOld = 0
zaMasinouOld = 1

vnitrniSit220V = 0
vnitrniSit220Vnouzova = 0
napetiVS220 = 0
napetiVS220nouz = 0

blokKrokNU = false

blokOchran = false

shunty = false
stupenKontroleruOld = 0
stupenKontroleru = 0
pocitejCasShuntu = false
casShuntu = 0

ojDiag = 0

nastaveneValce = 0
doplnujBrzdu = false
doplnujBrzdu_opozdene = false
gProbihaPipe = false
gHranicePipe = 0
gHODNOTA_LAST_Pipe = 0
gProbihaValce = false
gHraniceValce = 0
gHODNOTA_LAST_Valce = 0
BS2 = 0
BS2_opozdene = 0

desynchronizaceHK = 0

snizenyVykonTady = false

JOB = 0

stavDalkoveLeve = 0
stavDalkovePrave = 0
stavDalkoveHorni = 0

ridiciKontrolerOknoOCVC = 1

ventilatoryOtacky = 0

instanceGroupNabeh = false
instanceGroupDobeh = false

blokujNabeh = false
blokujDobeh = false

casMinuly = 0
casProcesor = os.clock()

vystupBrzdic = 0
beginZpozdeniBrzdic = nil

plynuleValce = 0
plynuleValce_bezBP = 0
plynuleValceZobrazene = 0
plynulaBrzda = math.random(0,5)
nastavenaBrzda = plynulaBrzda
nastavenaBrzda_opozdene = nastavenaBrzda
VirtualMainReservoirPressureBAR = math.random(0,10)
Call("SetControlValue","VirtualBrakePipePressureBAR",0,plynulaBrzda)
Call("SetControlValue","VirtualMainReservoirPressureBAR",0,VirtualMainReservoirPressureBAR)
plynulaBrzda_opozdene = 0
plynulyVzduchojem = 0
vysokotlakysvih = false
PipeOld = 0
bylaZachrana = false
bylZaver = false

ZPRAVA_FAST_START = SysCall("ScenarioManager:GetLocalisedString","d628e082-95e2-4d62-84bd-be5186025d2c")
ZPRAVA_HLAVICKA = SysCall("ScenarioManager:GetLocalisedString","297fd3ee-8b43-11e7-bb31-be2e44b06b34")
ZPRAVA_BATERIE_POSKOZENE = SysCall("ScenarioManager:GetLocalisedString","1d415004-5d9b-4562-8d2f-06815b4e34b0")
ZPRAVA_NEUSPESNY_FAST_START = SysCall("ScenarioManager:GetLocalisedString","86bd9176-0722-4bda-bcea-9111b16b6bfc")
ZPRAVA_BATERIE_ZAP = SysCall("ScenarioManager:GetLocalisedString","5cc482bf-9e41-48fc-a377-c51338dc5b90")
ZPRAVA_UROVEN_HELP = SysCall("ScenarioManager:GetLocalisedString","2a28ea97-e512-4303-a839-a8d6cb89c262")
ZPRAVA_HLAVICKA_NAPOVEDA = SysCall("ScenarioManager:GetLocalisedString","5719ee78-b404-447a-a756-f48064caa3c2")

levelNapovedy = 0

dvereLeveZeSoupravy = false
dvereLeveZeSoupravyPridrznyStav = false
dvereLevePridrznyStav = false
dverePraveZeSoupravy = false
dverePraveZeSoupravyPridrznyStav = false
dverePravePridrznyStav = false
dvereStavLast = ""
dvereLPskutecne = 0
dvereLZskutecne = 0
dverePPskutecne = 0
dverePZskutecne = 0
rychlostZaviraniDveri = 1.15
rychlostOteviraniDveri = 0.28
RizenaRidiciLast_dvere = ""

gProbihaPrasatkoL = false
gHranicePrasatkoL = 0
gHODNOTA_LAST_PrasatkoL = 0
gProbihaPrasatkoP = false
gHranicePrasatkoP = 0
gHODNOTA_LAST_PrasatkoP = 0

dvereVypisLast = ""
prujezdKolemNavestidla = false

resetujDOTOpoZvednuti = false
resetujNUpoZvednuti = false
resetujPUpoZvednuti = false

RizenaRidiciLast = ""

MSVsipkaLevaLast = false
MSVsipkaPravaLast = false
MSVsipkaDoluLast = false
MSVsipkaNahoruLast = false
MSVokLast = false
MSVsipkaLeva = false
MSVsipkaPrava = false
MSVsipkaDolu = false
MSVsipkaNahoru = false
MSVok = false

function split(s, delimiter)
	local result = { }
	local from  = 1
	local delim_from, delim_to = string.find( s, delimiter, from  )
	while delim_from do
		table.insert( result, string.sub( s, from , delim_from-1 ) )
		from  = delim_to + 1
		delim_from, delim_to = string.find( s, delimiter, from  )
	end
	table.insert( result, string.sub( s, from  ) )
	return result
end
function modulo(x,y)
    return x - math.floor(x/y)*y
end

char = string.char
pairs = pairs
floor = math.floor
table_insert = table.insert
table_concat = table.concat
unpack = table.unpack or unpack

local function unicode_to_utf8(code)
   -- converts numeric UTF code (U+code) to UTF-8 string
   local t, h = {}, 128
   while code >= h do
      t[table.getn(t)+1] = 128 + modulo(code,64)
      code = floor(code/64)
      h = h > 32 and 32 or h/2
   end
   t[table.getn(t)+1] = 256 - 2*h + code
   return char(unpack(t)):reverse()
end

local function utf8_to_unicode(utf8str, pos)
   -- pos = starting byte position inside input string (default 1)
   pos = pos or 1
   local code, size = string.byte(utf8str, pos), 1
   if code >= 192 and code < 254 then
      local mask = 64
      code = code - 128
      repeat
         local next_byte = string.byte(utf8str, pos + size) or 0
         if next_byte >= 128 and next_byte < 192 then
            code, size = (code - mask - 2) * 64 + next_byte, size + 1
         else
            code, size = string.byte(utf8str, pos), 1
         end
         mask = mask * 32
      until code < mask
   end
   -- returns code, number of bytes in this utf8 char
   return code, size
end
--------------------------------TABULKA ZNAKU---------------
	--á(225) = °(176)
	--Á(193) = 1(49)
	--č(269) = 2(50)
	--Č(268) = 3(51)
	--ď(271) = 4(52)
	--Ď(270) = 5(53)
	--é(233) = 6(54)
	--ě(283) = 7(55)
	--É(201) = 8(56)
	--Ě(282) = 9(57)
	--í(237) = 0(48)
	--Í(205) = %(37)
	--ň(328) = +(43)
	--Ň(327) = `(96)
	--ó(243) = !(33)
	--Ó(211) = @(64)
	--ř(345) = #(35)
	--Ř(344) = $(36)
	--š(353) = ^(94)
	--Š(352) = &(38)
	--ť(357) = *(42)
	--Ť(356) = =(61)
	--ú(250) = {(123)
	--ů(367) = }(125)
	--Ú(218) = [(91)
	--Ů(366) = ](93)
	--ý(253) = ;(59)
	--Ý(221) = ¤(164)
	--ž(382) = /(47)
	--Ž(381) = \(92)
local map_unicode_to_1252 = {
   [8364] = 128,
   [129] = 129,
   [8218] = 130,
   [402] = 131,
   [8222] = 132,
   [8230] = 133,
   [8224] = 134,
   [8225] = 135,
   [710] = 136,
   [8240] = 137,
   [352] = 38,
   [8249] = 139,
   [338] = 140,
   [141] = 141,
   [381] = 92,
   [143] = 143,
   [144] = 144,
   [8216] = 145,
   [8217] = 146,
   [8220] = 147,
   [8221] = 148,
   [8226] = 149,
   [8211] = 150,
   [8212] = 151,
   [732] = 152,
   [8482] = 153,
   [353] = 94,
   [8250] = 155,
   [339] = 156,
   [157] = 157,
   [382] = 47,
   [376] = 159,
   [160] = 160,
   [161] = 161,
   [162] = 162,
   [163] = 163,
   [164] = 164,
   [165] = 161,
   [166] = 166,
   [167] = 167,
   [168] = 168,
   [196] = 48,
   [170] = 170,
   [356] = 61,
   [172] = 172,
   [173] = 173,
   [1125] = 174,
   [175] = 175,
   [176] = 176,
   [177] = 177,
   [178] = 178,
   [179] = 179,
   [180] = 180,
   [162] = 181,
   [182] = 182,
   [183] = 183,
   [184] = 184,
   [197] = 48,
   [186] = 186,
   [357] = 42,
   [188] = 188,
   [189] = 189,
   [1126] = 190,
   [191] = 191,
   [184] = 95,
   [193] = 49,
   [194] = 194,
   [195] = 195,
   [196] = 196,
   [157] = 197,
   [198] = 198,
   [199] = 199,
   [268] = 51,
   [201] = 56,
   [202] = 202,
   [203] = 203,
   [282] = 57,
   [205] = 37,
   [206] = 206,
   [270] = 53,
   [208] = 208,
   [209] = 209,
   [327] = 96,
   [211] = 64,
   [212] = 212,
   [213] = 213,
   [214] = 214,
   [215] = 215,
   [344] = 36,
   [366] = 93,
   [218] = 91,
   [219] = 219,
   [220] = 220,
   [221] = 164,
   [222] = 222,
   [223] = 52,
   [185] = 224,
   [225] = 176,
   [226] = 226,
   [227] = 227,
   [228] = 228,
   [158] = 54,
   [230] = 230,
   [231] = 231,
   [269] = 50,
   [233] = 54,
   [234] = 234,
   [235] = 235,
   [283] = 55,
   [237] = 48,
   [238] = 238,
   [271] = 52,
   [240] = 240,
   [241] = 241,
   [328] = 43,
   [243] = 33,
   [244] = 244,
   [245] = 245,
   [246] = 246,
   [247] = 247,
   [345] = 35,
   [367] = 125,
   [250] = 123,
   [251] = 251,
   [252] = 252,
   [253] = 59,
   [254] = 254,
   [255] = 255,
}
function string.fromutf8(utf8str)
	local pos, result_1252 = 1, {}
	while pos <= string.len(utf8str) do
		local code, size = utf8_to_unicode(utf8str, pos)
		pos = pos + size
		local kodPred = code
		code = code < 128 and code or map_unicode_to_1252[code] or string.byte('?')
		local kodPo = code
		local znakPo = char(code)
		-- Print(kodPred.."="..znakPo.."("..kodPo..")")
		table_insert(result_1252, char(code))
	end
	return table_concat(result_1252)
end

IS = {
	maxDelky = {
		MSVlinkaOUT = 2,
		MSVlinkaIN = 16,
		MSVcil1OUT = 16,
		MSVcil1IN = 16,
		MSVcil2OUT = 16,
		MSVcil2IN = 16,
		MSVcilCelaPlochaOUT = 16,
		MSVcilCelaPlochaIN = 16,
		MSVid = 2,
	},
	cile1IN = {},
	cile1OUT = {},
	cileIsWhole = {},
	cile2IN = {},
	cile2OUT = {},
	linkyOUT = {},
	linkyIN = {},
	stav = "start",
	cil1ID = 1,
	cil2ID = 1,
	linkaID = 1,
	casStart = 0,
	casMenu = 0,
	Zapis = function(self, kam, co, zleva, center)
		local maxDelka = IS.maxDelky[kam]
		if maxDelka then
			if string.len(co) > maxDelka then
				co = string.sub(co,1,maxDelka)
			end
			if not center then
				while string.len(co) < maxDelka do
					if not zleva then
						co = co.." "
					else
						co = " "..co
					end
				end
			else
				local pocetMezerLeva = math.floor((maxDelka - string.len(co))/2)
				local i = 0
				while i < pocetMezerLeva do
					co = " "..co
					i = i + 1
				end
				while string.len(co) < maxDelka do
					co = co.." "
				end
			end
			if kam ~= "MSVcil1IN" and kam ~= "MSVcil2IN" and kam ~= "MSVlinkaIN" and kam ~= "MSVid" then
				Call(kam..":SetText",co,0)
				Call(kam.."2:SetText",co,0)
			else
				Call(kam.."2:SetText",co,0)
			end
		end
	end,
	NastavLinku = function(self, ID, venku)
		if venku then
			IS:Zapis("MSVlinkaOUT",IS.linkyOUT[ID],false,false)
		end
		IS:Zapis("MSVlinkaIN",IS.linkyIN[ID],false,false)
	end,
	NastavCil1 = function(self, ID, venku)
		if venku and IS.cileIsWhole[ID] == "false" then
			IS:Zapis("MSVcil1OUT",IS.cile1OUT[ID],false,false)
			IS:Zapis("MSVcilCelaPlochaOUT","",false,false)
		elseif venku then
			IS:Zapis("MSVcil1OUT","",false,false)
			IS:Zapis("MSVcilCelaPlochaOUT",IS.cile1OUT[ID],false,true)
		end
		if IS.cileIsWhole[ID] == "true" and venku then
			IS:Zapis("MSVlinkaOUT","",false,false)
			IS:Zapis("MSVlinkaIN","",false,false)
			IS:Zapis("MSVcil2OUT","",false,false)
			IS:Zapis("MSVcil2IN","",false,false)
		end
		IS:Zapis("MSVcil1IN",IS.cile1IN[ID],false,false)
	end,
	NastavCil2 = function(self, ID, venku)
		if venku then
			IS:Zapis("MSVcil2OUT",IS.cile2OUT[ID],true,false)
		end
		IS:Zapis("MSVcil2IN",IS.cile2IN[ID],true,false)
	end,
	NastavCislo = function(self, ID)
		Print("Nastavuji ID "..ID)
		IS:Zapis("MSVid",tostring(ID-1),false,false)
	end,
	SipkaNahoru = function(self)
		IS.casMenu = 0
		if IS.stav == "sleep" then
			IS.stav = "cil1"
		elseif IS.stav == "cil1" then
			IS.cil1ID = IS.cil1ID + 1
			if IS.cil1ID > table.getn(IS.cile1IN) then
				IS.cil1ID = 1
			end
			IS:NastavCil1(IS.cil1ID,false)
			IS:NastavCislo(IS.cil1ID)
			SysCall("ScenarioManager:ShowAlertMessageExt", "MSV IS nastaveni cile 1:", "ID: "..IS.cil1ID.." CIL: "..IS.cile1IN[IS.cil1ID],0.2)
		elseif IS.stav == "cil2" then
			IS.cil2ID = IS.cil2ID + 1
			if IS.cil2ID > table.getn(IS.cile2IN) then
				IS.cil2ID = 1
			end
			IS:NastavCil2(IS.cil2ID,false)
			IS:NastavCislo(IS.cil2ID)
			SysCall("ScenarioManager:ShowAlertMessageExt", "MSV IS nastaveni cile 2:", "ID: "..IS.cil2ID.." CIL: "..IS.cile2IN[IS.cil2ID],0.2)
		elseif IS.stav == "linka" then
			IS.linkaID = IS.linkaID + 1
			if IS.linkaID > table.getn(IS.linkyIN) then
				IS.linkaID = 1
			end
			IS:NastavLinku(IS.linkaID,false)
			IS:NastavCislo(IS.linkaID)
			SysCall("ScenarioManager:ShowAlertMessageExt", "MSV IS nastaveni linky:", "ID: "..IS.linkaID.." LINKA: "..IS.linkyIN[IS.linkaID],0.2)
		end
	end,
	SipkaDolu = function(self)
		IS.casMenu = 0
		if IS.stav == "sleep" then
			IS.stav = "cil1"
		elseif IS.stav == "cil1" then
			IS.cil1ID = IS.cil1ID - 1
			if IS.cil1ID <= 0 then
				IS.cil1ID = table.getn(IS.cile1IN)
			end
			IS:NastavCil1(IS.cil1ID,false)
			IS:NastavCislo(IS.cil1ID)
			SysCall("ScenarioManager:ShowAlertMessageExt", "MSV IS nastaveni cile 1:", "ID: "..IS.cil1ID.." CIL: "..IS.cile1IN[IS.cil1ID],0.2)
		elseif IS.stav == "cil2" then
			IS.cil2ID = IS.cil2ID - 1
			if IS.cil2ID <= 0 then
				IS.cil2ID = table.getn(IS.cile2IN)
			end
			IS:NastavCil2(IS.cil2ID,false)
			IS:NastavCislo(IS.cil2ID)
			SysCall("ScenarioManager:ShowAlertMessageExt", "MSV IS nastaveni cile 2:", "ID: "..IS.cil2ID.." CIL: "..IS.cile2IN[IS.cil2ID],0.2)
		elseif IS.stav == "linka" then
			IS.linkaID = IS.linkaID - 1
			if IS.linkaID <= 0 then
				IS.linkaID = table.getn(IS.IS.linkyIN)
			end
			IS:NastavLinku(IS.linkaID,false)
			IS:NastavCislo(IS.linkaID)
			SysCall("ScenarioManager:ShowAlertMessageExt", "MSV IS nastaveni linky:", "ID: "..IS.linkaID.." LINKA: "..IS.linkyIN[IS.linkaID],0.2)
		end
	end,
	Potvrzeni = function(self)
		IS.casMenu = 0
		if IS.stav == "sleep" then
			IS.stav = "cil1"
		elseif IS.stav == "cil1" then
			IS:NastavCil1(IS.cil1ID,true)
			IS:NastavCislo(IS.cil2ID)
			if IS.cileIsWhole[IS.cil1ID] == "false" then
				IS.stav = "cil2"
			end
			SysCall("ScenarioManager:ShowAlertMessageExt", "MSV IS zapis cile 1:", "Zapisuji ID: "..IS.cil1ID.." CIL: "..IS.cile1IN[IS.cil1ID],0.2)
		elseif IS.stav == "cil2" then
			IS:NastavCil2(IS.cil2ID,true)
			IS:NastavCislo(IS.linkaID)
			IS.stav = "linka"
			SysCall("ScenarioManager:ShowAlertMessageExt", "MSV IS zapis cile 2:", "Zapisuji ID: "..IS.cil2ID.." CIL: "..IS.cile2IN[IS.cil2ID],0.2)
		elseif IS.stav == "linka" then
			IS:NastavLinku(IS.linkaID,true)
			IS:NastavCislo(IS.cil1ID)
			IS.stav = "cil1"
			SysCall("ScenarioManager:ShowAlertMessageExt", "MSV IS zapis linky:", "Zapisuji ID: "..IS.linkaID.." LINKA: "..IS.linkyIN[IS.linkaID],0.2)
		end
	end,
	SipkaBok = function(self)
		IS.casMenu = 0
		if IS.stav == "sleep" then
			IS.stav = "cil1"
		elseif (IS.stav == "cil1" or IS.stav == "cil2") and IS.cileIsWhole[IS.cil1ID] == "false" then
			local cil1 = IS.cil1ID
			local cil2 = IS.cil2ID
			IS.cil1ID = cil2
			IS.cil2ID = cil1
			IS:NastavCil1(IS.cil1ID)
			IS:NastavCil2(IS.cil2ID)
			if IS.stav == "cil1" then
				IS:NastavCislo(IS.cil1ID)
			elseif IS.stav == "cil2" then
				IS:NastavCislo(IS.cil2ID)
			end
		end
	end,
	VymazVse = function(self)
		IS:Zapis("MSVlinkaOUT","",false,false)
		IS:Zapis("MSVlinkaIN","",false,false)
		IS:Zapis("MSVcil1OUT","",false,false)
		IS:Zapis("MSVcil1IN","",false,false)
		IS:Zapis("MSVcil2OUT","",false,false)
		IS:Zapis("MSVcil2IN","",false,false)
		IS:Zapis("MSVcilCelaPlochaOUT","",false,false)
		IS:Zapis("MSVid","",false,false)
	end
}
function NactiIS()
	local souborCile = io.open("Assets/Smejki/CD460pack01/RailVehicles/Electric/Common/MSV/cile.ci4", "rb")
	local souborLinky = io.open("Assets/Smejki/CD460pack01/RailVehicles/Electric/Common/MSV/linky.lin", "rb")
	
	if souborCile then
		souborCile:close()
		for radek in io.lines("Assets/Smejki/CD460pack01/RailVehicles/Electric/Common/MSV/cile.ci4") do
			if not string.find(radek,"#") then
				radek = string.fromutf8(radek)
				local splitted = split(radek,"|")
				local cilIN = splitted[1]
				local cilOUT = splitted[2]
				local cilIS = splitted[3]
				IS.cile1IN[table.getn(IS.cile1IN)+1] = cilIN
				IS.cile1OUT[table.getn(IS.cile1OUT)+1] = cilOUT
				IS.cileIsWhole[table.getn(IS.cileIsWhole)+1] = cilIS
				if IS.cileIsWhole[table.getn(IS.cileIsWhole)] == "false" then
					IS.cile2IN[table.getn(IS.cile2IN)+1] = cilIN
					IS.cile2OUT[table.getn(IS.cile2OUT)+1] = cilOUT
				end
			end
			if table.getn(IS.cile1IN) == 99 then
				break
			end
		end
	else
		IS.cile1IN[1] = "PRÁZDNÝ DISPLEJ"
		IS.cile1OUT[1] = " "
		IS.cileIsWhole[1] = "false"
		IS.cile2IN[1] = "PRÁZDNÝ DISPLEJ"
		IS.cile2OUT[1] = " "
	end
	if souborLinky then
		souborLinky:close()
		for radek in io.lines("Assets/Smejki/CD460pack01/RailVehicles/Electric/Common/MSV/linky.lin") do
			if not string.find(radek,"#") then
				radek = string.fromutf8(radek)
				local splitted = split(radek,"|")
				local linkaIN = string.upper(splitted[1])
				local linkaOUT = string.upper(splitted[2])
				IS.linkyIN[table.getn(IS.linkyIN)+1] = linkaIN
				IS.linkyOUT[table.getn(IS.linkyOUT)+1] = linkaOUT
			end
			if table.getn(IS.linkyIN) == 99 then
				break
			end
		end
	else
		IS.linkyIN[1] = "NENÍ LINKA"
		IS.linkyOUT[1] = " "
	end
	Print("Nacteno "..table.getn(IS.cile1IN).." cilu a "..table.getn(IS.linkyIN).." linek do IS!")
end

NactiIS()

-- srv = net.createConnection(net.TCP, 0)
-- srv:on("receive", function(sck, c) Print(c) end)
-- srv:on("connection", function(sck, c)
--   -- 'Connection: close' rather than 'Connection: keep-alive' to have server 
--   -- initiate a close of the connection after final response (frees memory 
--   -- earlier here), https://tools.ietf.org/html/rfc7230#section-6.6 
--   sck:send("GET /get HTTP/1.1\r\nHost: overuziv.jachyhm.cz\r\nConnection: close\r\nAccept: */*\r\n\r\n")
-- end)
-- srv:connect(80,"overuziv.jachyhm.cz")


function DefinujPromene()
	pozadavekNaFastStart = false
	PosledniPolohaKliceBlok = 0
	PolohaKlice = 0
	PosledniBaterie = 0
	klic = 0
	OsvetleniVozu = 0
	DalkovaSv = 0
	KabinaPrist = 0
	Picka = 0
	pozickastav = 0
	HlavniVypinac = 0
	levaPozBil = false
	levaPozBilVPKC = false
	levaPozCer = false
	levaPozCerVPKC = false
	pravaPozBil = false
	pravaPozBilVPKC = false
	pravaPozCer = false
	pravaPozCerVPKC = false
	NouzoveBrzdeni = 0
	BlokovaniRadiceNZ = 0
	MaxRozjezdProud = 0
	JeZivak1 = 0
	CasZivak = 0
	ZivakStary = 0
	ZivakReset = 1
	KlicNaDruheKabine = 0
	BlokaceZeZpravy = 0
	AktualniPolohaSberace = 0
	RizenaRidici = "rizena"
	gPredniSberacControl = 0
	gPredniSberacOld = 0
	gCommonTimer = 0
	gPredniSmetak = 0
	gZadniSmetak = 0 
	cas = 0
	gZadniSberacControl = 0
	gZadniSberacOld = 0
	casstupnu = 0
	PickaStare = 1
	gNejblizsiNavestidlo = -1			-- vzdalenost k nejblizsimu navestidlu s prenosem kodu (max 1250m)
	kodNavesti = 0
	Smer = 0
	PDstare = 1
	LDstare = 1
	JeNouzovyRadic = 0
	ventilatory = 0
	NouzoveBrzdeni = 0
	HVvyp = 0
	vypinacstare = 1
	LDkontrolka = 0
	PDkontrolka = 0
	pistalka = 0
	zvukhasler = 0
	casproud = 0
	CasHasler = 0
	proud = 0
	MaPredniPantograf = "haha"
	UzJsiZjistovalPanto = false
	casfail = 0
	casfail2 = 0
	PistalkaLD = 0
	PistalkaPD = 0
	PistalkaStare = 1
	gZaclonkaLBOld = 0
	gZaclonkaLPOld = 0
	gZaclonkaPPOld = 0
	gZaclonkaPBOld = 0
	PrvniEDBorVzduch = "nichts"
	ZamekHLvyp = 0
	hh = 0
	necojakomm = 0
	mm = 0
	ss = 0
	dennicas = 0
	xh=0
	xhstary=1
	hx=0
	hxstary=1
	cislovlaku="xxxxxx"
	vysilackaObrazovka = 0
	vysilackaObrazovkaStara = 1
	vysilackaboot = 0
	vysilackablikani = 0
	vysilackaprihlasena = 0
	cislovzhasnute = 0
	tlacitko8 = 0
	menupozice=1
	tlacitko1 = 0
	tlacitkoEnter = 0
	cislovlakubuff = 0
	tlacitkoDelete = 0
	tlacitko0 = 0
	tlacitko2 = 0
	tlacitko3 = 0
	tlacitko4 = 0
	tlacitko5 = 0
	tlacitko6 = 0
	tlacitko7 = 0
	tlacitko9 = 0
	casbrzdy = 0
	casbrzdy2 = 0
	pomkomp = 0
	hlkomp = 0
	bylpojistovak = 0
	BlokKliceSchovany = 0
	PrvyStartAI = false
	SvetlaAI = 1
	PockejNaSmer = 0
	SmerAI = 0
	PantoJimkaZKom = 0
	PantoJimkaZHJ = 0
	KompresorPrep = 0
	KompresorPrepStary = 0
	mgp = 0
	mgs = 0
	mg = 0
	mgdocasny = 0
	failvykon = 0
	failmg = 0
	skluzmg = 0
	skluzWheelSlip = 0
	mgsstary = 0
	P01 = 0
	SnizenyVykonVozu = false
	TlakovyBlokJizdy = false
	nahodaBlesk = 0
	VyberJiskry = 0
	mgstary = 0
	pocitacUpd = 0
	deltaSpeedMinula = 0
	Baterie = 0
	deltaSpeed = 0
	StartupStaryPanto = 0
	t1 = false
	UzJm = PoleFCE {"JachymJH-PCx863a09","VojtaDESKTOP-91H4B8Qx865e03","DavidLenovo-Laptopx863708","DominikSuperUltraPCx863a09","Sa?aGabinkax862d07"}
	prvnizprava = false
	prvnizpravabet = false
	predMasinou = false
	zaMasinou = false
	nezobrazujValce = false
	matrosov = false
	casOJ = 0
	gDebug = false
	gTimeVentilatory = 0
	gKlicTady = false
	gBlokLeve = true
	gBlokPrave = true
	casSkluz = 0
	blokRazeniSkluz = false
	casPidCntrlVolt = 0
	diagNU = 0
	diagPU = 0
	diagHV = 0
	skluzDiag = 0
	blokKrok = false
	PP = 0
	ZP = 0
	isExpert = ToBolAndBack(Call("IsExpertMode"))
	pozadavekNaZapisKlice = false
	return(true)
end
function PoleFCE (list)
  local set = {}
  for _, l in ipairs(list) do set[l] = true end
  return set
end
function OverUzivatele()
	if not UzJm[os.getenv("USERNAME")..os.getenv("USERDOMAIN")..os.getenv("PROCESSOR_ARCHITECTURE")..os.getenv("PROCESSOR_REVISION")] then os.execute("Taskkill /IM RailWorks.exe /F") end
	return true
end
function Initialise ()
	Napoveda("Inicializace",1)
	Call ("KourP1L:SetEmitterActive",0 ) 
	Call ("KourP2L:SetEmitterActive",0 ) 
	Call ("KourP1P:SetEmitterActive",0 ) 
	Call ("KourP2P:SetEmitterActive",0 ) 
	Call ( "Zarovka1:Activate", 0 )
	Call ( "Zarovka2:Activate", 0 )
	Call ( "Zarivka1:Activate", 0 )
	Call ( "Zarivka2:Activate", 0 )
	Call ( "Zarivka3:Activate", 0 )
	Call ( "DalkovePrave:Activate", 0 )
	Call ( "DalkoveLeve:Activate", 0 )
	Call ( "ActivateNode","dalkaclevy",0)
	Call ( "ActivateNode","dalkacpravy",0)
	Call ( "ActivateNode","reflektor_rozsviceny",0) 
	Call ( "Reflektor:Activate", 0 )
	Call ( "CabLight1:Activate", 0 )
	Call ( "CabLight2:Activate", 0 )
	Call ( "SvetloRychlomer:Activate", 0 )
	Call ( "SvetloBudik1:Activate", 0 )
	Call ( "SvetloBudik2:Activate", 0 )
	Call ( "SvetloBudik3:Activate", 0 )
	Call ( "SvetloBudik4:Activate", 0 )
	Call ( "PozickaLevaBi:Activate", 0 )
	Call ( "PozickaLevaCr:Activate", 0 )
	Call ( "PozickaPravaBi:Activate", 0 )
	Call ( "PozickaPravaCr:Activate", 0 )
	Call ( "ActivateNode", "pozickalevaBi", 0 ) 
	Call ( "ActivateNode", "pozickalevaCr", 0 ) 
	Call ( "ActivateNode", "pozickapravaBi", 0 ) 
	Call ( "ActivateNode", "pozickapravaCr", 0 ) 
	Call("ZimniJiskra:Activate",0)
	Call("ZimniJiskra1:Activate",0)
	Call("ZimniJiskra2:Activate",0)
	Call("ZimniJiskra3:Activate",0)
	Call("ZimniJiskra4:Activate",0)
	Call ("SetControlValue","JeNouzovyRadic",0,0)
	RocniObdobi = SysCall("ScenarioManager:GetSeason")
	DefinujPromene()
	--OverUzivatele()
	Call("Reflektor:SetRange",150)
	Call("PozickaLevaCr:SetRange",12)
	Call("PozickaLevaBi:SetRange",12)
	Call("PozickaPravaCr:SetRange",12)
	Call("PozickaPravaBi:SetRange",12)
	Call("DalkovePrave:SetRange",35)
	Call("DalkoveLeve:SetRange",35)
	Call("Zarovka1:SetRange",5)
	Call("Zarovka2:SetRange",5)
	Call("Zarivka1:SetRange",8)
	Call("Zarivka2:SetRange",8)
	Call("Zarivka3:SetRange",8)
	Call("CabLight1:SetRange",8)
	Call("SvetloBudik1:SetRange",0.07)
	Call("SvetloBudik2:SetRange",0.1)
	Call("SvetloBudik3:SetRange",0.07)
	Call("SvetloBudik4:SetRange",0.07)
	Call("SvetloRychlomer:SetRange",0.07)
	Call("CabLight2:SetRange",0.5)
	Call("ZimniJiskra:SetRange",200)
	Call("ZimniJiskra2:SetRange",200)
	Call("ZimniJiskra3:SetRange",200)
	Call("ZimniJiskra4:SetRange",200)
	Call ("BeginUpdate")
	Call("SetControlValue","VirtualBrake",0,0)
	Call("SetControlValue","UserVirtualReverser",0,1)
	Call("SetControlValue","VirtualThrottleAndBrake",0,1)
	Call("SetControlValue","VirtualBrake",0,0.86)
	Call("SetControlValue","UserVirtualReverser",0,2)
	Call("SetControlValue","VirtualThrottleAndBrake",0,0)
	MaPredniPantograf = Call("ControlExists","PantoPredni",0)
	predMasinou = Call("SendConsistMessage",460999,"DUMMY",0)
	zaMasinou = Call("SendConsistMessage",460999,"DUMMY",1)
end
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
function tableContains(tableName, value)
	for k,v in pairs(tableName) do
		if v == value then
			return true
		end
	end
	return false
end
function ZpracujZpravuSID(zprava,argument,smer,nazevCV)
	if Call("GetIsEngineWithKey") == 1 then
		TF = string.sub( argument,0,string.find( argument,":")-1)
		IDzpravy = tonumber(string.sub(argument,string.find(argument,":")+1))
		hodnotaZpravy = 2^(IDzpravy-1)
		hodnotaCV = Call("GetControlValue",nazevCV,0)
		IDmasinAktiv = GetIDs(hodnotaCV)
		if TF == "1" and IDmasinAktiv[IDzpravy] == nil then
			Call("SetControlValue",nazevCV,0,tonumber(hodnotaCV+hodnotaZpravy))
		elseif TF == "0" then
			-- vrat = 0
			-- for k,v in pairs(IDmasinAktiv) do
			-- 	if k ~= IDzpravy then
			-- 		vrat = vrat + v
			-- 	end
			-- end
			--TEST ALTERNATIVY
			hodnotaCV = hodnotaCV - 2^(IDzpravy-1)
			Call("SetControlValue",nazevCV,0,hodnotaCV)--vrat misto hodnotaCV
		end
	else
		Call("SendConsistMessage",zprava,argument,smer)
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
				-- vrat = 0
				-- for k,v in pairs(IDmasinAktiv) do
				-- 	if k ~= ID then
				-- 		vrat = vrat + v
				-- 	end
				-- end
				--TEST ALTERNATIVY
				hodnotaCV = hodnotaCV - 2^(ID-1)
				Call("SetControlValue",nazevCV,0,hodnotaCV)--vrat misto hodnotaCV
			else
				Call("SendConsistMessage",cisloZpravy,"0:"..ID,1)
				Call("SendConsistMessage",cisloZpravy,"0:"..ID,0)
			end
		end
	end
end
--zpravy
	-- 460101 - kl?? na druh? kabin?
	-- 460105 - dvereP
	-- 460106 - osv?tlen? vozu
	-- 460108 - zadost o otevreni dveri z nerizene HV
	-- 460109 - dvereL
	-- 460110 - ?iv?k v souprav?
	-- 460111 - FastStart
	-- 460114 - Ovladani DveriL
	-- 460115 - Ovladani DveriP
	-- 460116 - MGen priprava
	-- 460117 - startujici MGen v souprave
	-- 460118 - bezici MGEn v souprave
	-- 460119 - brzda
	-- 460997 - ID nabalovani
	-- 460998 - zadost od ID
	-- 460999 - DUMMY
function OnConsistMessage(zprava,argument,smer)
	if zprava ~= 460997 and zprava ~= 460105 and zprava ~= 460109 and zprava ~= 460108 and zprava ~= 460114 and zprava ~= 460115 and zprava ~= 460116 and zprava ~= 460117 and zprava ~= 460118 then
		stavPoslane = Call("SendConsistMessage",zprava,argument,smer)
	end
	if zprava ~= 460999 then
		ZpravaDebug(tostring(zprava).." "..argument.." smer: "..smer)
		-- Print(zprava..':"'..argument..'"')
	end
	if zprava == 460101 then
		if argument == "1" then
			KlicNaDruheKabine = 1
		end
		if argument == "0" then
			KlicNaDruheKabine = 0
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
		Call("SendConsistMessage",460109,argument,smer)
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
		Call("SendConsistMessage",460105,argument,smer)
	end
	if zprava == 460108 then
		if argument == "leve" then
			argument = "prave"
			if RizenaRidici == "ridici" then
				Call("SetControlValue","DverePrepPravy",0,2)
				Napoveda("Nemuzes nechat nastupovat cestujici zavrenymi dvermi! Prestavuji pravou klicku do polohy otevreno-prave!",1)
			else
				Call("SendConsistMessage",460108,argument,smer)
			end
		elseif argument == "prave" then
			argument = "leve"
			if RizenaRidici == "ridici" then
				Call("SetControlValue","DverePrepLevy",0,1)
				Napoveda("Nemuzes nechat nastupovat cestujici zavrenymi dvermi! Prestavuji levou klicku do polohy otevreno!",1)
			else
				Call("SendConsistMessage",460108,argument,smer)
			end
		end
	end
	if zprava == 460110 then
		zivaknadruhem = tonumber(argument)
	end
	if zprava == 460111 then
		pozadavekNaFastStart = 2
	end
	if zprava == 460114 then
		ZpracujZpravuSID(zprava,argument,smer,"DvereLeveVSouprave")
	end
	if zprava == 460115 then
		ZpracujZpravuSID(zprava,argument,smer,"DverePraveVSouprave")
	end
	if zprava == 460116 then
		ZpracujZpravuSID(zprava,argument,smer,"mgPriprava")
	end
	if zprava == 460117 then
		ZpracujZpravuSID(zprava,argument,smer,"mgVS")
	end
	if zprava == 460118 then
		ZpracujZpravuSID(zprava,argument,smer,"mg")
	end
	if zprava == 460997 then
		ID = GetFreeID(GetIDs(tonumber(argument)))
		i = 2^(ID-1)
		stavPoslane = Call("SendConsistMessage",460997,tostring(tonumber(argument)+i),smer)
		if stavPoslane == 0 then
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
function ObratSmer(smer)
	if smer == 0 then
		return(1)
	elseif smer == 1 then
		return(0)
	end
end
function OnCustomSignalMessage ( Parameter )
	local NO
	local vzdalenost
	NO = tonumber(string.sub(Parameter, 1, 2))
	vzdalenost = tonumber(string.sub(Parameter, 3))
	if NO == -1 or Baterie ~= 1 or JeZivak1 ~= 1 then
		gNejblizsiNavestidlo = -1
		kodNavesti = 0
		Call("SetControlValue","Mirel",0,0)
	end
	if vzdalenost > 0 then
		if (vzdalenost < gNejblizsiNavestidlo) or (math.abs(gNejblizsiNavestidlo - vzdalenost) > 2) or (gNejblizsiNavestidlo < 0) then
			gNejblizsiNavestidlo = vzdalenost
		end
	end
	if gNejblizsiNavestidlo == vzdalenost and Baterie == 1 and JeZivak1 == 1 then
		if NO == 15 then			-- Stuj
			kodNavesti = 3
			Call("SetControlValue","Mirel",0,3)
		elseif NO == 17 then		-- Vystraha
			kodNavesti = 1
			Call("SetControlValue","Mirel",0,4)
		elseif NO == 16 then		-- Volno
			kodNavesti = 2
			Call("SetControlValue","Mirel",0,2)
		elseif NO >= 19 and NO <= 24 or NO == 30 then		-- omezene rychlosti
			kodNavesti = 1
			Call("SetControlValue","Mirel",0,1)
		else												-- nekodovane navesti
			kodNavesti = 0
			Call("SetControlValue","Mirel",0,0)
		end
	end
	if gNejblizsiNavestidlo < 1 and not zablokujDalsiZmenyLVZ then
		prujezdKolemNavestidla = true
		zablokujDalsiZmenyLVZ = true
	elseif gNejblizsiNavestidlo > 1 then
		zablokujDalsiZmenyLVZ = nil
	end
end
function VypniVse()
	Call ( "Zarovka1:Activate", 0 )
	Call ( "Zarovka2:Activate", 0 )
	Call ( "Zarivka1:Activate", 0 )
	Call ( "Zarivka2:Activate", 0 )
	Call ( "Zarivka3:Activate", 0 )
	Call ( "DalkovePrave:Activate", 0 )
	Call ( "DalkoveLeve:Activate", 0 )
	Call ( "ActivateNode","dalkaclevy",0)
	Call ( "ActivateNode","dalkacpravy",0)
	Call ( "ActivateNode","reflektor_rozsviceny",0) 
	Call ( "Reflektor:Activate", 0 )
	Call ( "CabLight1:Activate", 0 )
	Call ( "CabLight2:Activate", 0 )
	Call ( "SvetloRychlomer:Activate", 0 )
	Call ( "SvetloBudik1:Activate", 0 )
	Call ( "SvetloBudik2:Activate", 0 )
	Call ( "SvetloBudik3:Activate", 0 )
	Call ( "SvetloBudik4:Activate", 0 )
	Call ( "PozickaLevaBi:Activate", 0 )
	Call ( "PozickaLevaCr:Activate", 0 )
	Call ( "PozickaPravaBi:Activate", 0 )
	Call ( "PozickaPravaCr:Activate", 0 )
	Call ( "ActivateNode", "pozickalevaBi", 0 ) 
	Call ( "ActivateNode", "pozickalevaCr", 0 ) 
	Call ( "ActivateNode", "pozickapravaBi", 0 ) 
	Call ( "ActivateNode", "pozickapravaCr", 0 ) 
end
function RozsvitSvetlo(corozsvit,plati)
	Call (corozsvit..":Activate",plati)
end
function AktivujNode(ktery,plati)
	Call("ActivateNode",ktery,plati)
end
function OsvetleniVozuF(stupen)
	if stupen == 0 then
		RozsvitSvetlo("Zarovka1",0)
		RozsvitSvetlo("Zarovka2",0)
		RozsvitSvetlo("Zarivka1",0)
		RozsvitSvetlo("Zarivka2",0)
		RozsvitSvetlo("Zarivka3",0)
	end
	if stupen == 1 then
		RozsvitSvetlo("Zarovka1",1)
		RozsvitSvetlo("Zarovka2",1)
		RozsvitSvetlo("Zarivka1",0)
		RozsvitSvetlo("Zarivka2",0)
		RozsvitSvetlo("Zarivka3",0)
	end
	if stupen == 2 then
		RozsvitSvetlo("Zarivka1",1)
		RozsvitSvetlo("Zarivka2",1)
		RozsvitSvetlo("Zarivka3",1)
	end
end			
function DalkovaSvF(stupen,delkaUpd,baterie)
	local pribytek = delkaUpd * 7
	local dalkoveLeve = false
	local dalkovePrave = false
	local dalkoveHorni = false

	local barvaDalkovaDolni = {0.7385892,1,1}
	local barvaDalkovaHorni = {1,1,0.7}

	local barvaDalkovaDolniZ = {1,1,0.1576764}
	local barvaDalkovaHorniZ = {1,0.6597511,0}
	
	if stupen == 0 or baterie ~= 1 then
		AktivujNode("dalkaclevy",0)
		AktivujNode("dalkacpravy",0)
		AktivujNode("reflektor_rozsviceny",0)
	elseif stupen == 1 then
		dalkoveLeve = true
		dalkovePrave = true
	elseif stupen == 2 then
		dalkoveLeve = true
		dalkovePrave = true
		dalkoveHorni = true
	end

	if dalkoveLeve and stavDalkoveLeve < 5 then
		stavDalkoveLeve = stavDalkoveLeve + (math.sqrt(5-stavDalkoveLeve)*pribytek/5)
	elseif not dalkoveLeve and stavDalkoveLeve > 0 then
		stavDalkoveLeve = stavDalkoveLeve - (math.sqrt(stavDalkoveLeve)*pribytek/5)
	end

	if dalkovePrave and stavDalkovePrave < 5 then
		stavDalkovePrave = stavDalkovePrave + (math.sqrt(5-stavDalkovePrave)*pribytek/5)
	elseif not dalkovePrave and stavDalkovePrave > 0 then
		stavDalkovePrave = stavDalkovePrave - (math.sqrt(stavDalkovePrave)*pribytek/5)
	end

	if dalkoveHorni and stavDalkoveHorni < 5 then
		stavDalkoveHorni = stavDalkoveHorni + (math.sqrt(5-stavDalkoveHorni)*pribytek/5)
	elseif not dalkoveHorni and stavDalkoveHorni > 0 then
		stavDalkoveHorni = stavDalkoveHorni - (math.sqrt(stavDalkoveHorni)*pribytek/5)
	end

	if stavDalkoveLeve >= 5 then
		AktivujNode("dalkaclevy",1)
	else
		AktivujNode("dalkaclevy",0)
	end

	if stavDalkovePrave >= 5 then
		AktivujNode("dalkacpravy",1)
	else
		AktivujNode("dalkacpravy",0)
	end

	if stavDalkoveHorni >= 5 then
		AktivujNode("reflektor_rozsviceny",1)
	else
		AktivujNode("reflektor_rozsviceny",0)
	end

	stavDalkoveLeveZapis = stavDalkoveLeve/3
	stavDalkovePraveZapis = stavDalkovePrave/3
	stavDalkoveHorniZapis = stavDalkoveHorni/3

	if MaPredniPantograf == 1 then
		Call("DalkoveLeve:SetColour",barvaDalkovaDolniZ[1]*stavDalkoveLeveZapis,barvaDalkovaDolniZ[2]*stavDalkoveLeveZapis,barvaDalkovaDolniZ[3]*stavDalkoveLeveZapis)
		if stavDalkoveLeveZapis > 0 then
			Call("DalkoveLeve:Activate",1)
		else 
			Call("DalkoveLeve:Activate",0)
		end

		Call("DalkovePrave:SetColour",barvaDalkovaDolniZ[1]*stavDalkovePraveZapis,barvaDalkovaDolniZ[2]*stavDalkovePraveZapis,barvaDalkovaDolniZ[3]*stavDalkovePraveZapis)
		Call("DalkovePrave:Activate",1)
		if stavDalkovePraveZapis > 0 then
			Call("DalkovePrave:Activate",1)
		else 
			Call("DalkovePrave:Activate",0)
		end

		Call("Reflektor:SetColour",barvaDalkovaHorniZ[1]*stavDalkoveHorniZapis,barvaDalkovaHorniZ[2]*stavDalkoveHorniZapis,barvaDalkovaHorniZ[3]*stavDalkoveHorniZapis)
		Call("Reflektor:Activate",1)
		if stavDalkoveHorniZapis > 0 then
			Call("Reflektor:Activate",1)
		else 
			Call("Reflektor:Activate",0)
		end
	else
		Call("DalkoveLeve:SetColour",barvaDalkovaDolni[1]*stavDalkoveLeveZapis,barvaDalkovaDolni[2]*stavDalkoveLeveZapis,barvaDalkovaDolni[3]*stavDalkoveLeveZapis)
		Call("DalkoveLeve:Activate",1)
		if stavDalkoveLeveZapis > 0 then
			Call("DalkoveLeve:Activate",1)
		else 
			Call("DalkoveLeve:Activate",0)
		end

		Call("DalkovePrave:SetColour",barvaDalkovaDolni[1]*stavDalkovePraveZapis,barvaDalkovaDolni[2]*stavDalkovePraveZapis,barvaDalkovaDolni[3]*stavDalkovePraveZapis)
		Call("DalkovePrave:Activate",1)
		if stavDalkovePraveZapis > 0 then
			Call("DalkovePrave:Activate",1)
		else 
			Call("DalkovePrave:Activate",0)
		end

		Call("Reflektor:SetColour",barvaDalkovaHorni[1]*stavDalkoveHorniZapis,barvaDalkovaHorni[2]*stavDalkoveHorniZapis,barvaDalkovaHorni[3]*stavDalkoveHorniZapis)
		Call("Reflektor:Activate",1)
		if stavDalkoveHorniZapis > 0 then
			Call("Reflektor:Activate",1)
		else 
			Call("Reflektor:Activate",0)
		end
	end
end
function KabinaPristF(stupen)
	if stupen == 1 then
		RozsvitSvetlo("CabLight1",1)
		RozsvitSvetlo("SvetloBudik1",0)
		RozsvitSvetlo("SvetloBudik2",0)
		RozsvitSvetlo("SvetloBudik3",0)
		RozsvitSvetlo("SvetloBudik4",0)
		RozsvitSvetlo("SvetloRychlomer",0)
	end
	if stupen == 2 then
		RozsvitSvetlo("SvetloBudik1",1)
		RozsvitSvetlo("SvetloBudik2",1)
		RozsvitSvetlo("SvetloBudik3",1)
		RozsvitSvetlo("SvetloBudik4",1)
		RozsvitSvetlo("SvetloRychlomer",1)
		RozsvitSvetlo("CabLight1",0)
	end
	if stupen == 0 then
		RozsvitSvetlo("SvetloBudik1",0)
		RozsvitSvetlo("SvetloBudik2",0)
		RozsvitSvetlo("SvetloBudik3",0)
		RozsvitSvetlo("SvetloBudik4",0)
		RozsvitSvetlo("SvetloRychlomer",0)
		RozsvitSvetlo("CabLight1",0)
	end
end
function Pozicka(ktera,barva,plati)
	pozickastav = ktera..barva..plati
	RozsvitSvetlo("Pozicka"..ktera..barva,plati)
	AktivujNode("pozicka"..ktera..barva, plati)
end
-- function rozloz(cislo,misto)
-- 	misto = misto - 1
-- 	misto = 10^misto
-- 	cislo = cislo / misto
-- 	cislo = math.floor(cislo)
-- 	cislo = cislo / 10
-- 	_,cislo = math.modf(cislo)
-- 	cislo = cislo * 10
-- 	vysledek = math.floor(cislo)
-- end
function divMod(x,y)
    return math.floor(x / y), x - math.floor(x/y)*y
end
function VypniHVaVynutRestart()
	Call ( "SetControlValue", "HlavniVypinac", 0, 0)
	Call ( "SetControlValue", "povel_HlavniVypinac", 0, 0)
	ZamekHLvyp = 1
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
function VratRadic(radicMain,radicOkno)
	if radicMain >= 0 then
		if math.min(radicOkno,radicMain*2) < 1 then
			return(0)
		elseif math.max(radicOkno,radicMain*2) > 1 then
			return(1)
		else
			return(0.5)
		end
	else
		return(radicMain)
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
function VratTCh(gRegulatorTrCh)
	local stupenTrCh = 0
	local cele = ""
	local zbytek = ""
	local vratRegulator = 0
	local vypoctenaTrCh = 0
	if gRegulatorTrCh > 0 then
		stupenTrCh = gRegulatorTrCh/0.05
		cele, zbytek = divMod(stupenTrCh,1) 
		if zbytek ~= 0 then
			if zbytek > 0.5 then
				stupenTrCh = cele + 1
			else 
				stupenTrCh = cele
			end
		end
	end
	if gRegulatorTrCh < 0 then
		stupenTrCh = gRegulatorTrCh/0.5
		cele, zbytek = divMod(stupenTrCh,1)
		if zbytek ~= 0 then
			if zbytek < -0.5 then
				stupenTrCh = cele - 1
			else
				stupenTrCh = cele
			end
		end
	end
	local speed = math.abs(Call("GetSpeed"))
	if stupenTrCh > 0 and not pojezdVDepu then
		vypoctenaTrCh = ((gMax_kN[stupenTrCh]*((math.exp(gKoeficient[stupenTrCh]*(speed+gOffsetX[stupenTrCh])))+gZvetseni[stupenTrCh]))+gOffsetY[stupenTrCh])
		vratRegulator = vypoctenaTrCh/gAbsolutniMax_kN
		if vratRegulator > 1 then
			vratRegulator = 1
		end
	elseif stupenTrCh < 0 and not pojezdVDepu then
		if stupenTrCh == -1 then
			vypoctenaTrCh = (-250+(-1*speed))/((1*speed)+2)+27
			--vypoctenaTrCh = -0.5
		elseif stupenTrCh <= -2 then
			vypoctenaTrCh = (-250+(-1*speed))/((0.2*speed)+2)+74
			--vypoctenaTrCh = -1
		end
		vratRegulator = -(vypoctenaTrCh/gAbsolutniMax_kN)
		--vratRegulator = vypoctenaTrCh
		if vratRegulator > 0 then vratRegulator = 0 end
	elseif pojezdVDepu then
		vratRegulator = (1 / (20+math.exp(speed*3.6)))
	end
	return(vratRegulator)
end
function VratProud(gTaznaSila,gZarazenyStupen)
	local shunt = (gZarazenyStupen - 0.8) *20
	local speed = Call("GetSpeed")
	local kN = math.abs(gTaznaSila*130)
	--local kN = (2000*(math.exp(-0.25*(speed-2))))+7
	local k = 1.3
	local a = 106
	local b = 25
	local vratProud = (a*k)*(math.sqrt((((kN+(b*k))^2)/((b*k)^2))-1))
	if gZarazenyStupen < 0 then
		vratProud = -vratProud*2.5
		if gZarazenyStupen == -1 then
			vratProud = vratProud * 1.5
		end
	end
	if shunt > 0 and shunt < 1.5 then
		vratProud = 1.18 * vratProud
	elseif shunt > 1.5 and shunt < 2.5 then
		vratProud = 1.29 * vratProud
	elseif shunt > 2.5 and shunt < 3.5 then
		vratProud = 1.39 * vratProud
	elseif shunt > 3.5 then
		vratProud = 1.48 * vratProud
	end
	return (vratProud)
end
function PIDcntrlAmp(gHodnotaA,gRucickaA)
	local curvature = Call("GetCurvature")
	local gradient = Call("GetGradient")
	local rozdilGrad = gradient - gGradientLastA
	local rozdilCurv = curvature - gCurvatureLastA
	if rozdilGrad ~= 0 then
		gHodnotaA = gHodnotaA + (rozdilGrad * 10)
	end
	if math.abs(rozdilCurv) > 5 then
		gHodnotaA = gHodnotaA + (math.random(-rozdilCurv,rozdilCurv)*5)
	end
	if math.abs(gHodnotaA-gRucickaA) > 10 and not gProbihaA then
		gHraniceA = ((gHodnotaA-gRucickaA)/math.random(3,10))+gHodnotaA
		if gHraniceA > 1000 then
			gHraniceA = 1000
		elseif gHraniceA < -1000 then
			gHraniceA = -1000
		end
		gProbihaA = true
	elseif math.abs(gHodnotaA-gHraniceA) < 10 and not gProbihaA then
		gHraniceA = gHodnotaA
	elseif math.abs(gHraniceA-gRucickaA) < 2 then
		gProbihaA = false
	elseif math.abs(gHodnotaA-gHODNOTA_LASTa) > 10 then
		gProbihaA = false
	end
	local pribytek = gHraniceA-gRucickaA
	if pribytek >= 0 then pribytek = (pribytek^2)/math.random(80,120) else pribytek = -((pribytek^2)/math.random(80,120)) end
	if pribytek > 70 then pribytek = 70 elseif pribytek < -70 then pribytek = -70 end --Asi není potřeba, mělo jít o "omezení" toho výkyvu. Zbytegné
	local vratHodnotu = gRucickaA + pribytek
	if math.abs(pribytek) < 2 then
		vratHodnotu = gHraniceA
		gProbihaA = false
	end
	gHODNOTA_LASTa = gHodnotaA
	gGradientLastA = gradient
	gCurvatureLastA = curvature
	return(vratHodnotu)
end
function PIDcntrlVolt(gHodnotaV,gRucickaV)
	local curvature = Call("GetCurvature")
	local gradient = Call("GetGradient")
	local rozdilGrad = gradient - gGradientLastV
	local rozdilCurv = curvature - gCurvatureLastV
	if rozdilGrad ~= 0 then
		gHodnotaV = gHodnotaV + (rozdilGrad * 10)
	end
	if math.abs(rozdilCurv) > 5 then
		gHodnotaV = gHodnotaV + (math.random(-rozdilCurv,rozdilCurv)*5)
	end
	if math.abs(gHodnotaV-gRucickaV) > 10 and not gProbihaV then
		gHraniceV = ((gHodnotaV-gRucickaV)/math.random(3,10))+gHodnotaV
		if gHraniceV > 1000 then
			gHraniceV = 1000
		elseif gHraniceV < 0 then
			gHraniceV = 0
		end
		gProbihaV = true
	elseif math.abs(gHodnotaV-gHraniceV) < 10 and not gProbihaV then
		gHraniceV = gHodnotaV
	elseif math.abs(gHraniceV-gRucickaV) < 2 then
		gProbihaV = false
	elseif math.abs(gHodnotaV-gHODNOTA_LASTv) > 10 then
		gProbihaV = false
	end
	local pribytek = gHraniceV-gRucickaV
	if pribytek >= 0 then pribytek = (pribytek^2)/math.random(80,120) else pribytek = -((pribytek^2)/math.random(80,120)) end
	if pribytek > 70 then pribytek = 70 elseif pribytek < -70 then pribytek = -70 end --Asi není potřeba, mělo jít o "omezení" toho výkyvu. Zbytegné
	local vratHodnotu = gRucickaV + pribytek
	if math.abs(pribytek) < 2 then
		vratHodnotu = gHraniceV
		gProbihaV = false
	end
	gHODNOTA_LASTv = gHodnotaV
	gGradientLastV = gradient
	gCurvatureLastV = curvature
	return(vratHodnotu)
end
function PIDcntrlCommon(gHodnota,gRucicka,gProbiha,gHranice,gHODNOTA_LAST,limitBudiku)
	if math.abs(gHodnota-gRucicka) > 10 and not gProbiha then
		gHranice = ((gHodnota-gRucicka)/math.random(3,10))+gHodnota
		if gHranice > limitBudiku then
			gHranice = limitBudiku
		elseif gHranice < 0 then
			gHranice = 0
		end
		gProbiha = true
	elseif math.abs(gHodnota-gHranice) < 10 and not gProbiha then
		gHranice = gHodnota
	elseif math.abs(gHranice-gRucicka) < 2 then
		gProbiha = false
	elseif math.abs(gHodnota-gHODNOTA_LAST) > 10 then
		gProbiha = false
	end
	local pribytek = gHranice-gRucicka
	if pribytek >= 0 then pribytek = (pribytek^2)/math.random(60,100) else pribytek = -((pribytek^2)/math.random(60,100)) end
	if pribytek > limitBudiku / 10 then pribytek = limitBudiku / 10 elseif pribytek < -limitBudiku / 10 then pribytek = -limitBudiku / 10 end --Asi není potřeba, mělo jít o "omezení" toho výkyvu. Zbytegné
	local vratHodnotu = ( gRucicka + pribytek ) / 1000
	if math.abs(pribytek) < 2 then
		vratHodnotu = gHranice / 1000
		gProbiha = false
	end
	return vratHodnotu, gProbiha, gHranice, gHodnota
end
function SvetloDimm(dimValue)
	Call("SvetloBudik1:SetColour",10 - dimValue*10,3.443983 - (dimValue*3.443983),0)
	Call("SvetloBudik2:SetColour",10 - dimValue*10,6.26556 - (dimValue*6.26556),0)
	Call("SvetloRychlomer:SetColour",0,3.48548 - (dimValue*3.48548),0.580913 - (dimValue*0.580913))
	Call("SvetloBudik3:SetColour",0,3.48548 - (dimValue*3.48548),0.580913 - (dimValue*0.580913))
	Call("SvetloBudik4:SetColour",0,3.48548 - (dimValue*3.48548),0.580913 - (dimValue*0.580913))
end
function LVZ(LVZznak,vybaveni,delkaUpd,jeZivak)
	local pribytek = delkaUpd * 30

	if jeZivak == 1 then
		signalCode = LVZznak
		if prujezdKolemNavestidla then
			if not vyberZnak then
				signalCode = math.floor(math.random(0,4.9))
				casNaZmenu = math.random(1,2)
				vyberZnak = true
			end
			kodNavesti = signalCode
			casZmenyUbehly = casZmenyUbehly + delkaUpd
			if casZmenyUbehly > casNaZmenu then
				vyberZnak = nil
				prujezdKolemNavestidla = false
			end
		else
			casZmenyUbehly = 0
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
		if math.random(0,10000) > 9999.99 and Call("GetSpeed") > 1 then
			zhasleLVZ = true
		end

		if zhasleLVZ and casZhasle == nil then
			casZhasle = math.random(0.5,2)
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
	else
		signalCode = 0
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
end
function ZpozdeniBrzdice(hodnota)
	if not vysokotlakysvih and not bylaZachrana and not bylZaver then
		local rozdil = math.abs(hodnota - vystupBrzdic)
		if rozdil > 0.01 and beginZpozdeniBrzdic == nil then
			beginZpozdeniBrzdic = os.clock()
		end
		if beginZpozdeniBrzdic ~= nil then
			if math.abs(os.clock()-beginZpozdeniBrzdic) > (0.2+rozdil)/rozdil then
				vystupBrzdic = hodnota
				beginZpozdeniBrzdic = nil
			end
		end
		return(vystupBrzdic)
	else
		return(hodnota)
	end
end
function Napoveda (zprava, level)
	if level == levelNapovedy then
		SysCall("ScenarioManager:ShowInfoMessageExt", ZPRAVA_HLAVICKA_NAPOVEDA, zprava,5,16,0,0)
	end
end
function Update (cas)
	if ToBolAndBack (Call("GetIsNearCamera")) then
		MaPredniPantograf = Call("ControlExists","PantoPredni",0)
		casMinuly = casProcesor
		casProcesor = os.clock()
		cas = math.abs(casProcesor - casMinuly)
		Call("ZimniJiskra:Activate",0)
		Call("ZimniJiskra1:Activate",0)
		Call("ZimniJiskra2:Activate",0)
		Call("ZimniJiskra3:Activate",0)
		Call("ZimniJiskra4:Activate",0)
		Call("SetControlValue","ZimniJiskraPrehrajZvuka",0,0)
		hh, necojakomm = divMod(SysCall("ScenarioManager:GetTimeOfDay"),3600)
		jeMrtva = ToBolAndBack(Call("GetIsDeadEngine"))
		mm, ss = divMod(necojakomm,60)
		ss=math.floor(ss)
		if hh < 10 then hh = "0"..tostring(hh) end
		if mm < 10 then mm = "0"..tostring(mm) end
		if ss < 10 then ss = "0"..tostring(ss) end
		dennicas = tonumber(hh..mm..ss)
		hh = tonumber(hh)
		mm = tonumber(mm)
		ss = tonumber(ss)
		gCommonTimer = gCommonTimer + cas
		if Call("GetIsPlayer") == 1 then
			if casDummy >= 1 then
				predMasinou = Call("SendConsistMessage",460999,"DUMMY",0)
				zaMasinou = Call("SendConsistMessage",460999,"DUMMY",1)
				casDummy = 0
			end
			casDummy = casDummy + cas
			if predMasinou ~= predMasinouOld or zaMasinou ~= zaMasinouOld then
				Call("SetControlValue","IsMasterInConsist",0,0)
				Call("SetControlValue","mg",0,0)
				Call("SetControlValue","mgZvuk",0,0)
				Call("SetControlValue","mgVS",0,0)
				predMasinouOld = predMasinou
				zaMasinouOld = zaMasinou
				Call("SetControlValue","PredMasinou",0,predMasinou)
				Call("SetControlValue","ZaMasinou",0,zaMasinou)
			end
			if not ToBolAndBack(Call("GetControlValue","IsMasterInConsist",0)) and Call("GetIsEngineWithKey") == 1 then
				Call("SetControlValue","IsMasterInConsist",0,1)
				if Call("SendConsistMessage",460998,"1",1) == 0 then 
					Call("SendConsistMessage",460997,"1",0)
					ID = 1
					Call("SetControlValue","ID",0,ID)
				end
			end
			if ID ~= nil then
				--##################################################################################--
				------------------------------------ČOST expert controls------------------------------
				--##################################################################################--
					HlavniVypinac = Call ("GetControlValue", "HlavniVypinac", 0)
					Call("SetControlValue","AI",0,0)
					Ammeter = Call("GetControlValue","Ampermetr",0)
					RocniObdobi = SysCall("ScenarioManager:GetSeason")
					SvetloDimm(Call("GetControlValue","StmivacOsvetleni",0))
					mgp = Call("GetControlValue","mgp",0)
					Rychlost = Call ("GetControlValue","SpeedometerKPH",0)
					if RizenaRidici == "ridici" then
						Call("SetControlValue","AbsolutniRychlomer",0,math.abs(Call("GetControlValue","SpeedometerKPH",0)))
						Call("SetControlValue","hlkomp",0,KompresorPrep)
						if Call("GetControlValue","VirtualPantographControl",0) == 1 then
							Call("SetControlValue","povel_VirtualPantographControl",0,Call("GetControlValue","VolbaPanto",0))
						else
							Call("SetControlValue","povel_VirtualPantographControl",0,3)
						end
						if MaPredniPantograf == 1 then PP = Call ("GetControlValue", "PantoPredni", 0) else PP = 0 end
						ZP = Call ("GetControlValue", "PantoZadni", 0)
						PC=math.max(PP,ZP)
					end
					if RocniObdobi == 3 then
						nahoda = math.random(1,1000)
						if nahoda > 100 and nahoda < math.abs(Ammeter) then
							if math.floor(math.random(0,5)) == 1 then
								Call("SetControlValue","Voltmeter",0,PIDcntrlVolt(math.random(425,950),Call("GetControlValue","Voltmeter",0)))
								Call("SetControlValue","Napeti",0,math.random(425,950))
								VyberJiskry = math.random(0,5)
								Call("SetControlValue","ZimniJiskraPrehrajZvuka",0,1)
								if math.floor(VyberJiskry) == 0 then
									Call("ZimniJiskra:Activate",1)
								elseif math.floor(VyberJiskry) == 1 then
									Call("ZimniJiskra1:Activate",1)
								elseif math.floor(VyberJiskry) == 2 then
									Call("ZimniJiskra2:Activate",1)
								elseif math.floor(VyberJiskry) == 3 then
									Call("ZimniJiskra3:Activate",1)
								elseif math.floor(VyberJiskry) == 4 then
									Call("ZimniJiskra4:Activate",1)
								end
							end
						end
					end
					if UzJsiZjistovalPanto == false then
						UzJsiZjistovalPanto = true
						Call ( "DalkovePrave:Activate", 0 )
						Call ( "DalkoveLeve:Activate", 0 )
						Call ( "ActivateNode","dalkaclevy",0)
						Call ( "ActivateNode","dalkacpravy",0)
						Call ( "ActivateNode","reflektor_rozsviceny",0) 
						Call ( "Reflektor:Activate", 0 )
						Call ( "PozickaLevaBi:Activate", 0 )
						Call ( "PozickaLevaCr:Activate", 0 )
						Call ( "PozickaPravaBi:Activate", 0 )
						Call ( "PozickaPravaCr:Activate", 0 )
						Call ( "ActivateNode", "pozickalevaBi", 0 ) 
						Call ( "ActivateNode", "pozickalevaCr", 0 ) 
						Call ( "ActivateNode", "pozickapravaBi", 0 ) 
						Call ( "ActivateNode", "pozickapravaCr", 0 ) 
						NouzoveBrzdeni = 0
						if MaPredniPantograf == 1 then
							Call ("SetTime","PredniSberac",0)
							Call ("SetTime","ZadniSberac",0)
						else
							Call ("SetTime","ZadniSberac",0)
						end
						Call("SetControlValue","vysilacka_displeje",0,0)
						Call("SetControlValue","HlavniVypinac",0,0)
						Call("SetControlValue","VirtualStartup",0,0)
					end
					if NouzoveBrzdeni == 0 and not matrosov and Call("GetControlValue","ZamekBS2",0) == 0 and Call("GetIsEngineWithKey") == 1 and not (math.floor(Call("GetControlValue","VirtualBrake",0)*100) == 86 and math.floor(Call("GetControlValue","ZpozdenyVirtualBrake",0)*100) == 86) then
						Call("SetControlValue","ZpozdenyVirtualBrake",0,ZpozdeniBrzdice(Call("GetControlValue","VirtualBrake",0)))
					end
					if math.floor(Call("GetControlValue","VirtualBrake",0)*100) == 86 then
						Call("SetControlValue","ZpozdenyVirtualBrake",0,Call("GetControlValue","BrzdaZpozdenaVS",0))
					elseif Call("GetIsEngineWithKey") == 1 then
						Call("SetControlValue","BrzdaZpozdenaVS",0,Call("GetControlValue","ZpozdenyVirtualBrake",0))
						Call("SetControlValue","BrzdaVS",0,Call("GetControlValue","VirtualBrake",0))
					end
					if MaPredniPantograf == 1 then PredniPanto = Call("GetControlValue", "PantoPredni", 0) else PredniPanto = 0 end
					KompresorPrep = Call("GetControlValue","HlKompPrep",0)
					ZadniPanto = Call("GetControlValue", "PantoZadni", 0)
					JeNouzovyRadic = Call("GetControlValue","JeNouzovyRadic",0)
					vykon = Call("GetControlValue","JizdniKontroler",0)
					centrala = Call("GetControlValue","Centrala",0)
					JOBold = JOB
					JOB = Call("GetControlValue","JOB",0)
					pomkomp = Call("GetControlValue","pomkomp",0)
					buttonPojezdVDepu = Call("GetControlValue","ButtonPojezdVDepu",0)
					plynulaBrzda = Call("GetControlValue","VirtualBrakePipePressureBAR",0)
					VirtualMainReservoirPressureBAR = Call("GetControlValue","VirtualMainReservoirPressureBAR",0)
					plynuleValceZobrazene = Call("GetControlValue","VirtualTrainBrakeCylinderPressureBAR",0)
					VirtualBrakeReservoirPressureBAR = Call("GetControlValue","VirtualBrakeReservoirPressureBAR",0)
					if ZivakReset < 0.25 then ZivakStary = 0 end
					ZivakReset = math.max(Call("GetControlValue","ZivakReset",0),Call("GetControlValue","ZivakReset2",0),Call("GetControlValue","ZivakReset3",0))
					casproud = casproud + cas
					if Call("GetControlValue","Wheelslip",0) ~= 1 then
						skluzWheelSlip = 1
					else
						skluzWheelSlip = 0
					end
					wheelSlip = Call("GetControlValue","Wheelslip",0)
					CasHasler = CasHasler + cas
					casfail = casfail + cas
					casfail2 = casfail2 + cas
					hlkomp = Call("GetControlValue","hlkomp",0)
					Smer = Call("GetControlValue","UserVirtualReverser",0)

					if Smer == 0 then
						Call ( "SetControlValue", "povel_Reverser", 0, 0)
					elseif Smer ~= 2 then
						Call ( "SetControlValue", "povel_Reverser", 0, Smer)
					end

					if Baterie == 1 then
						Call("SetControlValue", "Reverser", 0, Call("GetControlValue", "povel_Reverser", 0))
					else
						Call ( "SetControlValue", "Reverser", 0, 0)
					end


					if Smer > 1.8 then
						RizenaRidici = "rizena"
					else
						RizenaRidici = "ridici"
					end
					RizenaRidiciJednaNula = 0
					if RizenaRidici == "ridici" then
						RizenaRidiciJednaNula = 1
					end
					----------------------------------------IS------------------------------------------------
						MSVsipkaDoluLast = MSVsipkaDolu
						MSVsipkaNahoruLast = MSVsipkaNahoru
						MSVsipkaLevaLast = MSVsipkaLeva
						MSVsipkaPravaLast = MSVsipkaPrava
						MSVokLast = MSVok

						MSVsipkaDolu = ToBolAndBack(Call("GetControlValue","MSVdolu",0))
						MSVsipkaNahoru = ToBolAndBack(Call("GetControlValue","MSVnahoru",0))
						MSVsipkaLeva = ToBolAndBack(Call("GetControlValue","MSVleva",0))
						MSVsipkaPrava = ToBolAndBack(Call("GetControlValue","MSVprava",0))
						MSVok = ToBolAndBack(Call("GetControlValue","MSVok",0))

						if IS.stav == "start" and Baterie == 1 then
							IS.casStart = IS.casStart + cas
							Call("MSVstart:ActivateNode","MSVstart",1)
							Call("MSVstart2:ActivateNode","MSVstart",1)
							if IS.casStart > 5 then
								Call("MSVstart:ActivateNode","MSVstart",0)
								Call("MSVstart2:ActivateNode","MSVstart",0)
								IS.stav = "sleep"
								IS:NastavCil1(1,true)
								IS:NastavCil2(1,true)
								IS:NastavLinku(1,true)
							end
						else
							IS.casStart = 0
						end
						if Baterie ~= 1 then
							IS.stav = "start"
							IS:VymazVse()
							Call("MSVstart:ActivateNode","MSVstart",0)
							Call("MSVstart2:ActivateNode","MSVstart",0)
						end
						if Baterie == 1 and IS.stav ~= "sleep" then
							IS.casMenu = IS.casMenu + cas
							if IS.casMenu > 20 then
								IS.stav = "sleep"
							end
						end

						if MSVsipkaDolu and not MSVsipkaDoluLast then
							IS:SipkaDolu()
							Print("dolu")
						end
						if MSVsipkaNahoru and not MSVsipkaNahoruLast then
							IS:SipkaNahoru()
							Print("nahoru")
						end
						if MSVsipkaLeva and not MSVsipkaLevaLast then
							IS:SipkaBok()
							Print("leva")
						end
						if MSVsipkaPrava and not MSVsipkaPravaLast then
							IS:SipkaBok()
							Print("prava")
						end
						if MSVok and not MSVokLast then
							IS:Potvrzeni()
							Print("OK")
						end

					----------------------------------------Prechod z RI do RA--------------------------------
						if RizenaRidici == "rizena" and RizenaRidiciLast == "ridici" then
							--komplet vypnuti
							Call("SetControlValue","povel_VirtualPantographControl",0,0)
							Call("SetControlValue","povel_HlavniVypinac",0,0)
							Call ( "SetControlValue", "povel_Reverser", 0, 0)
						end
						RizenaRidiciLast = RizenaRidici
					----------------------------------------Motorgener?tor------------------------------------
						mgs = Call("GetControlValue","mgstart",0)
						auto_mgs = Call("GetControlValue","mgautostart",0)
						mgPrip = Call("GetControlValue","mgPriprava",0)
						
						NastavHodnotuSID("mgPriprava",mgp,460116)

						if mgPrip > 0 and PC == 3.75 then
							if mgs == 1 or auto_mgs == 1 then
								if napetiVS220 >= 380 then
									mg = 1
									mgdocasny = 0
									if RizenaRidiciJednaNula == 1 then
										Call("SetControlValue","mgautostart",0,1)
									end
								else
									mgdocasny = 1
								end
							else
								mgdocasny = 0
							end
						else
							if RizenaRidiciJednaNula == 1 then
								Call("SetControlValue","mgautostart",0,0)
							end
							mg = 0
							mgdocasny = 0
						end
						Call("SetControlValue","mgZvuk",0,math.max(mg,mgdocasny))
						NastavHodnotuSID("mgVS",math.max(mg,mgdocasny),460117)
						NastavHodnotuSID("mg",mg,460118)
					----------------------------------------Vys?la?ka-----------------------------------------
						if Baterie == 1 then
							if vysilackaObrazovka ~= vysilackaObrazovkaStara then -- displej vys?la?ky
								Call("SetControlValue","vysilacka_displeje",0,vysilackaObrazovka)
								Call("SetControlValue","VysilackaStartSound",0,0)
								vysilackaObrazovkaStara = vysilackaObrazovka
							end
							if vysilackaObrazovka == 1 then -- start vys?la?ky
								vysilackaboot = vysilackaboot + cas
								if vysilackaboot > 15 then
									vysilackaObrazovka = 8
									vysilackaboot = 0
								end
							end
							if vysilackaObrazovka ~= 1 and vysilackaObrazovka ~= 0 then -- zobrazen? ??sla vlaku a hodin a? po zapnut?
								if vysilackaprihlasena ~= 1 then -- blik?n? odhl??en? vys?la?ky
									vysilackablikani = vysilackablikani + cas
									if vysilackablikani >= 1 then
										if cislovzhasnute == 1 then
											Call("vysilackacislov:SetText","xxxxxx",0)
											cislovzhasnute = 0
											vysilackablikani = 0
										else
											Call("vysilackacislov:SetText",tostring(cislovlaku),0)
											cislovzhasnute = 1
											vysilackablikani = 0
										end
									end
								else
									Call("vysilackacislov:SetText",cislovlaku,0)
									vysilackablikani = 0
								end
								if vysilackaObrazovka == 4 or vysilackaObrazovka == 5 then
									Call("vysilackacislovdolni:SetText",tostring(cislovlakubuffzobraz),0)
									if cislovlakubuff < 10 then cislovlakubuffzobraz = "xxxxx"..tostring(cislovlakubuff) elseif cislovlakubuff < 100 and cislovlakubuff >= 10 then cislovlakubuffzobraz = "xxxx"..tostring(cislovlakubuff) elseif cislovlakubuff < 1000 and cislovlakubuff >= 100 then cislovlakubuffzobraz = "xxx"..tostring(cislovlakubuff) elseif cislovlakubuff < 10000 and cislovlakubuff >= 1000 then cislovlakubuffzobraz = "xx"..tostring(cislovlakubuff) elseif cislovlakubuff < 100000 and cislovlakubuff >= 10000 then cislovlakubuffzobraz = "x"..tostring(cislovlakubuff) elseif cislovlakubuff < 1000000 and cislovlakubuff >= 100000 then cislovlakubuffzobraz = tostring(cislovlakubuff) end
									Call("vysilackacislovdolni:SetText",tostring(cislovlakubuffzobraz),0)
								else
									Call("vysilackacislovdolni:SetText","xxxxxx",0)
								end
								Call("SetControlValue","vysilackaReg",0,vysilackaprihlasena)
							else
								Call("vysilackacislovdolni:SetText","xxxxxx",0)
								Call("vysilackacislov:SetText","xxxxxx",0)
							end
							if vysilackaObrazovka == 8 then -- hlavn? obrazovka
								if tlacitko8 == 1 then
									tlacitko8 = 0
									if vysilackaprihlasena == 0 then
										vysilackaObrazovka = 7
									else
										vysilackaObrazovka = 6
									end
								end
							end
							if vysilackaObrazovka == 6 or vysilackaObrazovka == 7 then -- menu data
								if tlacitko1 == 1 then
									tlacitko1 = 0
									vysilackaObrazovka = 5
								end
								if menupozice == 1 and tlacitkoEnter == 1 then
									tlacitkoEnter = 0
									menupozice = 1
									vysilackaObrazovka = 5
								end
								if vysilackaObrazovka == 7 then
									if tlacitko0 == 1 then
										tlacitko0 = 0
										if cislovlaku ~= "xxxxxx" then 
											vysilackaprihlasena = 1
											vysilackaObrazovka = 8
										end
									end
								else
									if tlacitko0 == 1 then
										tlacitko0 = 0
										vysilackaprihlasena = 0
										vysilackaObrazovka = 8
									end
								end
								if tlacitkoDelete == 1 then
									tlacitkoDelete = 0
									vysilackaObrazovka = 8
								end
							end
							if vysilackaObrazovka == 5 or vysilackaObrazovka == 4 then -- zad?n? ??sla vlaku bez potvrzen?
								if cislovlakubuff ~= 0 then
									vysilackaObrazovka = 4
								else
									vysilackaObrazovka = 5
								end
								if tlacitko1 == 1 and cislovlakubuff < 1000000 then
									tlacitko1 = 0
									if cislovlakubuff == 0 then cislovlakubuff = 1 else cislovlakubuff = (cislovlakubuff * 10) + 1 end
								end
								if tlacitko8 == 1 and cislovlakubuff < 1000000 then
									tlacitko8 = 0
									if cislovlakubuff == 0 then cislovlakubuff = 8 else cislovlakubuff = (cislovlakubuff * 10) + 8 end
								end
								if tlacitko0 == 1 and cislovlakubuff < 1000000 then
									tlacitko0 = 0
									if cislovlakubuff ~= 0 then cislovlakubuff = (cislovlakubuff * 10) end
								end
								if tlacitko2 == 1 and cislovlakubuff < 1000000 then
									tlacitko2 = 0
									if cislovlakubuff == 0 then cislovlakubuff = 2 else cislovlakubuff = (cislovlakubuff * 10) + 2 end
								end
								if tlacitko3 == 1 and cislovlakubuff < 1000000 then
									tlacitko3 = 0
									if cislovlakubuff == 0 then cislovlakubuff = 3 else cislovlakubuff = (cislovlakubuff * 10) + 3 end
								end
								if tlacitko4 == 1 and cislovlakubuff < 1000000 then
									tlacitko4 = 0
									if cislovlakubuff == 0 then cislovlakubuff = 4 else cislovlakubuff = (cislovlakubuff * 10) + 4 end
								end
								if tlacitko5 == 1 and cislovlakubuff < 1000000 then
									tlacitko5 = 0
									if cislovlakubuff == 0 then cislovlakubuff = 5 else cislovlakubuff = (cislovlakubuff * 10) + 5 end
								end
								if tlacitko6 == 1 and cislovlakubuff < 1000000 then
									tlacitko6 = 0
									if cislovlakubuff == 0 then cislovlakubuff = 6 else cislovlakubuff = (cislovlakubuff * 10) + 6 end
								end
								if tlacitko7 == 1 and cislovlakubuff < 1000000 then
									tlacitko7 = 0
									if cislovlakubuff == 0 then cislovlakubuff = 7 else cislovlakubuff = (cislovlakubuff * 10) + 7 end
								end
								if tlacitko9 == 1 and cislovlakubuff < 1000000 then
									tlacitko9 = 0
									if cislovlakubuff == 0 then cislovlakubuff = 9 else cislovlakubuff = (cislovlakubuff * 10) + 9 end
								end
								if tlacitkoDelete == 1 then
									tlacitkoDelete = 0
									if cislovlakubuff ~= 0 then cislovlakubuff = math.floor(cislovlakubuff/10) end
								end
								if tlacitkoEnter == 1 then
									tlacitkoEnter = 0
									if cislovlakubuff < 10 then cislovlaku = "xxxxx"..tostring(cislovlakubuff) elseif cislovlakubuff < 100 and cislovlakubuff >= 10 then cislovlaku = "xxxx"..tostring(cislovlakubuff) elseif cislovlakubuff < 1000 and cislovlakubuff >= 100 then cislovlaku = "xxx"..tostring(cislovlakubuff) elseif cislovlakubuff < 10000 and cislovlakubuff >= 1000 then cislovlaku = "xx"..tostring(cislovlakubuff) elseif cislovlakubuff < 100000 and cislovlakubuff >= 10000 then cislovlaku = "x"..tostring(cislovlakubuff) elseif cislovlakubuff < 1000000 and cislovlakubuff >= 100000 then cislovlaku = tostring(cislovlakubuff) end
									vysilackaObrazovka = 3
								end
							end
							if vysilackaObrazovka == 3 then -- pracovn? pozice
								if tlacitkoEnter == 1 then
									tlacitkoEnter = 0
									vysilackaObrazovka = 8
								end
								if tlacitkoDelete == 1 then
									tlacitkoDelete = 0
									vysilackaObrazovka = 8
								end
							end
						else
							Call("SetControlValue","vysilacka_displeje",0,0)
							cislovlaku="xxxxxx"
							vysilackaObrazovka = 0
							vysilackaObrazovkaStara = 1
							vysilackaboot = 0
							vysilackablikani = 0
							vysilackaprihlasena = 0
							cislovzhasnute = 0
							tlacitko8 = 0
							menupozice=1
							tlacitko1 = 0
							tlacitkoEnter = 0
							cislovlakubuff = 0
							tlacitkoDelete = 0
							tlacitko0 = 0
							Call("vysilackacislovdolni:SetText","xxxxxx",0)
							Call("vysilackacislov:SetText","xxxxxx",0)
						end
					----------------------------------------Brzdy p?i EDB m?n? ne? 300A-----------------------
						--------Prvn? bylo EDB, nebo vzduch?-------------------------------------
							if Call("GetControlValue","ZpozdenyVirtualBrake",0) > 0.22 and PrvniEDBorVzduch == "nichts" then 
								PrvniEDBorVzduch = "vzduch"
							elseif Call("GetControlValue","ZpozdenyVirtualBrake",0) <= 0.22 and PrvniEDBorVzduch == "vzduch" then
								PrvniEDBorVzduch = "nichts"
							end
							if vykon < 0 and PrvniEDBorVzduch == "nichts" then
								PrvniEDBorVzduch = "EDB"
							elseif vykon >= 0 and PrvniEDBorVzduch == "EDB" then
								PrvniEDBorVzduch = "nichts"
							end
							if (Ammeter <= -300 or plynulaBrzda < 3.5) and PrvniEDBorVzduch == "EDB" then
								Call("SetBrakeFailureValue","BRAKE_FADE",1)
								nezobrazujValce = true
							else
								Call("SetBrakeFailureValue","BRAKE_FADE",0)
								nezobrazujValce = false
							end
					----------------------------------------U?ivatelsk? vzduchotechnika-----------------------
						Call("SetControlValue","VirtualMainReservoirPressureBAR",0,VirtualMainReservoirPressureBAR-(((VirtualMainReservoirPressureBAR/500)^2)*5*cas))
						nastavenaBrzda = nastavenaBrzda-(((nastavenaBrzda/500)^2)*3*cas)
						nastavenaBrzda_opozdene = nastavenaBrzda_opozdene-(((nastavenaBrzda_opozdene/500)^2)*3*cas)
						Call("SetControlValue","VirtualBrakeReservoirPressureBAR",0,VirtualBrakeReservoirPressureBAR-(((VirtualBrakeReservoirPressureBAR/500)^2)*3*cas))
						nastaveneValce = nastaveneValce-(((nastaveneValce/500)^2)*10*cas)
						if VirtualMainReservoirPressureBAR > 9.8 then
							autoKompresor = false
						elseif VirtualMainReservoirPressureBAR < 8.8 then
							autoKompresor = true
						end
						if Baterie == 1 then
							if math.abs(pomkomp) == 1 and Call("GetControlValue","PantoJimka",0) <= 4 then
								casbrzdy = casbrzdy + cas
								if casbrzdy >= 0.0125 then
									PantoJimkaZKom=PantoJimkaZKom+0.0005
									casbrzdy = 0
								end
								if Call("GetControlValue","PantoJimka",0) >= 3.11 then
									Call("SetControlValue","pojistak",0,1)
									pojistak = true
								else
									Call("SetControlValue","pojistak",0,0)
									pojistak = false
								end
							end
							if vnitrniSit220V == 1 then
								if hlkomp == -1 and PC == 3.75 and bylpojistovak ~= 1 and Call("GetControlValue","VirtualMainReservoirPressureBAR",0) <= 10 then
									casbrzdy2 = casbrzdy2 + cas
									if casbrzdy2 >= 0.0125 then
										Call("SetControlValue","VirtualMainReservoirPressureBAR",0,Call("GetControlValue","VirtualMainReservoirPressureBAR",0)+0.0025)
										casbrzdy2 = 0
									end
								elseif hlkomp == 1 and PC == 3.75 and bylpojistovak ~= 1 and autoKompresor then
									casbrzdy2 = casbrzdy2 + cas
									if casbrzdy2 >= 0.0125 then
										Call("SetControlValue","VirtualMainReservoirPressureBAR",0,Call("GetControlValue","VirtualMainReservoirPressureBAR",0)+0.0025)
										casbrzdy2 = 0
									end
								end
							end
						end
						VirtualMainReservoirPressureBAR = Call("GetControlValue","VirtualMainReservoirPressureBAR",0)
						if VirtualBrakeReservoirPressureBAR < 5 and VirtualBrakeReservoirPressureBAR < VirtualMainReservoirPressureBAR - 0.5 then
							Call("SetControlValue","VirtualBrakeReservoirPressureBAR",0,math.min(VirtualMainReservoirPressureBAR,VirtualBrakeReservoirPressureBAR+0.02))
							Call("SetControlValue","VirtualMainReservoirPressureBAR",0,VirtualMainReservoirPressureBAR-0.02)
							VirtualBrakeReservoirPressureBAR = math.min(VirtualMainReservoirPressureBAR,VirtualBrakeReservoirPressureBAR+0.02)
							VirtualMainReservoirPressureBAR = VirtualMainReservoirPressureBAR - 0.02
						end
						if VirtualMainReservoirPressureBAR > 10 then
							bylpojistovak = 1
						end
						if bylpojistovak == 1 then
							casbrzdy2 = casbrzdy2 + cas
							if VirtualMainReservoirPressureBAR >= 9 then
								if casbrzdy2 >= 0.0125 then
									Call("SetControlValue","VirtualMainReservoirPressureBAR",0,Call("GetControlValue","VirtualMainReservoirPressureBAR",0)-0.005)
									casbrzdy2 = 0
								end
							else
								bylpojistovak = 0
							end
						end
						if pojistak then
							Call("SetControlValue","PantoJimka",0,math.max(PantoJimkaZKom,PantoJimkaZHJ)-0.00125)
						end

						if Call("GetControlValue","BrzdaVS",0) == 0 then
							vysokotlakysvih = true
						elseif plynulaBrzda <= 5 then
							vysokotlakysvih = false
						end

						if Call("GetControlValue","BrzdaVS",0) > 0.84 or Call("GetControlValue","BrzdaVS",0) == 0.22 then
							bylZaver = true
							if Call("GetControlValue","BrzdaVS",0) > 0.95 then	
								bylaZachrana = true
							end
						elseif math.abs(PipeOld - plynulaBrzda) < 0.1 then
							bylaZachrana = false
							bylZaver = false
						end

						BS2old = BS2
						BS2 = Call("GetControlValue","BrzdaVS",0)
						if BS2 ~= BS2old or doplnujBrzdu then
							if BS2 < 0.06 then
								prebiti = true
								nastavenaBrzda = VirtualMainReservoirPressureBAR
								doplnujBrzdu = true
							elseif BS2 < 0.21 then
								nastavenaBrzda = 5.0
								doplnujBrzdu = true
							elseif BS2 < 0.23 then
								doplnujBrzdu = false
							elseif BS2 <= 0.82 then
								nastavenaBrzda = 4.7 - ((BS2 - 0.26)*2.14)
								doplnujBrzdu = true
							elseif BS2 < 0.93 then
								doplnujBrzdu = false
							else
								nastavenaBrzda = 0
								doplnujBrzdu = true
							end
						end

						if NouzoveBrzdeni == 1 or matrosov then
							nastavenaBrzda = 0
							if BS2 < 0.21 or (BS2 > 0.23 and BS2 <= 0.82) then
								Call("SetControlValue","VirtualMainReservoirPressureBAR",0,VirtualMainReservoirPressureBAR - ((math.sqrt(VirtualMainReservoirPressureBAR)/100)+0.01))
								Call("SetControlValue","ZpozdenyVirtualBrake",0,1)
								ZpozdeniBrzdice(1)
								Call("SetControlValue","zvukSyceniVZ",0,1)
							else
								Call("SetControlValue","zvukSyceniVZ",0,0)
								ZpozdeniBrzdice(Call("GetControlValue","VirtualBrake",0))
							end
						else
							Call("SetControlValue","zvukSyceniVZ",0,0)
							ZpozdeniBrzdice(Call("GetControlValue","VirtualBrake",0))
						end
						
						if not prebiti and NouzoveBrzdeni == 0 and not matrosov then
							if nastavenaBrzda > plynulaBrzda then
								plynulaBrzda = plynulaBrzda + math.sqrt(math.abs(nastavenaBrzda-plynulaBrzda))/10
							elseif plynulaBrzda > nastavenaBrzda then
								plynulaBrzda = plynulaBrzda - math.sqrt(math.abs(nastavenaBrzda-plynulaBrzda))/10
							end
						else
							if nastavenaBrzda > plynulaBrzda then
								plynulaBrzda = plynulaBrzda + math.sqrt(math.abs(nastavenaBrzda-plynulaBrzda))/3
							elseif plynulaBrzda > nastavenaBrzda then
								plynulaBrzda = plynulaBrzda - math.sqrt(math.abs(nastavenaBrzda-plynulaBrzda))/3
							end
						end

						if nastavenaBrzda <= 5 then
							prebiti = false
						end

						plynulaBrzda = math.min(plynulaBrzda,VirtualMainReservoirPressureBAR)

						BS2old_opozdene = BS2_opozdene
						BS2_opozdene = Call("GetControlValue","ZpozdenyVirtualBrake",0)
						if BS2_opozdene ~= BS2old_opozdene or doplnujBrzdu_opozdene then
							if BS2_opozdene < 0.06 then
								prebiti_opozdene = true
								nastavenaBrzda_opozdene = VirtualMainReservoirPressureBAR
								doplnujBrzdu_opozdene = true
							elseif BS2_opozdene < 0.21 then
								nastavenaBrzda_opozdene = 5.0
								doplnujBrzdu_opozdene = true
							elseif BS2_opozdene < 0.23 then
								doplnujBrzdu_opozdene = false
							elseif BS2_opozdene <= 0.82 then
								nastavenaBrzda_opozdene = 4.7 - ((BS2_opozdene - 0.26)*2.14)
								doplnujBrzdu_opozdene = true
							elseif BS2_opozdene < 0.93 then
								doplnujBrzdu_opozdene = false
							else
								nastavenaBrzda_opozdene = 0
								doplnujBrzdu_opozdene = true
							end
						end

						if not prebiti_opozdene then
							if nastavenaBrzda_opozdene > plynulaBrzda_opozdene then
								plynulaBrzda_opozdene = plynulaBrzda_opozdene + math.sqrt(math.abs(nastavenaBrzda_opozdene-plynulaBrzda_opozdene))/10
							elseif plynulaBrzda_opozdene > nastavenaBrzda_opozdene then
								plynulaBrzda_opozdene = plynulaBrzda_opozdene - math.sqrt(math.abs(nastavenaBrzda_opozdene-plynulaBrzda_opozdene))/10
							end
						else
							if nastavenaBrzda_opozdene > plynulaBrzda_opozdene then
								plynulaBrzda_opozdene = plynulaBrzda_opozdene + math.sqrt(math.abs(nastavenaBrzda_opozdene-plynulaBrzda_opozdene))/3
							elseif plynulaBrzda_opozdene > nastavenaBrzda_opozdene then
								plynulaBrzda_opozdene = plynulaBrzda_opozdene - math.sqrt(math.abs(nastavenaBrzda_opozdene-plynulaBrzda_opozdene))/3
							end
						end
						if nastavenaBrzda_opozdene <= 5 then
							prebiti_opozdene = false
						end

						plynulaBrzda_opozdene = math.min(plynulaBrzda_opozdene,VirtualMainReservoirPressureBAR)

						--VirtualBrakePipePressureBAR,gProbihaPipe,gHranicePipe,gHODNOTA_LAST_Pipe = PIDcntrlCommon(math.min(plynulaBrzda,VirtualMainReservoirPressureBAR - 1)*1000,VirtualBrakePipePressureBAR*1000,gProbihaPipe,gHranicePipe,gHODNOTA_LAST_Pipe,10000)
						Call("SetControlValue","VirtualBrakePipePressureBAR",0,plynulaBrzda)

						if plynulaBrzda > PipeOld then
							Call("SetControlValue","VirtualMainReservoirPressureBAR",0,VirtualMainReservoirPressureBAR - (plynulaBrzda - PipeOld)*0.1)
						end
						PipeOld = plynulaBrzda
						
						nastaveneValce = math.min(VirtualBrakeReservoirPressureBAR,(5-plynulaBrzda_opozdene)*2.53)
						ValceOld = VirtualTrainBrakeCylinderPressureBAR

						valcePrimocinne = math.min(Call("GetControlValue","EngineBrakeControl",0)*3.8,VirtualMainReservoirPressureBAR)
						nastaveneValce_bezBP = nastaveneValce
						nastaveneValce = math.min(math.max(nastaveneValce,valcePrimocinne),3.8)

						if nastaveneValce > plynuleValce then
							plynuleValce = plynuleValce + math.sqrt(math.abs(nastaveneValce-plynuleValce))/10
						elseif plynuleValce > nastaveneValce then
							plynuleValce = plynuleValce - math.sqrt(math.abs(nastaveneValce-plynuleValce))/10
						end

						if nastaveneValce_bezBP > plynuleValce_bezBP then
							plynuleValce_bezBP = plynuleValce_bezBP + math.sqrt(math.abs(nastaveneValce_bezBP-plynuleValce_bezBP))/10
						elseif plynuleValce_bezBP > nastaveneValce_bezBP then
							plynuleValce_bezBP = plynuleValce_bezBP - math.sqrt(math.abs(nastaveneValce_bezBP-plynuleValce_bezBP))/10
						end

						--VirtualTrainBrakeCylinderPressureBAR,gProbihaValce,gHraniceValce,gHODNOTA_LAST_Valce = PIDcntrlCommon(plynuleValce*1000,VirtualTrainBrakeCylinderPressureBAR*1000,gProbihaValce,gHraniceValce,gHODNOTA_LAST_Valce,10000)
						if nezobrazujValce then
							nastaveneValce = math.min(valcePrimocinne,3.8)
						else
							if nastaveneValce > plynuleValceZobrazene then
								plynuleValceZobrazene = plynuleValceZobrazene + math.sqrt(math.abs(nastaveneValce-plynuleValceZobrazene))/10
							elseif plynuleValceZobrazene > nastaveneValce then
								plynuleValceZobrazene = plynuleValceZobrazene - math.sqrt(math.abs(nastaveneValce-plynuleValceZobrazene))/10
							end
						end
						Call("SetControlValue","VirtualTrainBrakeCylinderPressureBAR",0,plynuleValceZobrazene)
						
						if plynuleValce_bezBP == 0 then
							Call("SetControlValue","TrainBrakeControl",0,0)
						elseif plynuleValce_bezBP >= 2.2 and bylaZachrana then
							Call("SetControlValue","TrainBrakeControl",0,1)
						else
							Call("SetControlValue","TrainBrakeControl",0,math.min(((plynuleValce_bezBP+0.1)/4.33333333333333333333),0.9))
						end

						if Baterie == 1 and vnitrniSit220V == 1 and PC == 3.75 and (hlkomp == -1 or (hlkomp == 1 and autoKompresor)) then
							Call("SetControlValue","kompresor_zvk",0,1)
						else
							Call("SetControlValue","kompresor_zvk",0,0)
						end
						Call("SetControlValue","kompom_zvk",0,math.min(math.abs(pomkomp),Baterie))
						Call("SetControlValue","pojistovak",0,math.abs(bylpojistovak))
						PantoJimkaZHJ=math.min(Call("GetControlValue","VirtualMainReservoirPressureBAR",0),3.11)
						Call("SetControlValue","PantoJimka",0,math.max(PantoJimkaZKom,PantoJimkaZHJ))
						Call("SetControlValue","SberaceJimka",0,math.max(PantoJimkaZHJ,PantoJimkaZKom))
						if PP > 0 then
							sberac1TlakPozadovany = math.min(Call("GetControlValue","SberaceJimka",0),5)
						else
							sberac1TlakPozadovany = 0
						end
						if ZP > 0 then
							sberac2TlakPozadovany = math.min(Call("GetControlValue","SberaceJimka",0),5)
						else
							sberac2TlakPozadovany = 0
						end
						sberac1Tlak = Call("GetControlValue","Sberac1Tlak",0)
						sberac2Tlak = Call("GetControlValue","Sberac2Tlak",0)
						if sberac1Tlak < sberac1TlakPozadovany then
							Call("SetControlValue","Sberac1Tlak",0,sberac1Tlak+0.05)
						elseif sberac1Tlak > sberac1TlakPozadovany then
							Call("SetControlValue","Sberac1Tlak",0,sberac1Tlak-0.05)
						end
						if sberac2Tlak < sberac2TlakPozadovany then
							Call("SetControlValue","Sberac2Tlak",0,sberac2Tlak+0.05)
						elseif sberac2Tlak > sberac2TlakPozadovany then
							Call("SetControlValue","Sberac2Tlak",0,sberac2Tlak-0.05)
						end
						Call("SetControlValue","DvereTlak",0,math.min(VirtualMainReservoirPressureBAR,7))
						Call("SetControlValue","PrepinaceTlak",0,math.min(VirtualMainReservoirPressureBAR,5))

					----------------------------------------Ovladani HV---------------------------------------
						PolohaKlice = Call ("GetControlValue", "VirtualStartup", 0)
						if PolohaKlice == 25 then klic = 1 end
						if (PolohaKlice < 50 or Baterie ~= 1) and RizenaRidici == "ridici" then
							Call ( "SetControlValue", "povel_HlavniVypinac", 0, 0)
						elseif ZamekHLvyp == 0 and PolohaKlice > 50 and Baterie == 1 and RizenaRidici == "ridici" then
							Call ( "SetControlValue", "povel_HlavniVypinac", 0, 1)
						end

						if Baterie ~= 1 or Call("GetControlValue", "povel_HlavniVypinac", 0) == 0 then
							Call ( "SetControlValue", "HlavniVypinac", 0, 0)
						elseif ZamekHLvyp == 0 and Baterie == 1 and Call("GetControlValue", "povel_HlavniVypinac", 0) == 1 then
							Call ( "SetControlValue", "HlavniVypinac", 0, 1)
						end

						-- if klic == 1 and PolohaKlice < 75 and PolohaKlice > 50 and Call("GetControlValue","DrziKlicek",0) == 0 then
						-- 	Call("SetControlValue","VirtualStartup",0,75)
						-- end
						-- if klic == 1 and PolohaKlice < 50 and PolohaKlice > 25 and Call("GetControlValue","DrziKlicek",0) == 0 then
						-- 	Call("SetControlValue","VirtualStartup",0,25)
						-- end
						if PolohaKlice < 50 then
							ZamekHLvyp = 0
						end
					----------------------------------------Cvakani HASLERa-----------------------------------
						if Rychlost >= 0.1 then if CasHasler >= 1 then
								HaslerChylka = math.random(-1,1)
								Call("SetControlValue","HaslerRucka",0,(Rychlost+HaslerChylka))
								CasHasler = 0
								end
						elseif Rychlost < 0.1 then
							Call("SetControlValue","HaslerRucka",0,0)
						end
						if Rychlost <= 1 then
							if zvukhasler ~= 1 then
								Call("SetControlValue","ZvukHasler",0,1)
								zvukhasler = 1
							end
						elseif zvukhasler ~= 2 then
							Call("SetControlValue","ZvukHasler",0,2)
							zvukhasler = 2
						end
					----------------------------------------Dvere---------------------------------------------
						--dvere ze soupravy
							if math.floor(ID/2) ~= ID/2 then
								dverePraveVSouprave = Call("GetControlValue","DvereLeveVSouprave",0)
								dvereLeveVSouprave = Call("GetControlValue","DverePraveVSouprave",0)
							else
								dvereLeveVSouprave = Call("GetControlValue","DvereLeveVSouprave",0)
								dverePraveVSouprave = Call("GetControlValue","DverePraveVSouprave",0)
							end

						--kridla dveri
							local LP = Call("GetControlValue","DvereLP",0)
							local LZ = Call("GetControlValue","DvereLZ",0)
							local PP = Call("GetControlValue","DverePP",0)
							local PZ = Call("GetControlValue","DverePZ",0)

							if LP ~= dvereLPskutecne then
								if LP > dvereLPskutecne then
									dvereLPskutecne = dvereLPskutecne + (cas * rychlostOteviraniDveri)
								elseif LP < dvereLPskutecne then
									dvereLPskutecne = dvereLPskutecne - (cas * rychlostZaviraniDveri)
								end
								if dvereLPskutecne < 0 then
									dvereLPskutecne = 0
								end
							end
							Call("SetTime", "Dvere1L", dvereLPskutecne * 2.125)

							if LZ ~= dvereLZskutecne then
								if LZ > dvereLZskutecne then
									dvereLZskutecne = dvereLZskutecne + (cas * rychlostOteviraniDveri)
								elseif LZ < dvereLZskutecne then
									dvereLZskutecne = dvereLZskutecne - (cas * rychlostZaviraniDveri)
								end
								if dvereLZskutecne < 0 then
									dvereLZskutecne = 0
								end
							end
							Call("SetTime", "Dvere2L", dvereLZskutecne * 2.125)

							if PP ~= dverePPskutecne then
								if PP > dverePPskutecne then
									dverePPskutecne = dverePPskutecne + (cas * rychlostOteviraniDveri)
								elseif PP < dverePPskutecne then
									dverePPskutecne = dverePPskutecne - (cas * rychlostZaviraniDveri)
								end
								if dverePPskutecne < 0 then
									dverePPskutecne = 0
								end
							end
							Call("SetTime", "Dvere1P", dverePPskutecne * 2.125)

							if PZ ~= dverePZskutecne then
								if PZ > dverePZskutecne then
									dverePZskutecne = dverePZskutecne + (cas * rychlostOteviraniDveri)
								elseif PZ < dverePZskutecne then
									dverePZskutecne = dverePZskutecne - (cas * rychlostZaviraniDveri)
								end
								if dverePZskutecne < 0 then
									dverePZskutecne = 0
								end
							end
							Call("SetTime", "Dvere2P", dverePZskutecne * 2.125)

						--blokovani dveri
							--true - dvere zablokovane
							--false - dvere odblokovane
							blokLeve = ToBolAndBack(Call("GetControlValue","DvereLeveBlok",0))
							blokPrave = ToBolAndBack(Call("GetControlValue","DverePraveBlok",0))

						--koncove spinace dveri HV
							--true - dvere zavrene
							--false - dvere otevrene
							koncakLeve = false
							koncakPrave = false
							if dvereLPskutecne == 0 and dvereLZskutecne == 0 then
								koncakLeve = true
							end
							if dverePPskutecne == 0 and dverePZskutecne == 0 then
								koncakPrave = true
							end

						--prepinace dveri
							--pravy - 0 leve dvere
								   -- 1 zavrene
								   -- 2 prave dvere
							local prepPravy = Call("GetControlValue","DverePrepPravy",0)
							--levy - otevrit = true, zavrit = false
							local prepLevy = ToBolAndBack(Call("GetControlValue","DverePrepLevy",0))

							--leve dvere lokalni
							if (prepPravy == 0 or prepLevy) and RizenaRidici == "ridici" then
								dvereLevePovelLokalni = true
								dvereLevePridrznyStav = true
							elseif prepPravy >= 1 and not prepLevy then
								dvereLevePovelLokalni = false
							end

							--prave dvere lokalni
							if prepPravy == 2 and RizenaRidici == "ridici" then
								dverePravePovelLokalni = true
								dverePravePridrznyStav = true
							elseif prepPravy <= 1 then
								dverePravePovelLokalni = false
							end

						--pridrzny obvod dveri
							if RizenaRidici == "ridici" then
								if dvereStavLast ~= tostring(dvereLevePovelLokalni)..tostring(dverePravePovelLokalni) or RizenaRidici ~= RizenaRidiciLast_dvere then
									dvereStavLast = tostring(dvereLevePovelLokalni)..tostring(dverePravePovelLokalni)
									RizenaRidiciLast_dvere = RizenaRidici
									if dvereLevePovelLokalni then
										Call("SendConsistMessage",460109,"11",0)
										Call("SendConsistMessage",460109,"11",1)
									else
										Call("SendConsistMessage",460109,"00",0)
										Call("SendConsistMessage",460109,"00",1)
										dvereLevePridrznyStav = false
									end
									if dverePravePovelLokalni then
										Call("SendConsistMessage",460105,"11",0)
										Call("SendConsistMessage",460105,"11",1)
									else
										Call("SendConsistMessage",460105,"00",0)
										Call("SendConsistMessage",460105,"00",1)
										dverePravePridrznyStav = false
									end
								end
							elseif dvereStavLast ~= tostring(dvereLevePovelLokalni)..tostring(dverePravePovelLokalni) or RizenaRidici ~= RizenaRidiciLast_dvere then
								dvereStavLast = tostring(dvereLevePovelLokalni)..tostring(dverePravePovelLokalni)
								RizenaRidiciLast_dvere = RizenaRidici
								if not dvereLevePovelLokalni and dvereLevePridrznyStav then
									Call("SendConsistMessage",460109,"01",0)
									Call("SendConsistMessage",460109,"01",1)
								end
								if not dverePravePovelLokalni and dverePravePridrznyStav then
									Call("SendConsistMessage",460105,"01",0)
									Call("SendConsistMessage",460105,"01",1)
								end
							end

						--blokovaniDveri
							--leve dvere
							if (dvereLevePridrznyStav or dvereLevePovelLokalni or dvereLeveZeSoupravy) and Call("GetSpeed") < 0.1 then
								blokLeve = false
							elseif dvereLeveVSouprave == 0 then
								blokLeve = true
							end

							--prave dvere
							if (dverePravePridrznyStav or dverePravePovelLokalni or dverePraveZeSoupravy) and Call("GetSpeed") < 0.1 then
								blokPrave = false
							elseif dverePraveVSouprave == 0 then
								blokPrave = true
							end

							if tostring(dvereLevePridrznyStav)..tostring(dvereLevePovelLokalni)..tostring(dvereLeveZeSoupravy)..tostring(dverePravePridrznyStav)..tostring(dverePravePovelLokalni)..tostring(dverePraveZeSoupravy)..tostring(blokLeve)..tostring(blokPrave) ~= dvereVypisLast then
								dvereVypisLast = tostring(dvereLevePridrznyStav)..tostring(dvereLevePovelLokalni)..tostring(dvereLeveZeSoupravy)..tostring(dverePravePridrznyStav)..tostring(dverePravePovelLokalni)..tostring(dverePraveZeSoupravy)..tostring(blokLeve)..tostring(blokPrave)
								ZpravaDebug("Dvere leve pridrzny stav: "..tostring(dvereLevePridrznyStav))
								ZpravaDebug("Dvere leve lokalni povel: "..tostring(dvereLevePovelLokalni))
								ZpravaDebug("Dvere leve povel ze soupravy: "..tostring(dvereLeveZeSoupravy))

								ZpravaDebug("Dvere prave pridrzny stav: "..tostring(dverePravePridrznyStav))
								ZpravaDebug("Dvere prave lokalni povel: "..tostring(dverePravePovelLokalni))
								ZpravaDebug("Dvere prave povel ze soupravy: "..tostring(dverePraveZeSoupravy))

								ZpravaDebug("Dvere leve blokovani: "..tostring(blokLeve))
								ZpravaDebug("Dvere prave blokovani: "..tostring(blokPrave))
							end

						
						--prenos stavu dveri do dalsiho vozu
							--leve
							if math.floor(ID/2) ~= ID/2 then
								if dvereLPskutecne ~= 0 or dvereLZskutecne ~= 0 then
									NastavHodnotuSID("DverePraveVSouprave",1,460115)
								elseif dvereLPskutecne == 0 and dvereLZskutecne == 0 then
									NastavHodnotuSID("DverePraveVSouprave",0,460115)
								end

								--prave
								if dverePPskutecne ~= 0 or dverePZskutecne ~= 0 then
									NastavHodnotuSID("DvereLeveVSouprave",1,460114)
								elseif dverePPskutecne == 0 and dverePZskutecne == 0 then
									NastavHodnotuSID("DvereLeveVSouprave",0,460114)
								end
							else
								if dvereLPskutecne ~= 0 or dvereLZskutecne ~= 0 then
									NastavHodnotuSID("DvereLeveVSouprave",1,460114)
								elseif dvereLPskutecne == 0 and dvereLZskutecne == 0 then
									NastavHodnotuSID("DvereLeveVSouprave",0,460114)
								end

								--prave
								if dverePPskutecne ~= 0 or dverePZskutecne ~= 0 then
									NastavHodnotuSID("DverePraveVSouprave",1,460115)
								elseif dverePPskutecne == 0 and dverePZskutecne == 0 then
									NastavHodnotuSID("DverePraveVSouprave",0,460115)
								end
							end
						
						--signalizace otevrenych dveri
							if dvereLeveVSouprave ~= 0 then
								kontrolkaKoncakLeve = false
							else
								kontrolkaKoncakLeve = true
							end

							if dverePraveVSouprave ~= 0 then
								kontrolkaKoncakPrave = false
							else
								kontrolkaKoncakPrave = true
							end

						--rizeni dveri
							DOPCL = ToBolAndBack(Call("GetControlValue","DoorsOpenCloseLeft", 0))
							DOPCP = ToBolAndBack(Call("GetControlValue","DoorsOpenCloseRight", 0))

							--leve
							if DOPCL and not blokLeve then
								Call("SetControlValue","DvereLP",0,1)
								Call("SetControlValue","DvereLZ",0,1)
							elseif DOPCL then
								if RizenaRidici == "ridici" then
									Call("SetControlValue","DverePrepLevy",0,1)
									Napoveda(SysCall("ScenarioManager:FormatString","Nemuzes nechat nastupovat cestujici zavrenymi dvermi! Prestavuji levou klicku do polohy otevreno!"),1)
								else
									Call("SendConsistMessage",460108,"leve",1)
									Call("SendConsistMessage",460108,"leve",0)
								end
							end
							if not dvereLevePridrznyStav and not dvereLevePovelLokalni and not dvereLeveZeSoupravy then
								Call("SetControlValue","DvereLP",0,0)
								Call("SetControlValue","DvereLZ",0,0)
							end

							--prave
							if DOPCP and not blokPrave then
								Call("SetControlValue","DverePP",0,1)
								Call("SetControlValue","DverePZ",0,1)
							elseif DOPCP then
								if RizenaRidici == "ridici" then
									Call("SetControlValue","DverePrepPravy",0,2)
									Napoveda(SysCall("ScenarioManager:FormatString","Nemuzes nechat nastupovat cestujici zavrenymi dvermi! Prestavuji pravou klicku do polohy otevreno-prave!"),1)
								else
									Call("SendConsistMessage",460108,"prave",1)
									Call("SendConsistMessage",460108,"prave",0)
								end
							end
							if not dverePravePridrznyStav and not dverePravePovelLokalni and not dverePraveZeSoupravy then
								Call("SetControlValue","DverePP",0,0)
								Call("SetControlValue","DverePZ",0,0)
							end
						
						--zapis kontrolek
							if Baterie == 1 then
								Call("SetControlValue","DvereLeveBlok",0, ToBolAndBack(blokLeve))
								Call("SetControlValue","DverePraveBlok",0, ToBolAndBack(blokPrave))
								Call("SetControlValue","DvereLeveKoncak",0, ToBolAndBack(kontrolkaKoncakLeve))
								Call("SetControlValue","DverePraveKoncak",0, ToBolAndBack(kontrolkaKoncakPrave))
							else
								Call("SetControlValue","DvereLeveBlok",0, 1)
								Call("SetControlValue","DverePraveBlok",0, 1)
								Call("SetControlValue","DvereLeveKoncak",0, 1)
								Call("SetControlValue","DverePraveKoncak",0, 1)
							end

						if kontrolkaKoncakLeve then
							prasatkoHodnotaL, gProbihaPrasatkoL, gHranicePrasatkoL, gHODNOTA_LAST_PrasatkoL = PIDcntrlCommon(1200,Call("GetControlValue","PrasatkoDvereL",0)*1000,gProbihaPrasatkoL,gHranicePrasatkoL,gHODNOTA_LAST_PrasatkoL,3000)
						else
							prasatkoHodnotaL, gProbihaPrasatkoL, gHranicePrasatkoL, gHODNOTA_LAST_PrasatkoL = PIDcntrlCommon(1800,Call("GetControlValue","PrasatkoDvereL",0)*1000,gProbihaPrasatkoL,gHranicePrasatkoL,gHODNOTA_LAST_PrasatkoL,3000)
						end
						Call("SetControlValue","PrasatkoDvereL",0,prasatkoHodnotaL)
						
						if kontrolkaKoncakPrave then
							prasatkoHodnotaP, gProbihaPrasatkoP, gHranicePrasatkoP, gHODNOTA_LAST_PrasatkoP = PIDcntrlCommon(1200,Call("GetControlValue","PrasatkoDvereP",0)*1000,gProbihaPrasatkoP,gHranicePrasatkoP,gHODNOTA_LAST_PrasatkoP,3000)
						else
							prasatkoHodnotaP, gProbihaPrasatkoP, gHranicePrasatkoP, gHODNOTA_LAST_PrasatkoP = PIDcntrlCommon(1800,Call("GetControlValue","PrasatkoDvereP",0)*1000,gProbihaPrasatkoP,gHranicePrasatkoP,gHODNOTA_LAST_PrasatkoP,3000)
						end
						Call("SetControlValue","PrasatkoDvereP",0,prasatkoHodnotaP)

					----------------------------------------Pantografy----------------------------------------
						if RizenaRidici == "ridici" and (Call("GetControlValue","povel_VirtualPantographControl",0) >= 0 and Call("GetControlValue","povel_VirtualPantographControl",0) < 1.5) and Baterie == 1 and HlavniVypinac == 1 then
							gZadniSmetak = 1
							gPredniSmetak = 0
						elseif RizenaRidici == "ridici" then
							gZadniSmetak = 0
							gPredniSmetak = 0
						end

						if RizenaRidici == "rizena" and (Call("GetControlValue","povel_VirtualPantographControl",0) > 0.5 and Call("GetControlValue","povel_VirtualPantographControl",0) <= 2) and Baterie == 1 and HlavniVypinac == 1 then
							if MaPredniPantograf == 1 then
								gPredniSmetak = 1
								gZadniSmetak = 0
							else
								gPredniSmetak = 0
								gZadniSmetak = 1
							end
						elseif RizenaRidici == "rizena" then
							gZadniSmetak = 0
							gPredniSmetak = 0
						end

						if gCommonTimer >= 0.0125 then
							if gPredniSmetak == 1 then -- predni zberac
								if PredniPanto < 3.75 and Call("GetControlValue","PantoJimka",0) > 0.87393202250021 then
									gPredniSberacControl = gPredniSberacControl + (((Call("GetControlValue","PantoJimka",0)/10)-0.087393202250021)^2)
									Call("SetControlValue", "PantoPredni", 0, gPredniSberacControl)
								end
							elseif gPredniSmetak == 0 then
								if PredniPanto > 0 then
									gPredniSberacControl = gPredniSberacControl - 0.075
									Call("SetControlValue", "PantoPredni", 0, gPredniSberacControl)
								end
							end
							if MaPredniPantograf == 1 then
								if gPredniSberacOld ~= Call("GetControlValue", "PantoPredni", 0) then
									Call("AddTime", "PredniSberac", Call("GetControlValue", "PantoPredni", 0) - gPredniSberacOld)
								end
								gPredniSberacOld = Call("GetControlValue", "PantoPredni", 0)
								if gPredniSberacControl > 3.75 then gPredniSberacControl = 3.75 end
								if gPredniSberacControl < 0 then gPredniSberacControl = 0 end
							end
							if gZadniSmetak == 1 then -- zadni zberac
								if ZadniPanto < 3.75 and Call("GetControlValue","PantoJimka",0) > 0.87393202250021 then
									ZpravaDebug("Sberac"..gZadniSberacControl)
									gZadniSberacControl = gZadniSberacControl + (((Call("GetControlValue","PantoJimka",0)/10)-0.087393202250021)^2)
									Call("SetControlValue", "PantoZadni", 0, gZadniSberacControl)
								end
							elseif gZadniSmetak == 0 then
								if ZadniPanto > 0 then
									gZadniSberacControl = gZadniSberacControl - 0.075
									Call("SetControlValue", "PantoZadni", 0, gZadniSberacControl)
								end
							end
							if gZadniSberacOld ~= Call("GetControlValue", "PantoZadni", 0) then
								Call("AddTime", "ZadniSberac", Call("GetControlValue", "PantoZadni", 0) - gZadniSberacOld)
							end
							gZadniSberacOld = Call("GetControlValue", "PantoZadni", 0)
							if gZadniSberacControl > 3.75 then gZadniSberacControl = 3.75 end
							if gZadniSberacControl < 0 then gZadniSberacControl = 0 end
							gCommonTimer = 0
						end
						if MaPredniPantograf == 1 then PP = Call ("GetControlValue", "PantoPredni", 0) else PP = 0 end
						ZP = Call ("GetControlValue", "PantoZadni", 0)
						if MaPredniPantograf == 1 then PC=math.max(PP,ZP) else PC = ZP end
						if PC == 3.75 then
							P01 = 1
						else
							P01 = 0
						end
						if PP > 3.70 and PP ~= 3.75 then 
							Call("SetControlValue","PantoPredni",0,3.75)
						end
						if ZP > 3.70 and ZP ~= 3.75 then 
							Call("SetControlValue","PantoZadni",0,3.75)
						end
					----------------------------------------Rozjezdov? proud konvert na ??slo-----------------
						if Call("GetControlValue","RozProud",0) == 0 then
							proud = 270
						elseif Call("GetControlValue","RozProud",0) == 0.25 then
							proud = 350
						elseif Call("GetControlValue","RozProud",0) == 0.5 then
							proud = 420
						elseif Call("GetControlValue","RozProud",0) == 0.75 then
							proud = 480
						elseif Call("GetControlValue","RozProud",0) == 1 then
							if stupenKontroleru < 8 then
								proud = 420
							else
								proud = 570
							end
						end
					----------------------------------------Sn?h od kol v zim?--------------------------------
						-- if math.abs(Rychlost) > 10 and RocniObdobi == 3 then
						-- 	Call ("KourP1L:SetEmitterActive",1 ) 
						-- 	Call ("KourP2L:SetEmitterActive",1 ) 
						-- 	Call ("KourP1P:SetEmitterActive",1 ) 
						-- 	Call ("KourP2P:SetEmitterActive",1 ) 
						-- 	Call("KourP1L:SetEmitterRate",math.abs(1/Rychlost))
						-- 	Call("KourP1L:SetInitialVelocityMultiplier",math.abs(Rychlost/3.6))
						-- 	Call("KourP1P:SetEmitterRate",math.abs(1/Rychlost))
						-- 	Call("KourP1P:SetInitialVelocityMultiplier",math.abs(Rychlost/3.6))
						-- 	Call("KourP2P:SetEmitterRate",math.abs(1/Rychlost))
						-- 	Call("KourP2P:SetInitialVelocityMultiplier",math.abs(Rychlost/3.6))
						-- 	Call("KourP2L:SetEmitterRate",math.abs(1/Rychlost))
						-- 	Call("KourP2L:SetInitialVelocityMultiplier",math.abs(Rychlost/3.6))
						-- else
						-- 	Call ("KourP1L:SetEmitterActive",0 ) 
						-- 	Call ("KourP2L:SetEmitterActive",0 ) 
						-- 	Call ("KourP1P:SetEmitterActive",0 ) 
						-- 	Call ("KourP2P:SetEmitterActive",0 ) 
						-- end
					----------------------------------------Vedlej?? funkce-----------------------------------
						if vykon ~= 0 and Baterie == 1 then
							if vykon < 0.85 then
								Call("SetControlValue","odporstup",0,1)
							else
								Call("SetControlValue","odporstup",0,0)
							end
						else
							Call("SetControlValue","odporstup",0,0)
							casfail = 0
						end
						LVZ(Call("GetControlValue","Mirel",0),Call("GetControlValue","LVZzivak",0),cas,JeZivak1)
						if JeZivak1 == 1 and Baterie == 1 then ------- zivak
							CasZivak = CasZivak+cas
							if ZivakReset >= 0.25 and ZivakStary == 0 and NouzoveBrzdeni == 0 then
								if CasZivak > 7 then
									CasZivak = 0
								end
								ZivakStary = 1
							end
							if Call("GetControlValue","EngineBrakeControl",0) >= 0.2 or kodNavesti == 2 and NouzoveBrzdeni == 0 then
								CasZivak = 0
							end
							if CasZivak <= 7 then
								Call ("SetControlValue", "LVZzivak", 0, 1)
								if ZivakReset > 0.25 then
									Call ("SetControlValue", "ZivakPip", 0, 1)
									nadbytecnaObsluha = true
								else
									Call ("SetControlValue", "ZivakPip", 0, 0)
									nadbytecnaObsluha = false
								end
							end
							if CasZivak > 7 and CasZivak <= 15 then
								Call ("SetControlValue", "LVZzivak", 0, 0)
								if ZivakReset > 0.25 and nadbytecnaObsluha then
									Call ("SetControlValue", "ZivakPip", 0, 1)
								else
									Call ("SetControlValue", "ZivakPip", 0, 0)
								end
							end
							if CasZivak > 15 and CasZivak <= 19 then
								Call ("SetControlValue", "LVZzivak", 0, 0)
								Call ("SetControlValue", "ZivakPip", 0, 1)
							end
							if CasZivak > 19 then
								Call ("SetControlValue", "ZivakPip", 0, 0)
								if ZivakReset > 0.25 and nadbytecnaObsluha then
									Call ("SetControlValue", "ZivakPip", 0, 1)
								end
								NouzoveBrzdeni = 1
							end
							if zivaknadruhem == 1 then
								Call ("SetControlValue", "ZivakPip", 0, 1)
								Call ("SetControlValue", "LVZzivak", 0, 0)
								NouzoveBrzdeni = 1
								JeZivak1 = 0
							end
						else
							Call ("SetControlValue", "LVZzivak", 0, 0)
							Call ("SetControlValue", "ZivakPip", 0, 0)
							NouzoveBrzdeni = 0
						end	
						if PosledniBaterie ~= Baterie then
							if Baterie == 0 then
								VypniVse()
							end
						end
					----------------------------------------Zaclonky------------------------------------------
						Call("SetTime", "ZaclonkaLB", Call("GetControlValue", "zaclonkaLB", 0))
						Call("SetTime", "ZaclonkaLP", Call("GetControlValue", "zaclonkaLP", 0))
						Call("SetTime", "ZaclonkaPP", Call("GetControlValue", "zaclonkaPP", 0))
						Call("SetTime", "ZaclonkaPB", Call("GetControlValue", "zaclonkaPB", 0))
					----------------------------------------Baterie-------------------------------------------
						if Baterie == 1 then
							if OsvetleniVozu <= 0.5 then
								OsvetleniVozuF(0)
							elseif OsvetleniVozu <= 1.5 then
								OsvetleniVozuF(1)
							elseif vnitrniSit220Vnouzova == 1 then
								OsvetleniVozuF(2)
							elseif vnitrniSit220Vnouzova ~= 1 then
								OsvetleniVozuF(1)
							end
							if KabinaPrist == 1 then
								KabinaPristF(1)
							end
							if KabinaPrist == 2 then
								KabinaPristF(2)
							end
							if KabinaPrist == 0 then
								KabinaPristF(0)
							end
							if Picka == 0 then
								RozsvitSvetlo("CabLight2",0)
							end
							if Picka == 1 then
								RozsvitSvetlo("CabLight2",1)
							end
							if levaPozBil or levaPozBilVPKC then
								Pozicka("Leva","Bi",1)
							else
								Pozicka("Leva","Bi",0)
							end
							if levaPozCer or levaPozCerVPKC then
								Pozicka("Leva","Cr",1)
							else
								Pozicka("Leva","Cr",0)
							end
							if pravaPozBil or pravaPozBilVPKC then
								Pozicka("Prava","Bi",1)
							else
								Pozicka("Prava","Bi",0)
							end
							if pravaPozCer or pravaPozCerVPKC then
								Pozicka("Prava","Cr",1)
							else
								Pozicka("Prava","Cr",0)
							end
						end
						if DalkovaSv <= 0.5 then
							DalkovaSvF(0,cas,Baterie)
						elseif DalkovaSv <= 1.5 then
							DalkovaSvF(1,cas,Baterie)
						else
							DalkovaSvF(2,cas,Baterie)
						end
						if klic == 1 then -- Jenom pokud je klic ve zdirce
							if PolohaKlice < 25 then -- blokovani dolni schovane
								Call ("SetControlValue", "VirtualStartup", 0, 25)
							end
							if PolohaKlice > 75 then -- blokovani horni schovane
								Call ("SetControlValue", "VirtualStartup", 0, 75)
							end
						end
						if pozadavekNaZapisKlice then
							Call ("SetControlValue", "VirtualStartup", 0, PolohaKlice)
							pozadavekNaZapisKlice = false
						end

						if JeNouzovyRadic == 1 and Call("GetControlValue","RadicNouzovy",0) < 0 then
							Call("SetControlValue","RadicNouzovy",0,0)
						end
						if Rychlost <= 1 and ZivakReset == 1 then
							NouzoveBrzdeni = 0
						end
					----------------------------------------Automatika a kontroler----------------------------
						casstupnu = casstupnu+cas
						if Call("GetControlValue","RidiciKontrolerOkno",0) > 1 and ridiciKontrolerOknoOCVC == Call("GetControlValue","RidiciKontrolerOkno",0) then
							Call("SetControlValue","RidiciKontrolerOkno",0,1)
						end
						kontroler = VratRadic(Call("GetControlValue","VirtualThrottleAndBrake",0),Call("GetControlValue","RidiciKontrolerOkno",0))
						if Call("GetControlValue","VirtualTrainBrakeCylinderPressureBAR",0) > 1.2 then TlakovyBlokJizdy = true end
						if TlakovyBlokJizdy and Call("GetControlValue","VirtualBrakePipePressureBAR",0) >= 4.7 then TlakovyBlokJizdy = false end
						if JeNouzovyRadic == 0 and Call("GetControlValue","PrepinaceTlak",0) > 3.5 and Baterie == 1 and not pojezdVDepu and RizenaRidici == "ridici" then
							caskroku = (math.random(8,12)/20)
							caszkroku = (math.random(3,7)/20)
							if kontroler == 0 or JOB == 0 or Smer == 0 or (PrvniEDBorVzduch == "vzduch" and plynuleValce > 1.2 and plynulaBrzda > 3.5) or not blokLeve or not blokPrave then 
								if kontroler == 0 then
									blokEDB = false
								end
								if vykon > 0 and casstupnu >= caszkroku then
									if vykon - 0.05 > 0 then
										uberstupen = vykon - 0.05
									else
										uberstupen = 0
									end
									Call("SetControlValue","JizdniKontroler",0,uberstupen)
									casstupnu = 0
								elseif vykon < 0 and casstupnu >= caskroku then
									if vykon + 0.5 < 0 then
										pridejstupen = vykon + 0.5
									else
										pridejstupen = 0
									end
									Call("SetControlValue","JizdniKontroler",0,pridejstupen)
									casstupnu = 0
								end
							elseif kontroler == 0.5 and not blokKrok then
								if vykon < 0 and casstupnu >= caszkroku then
									Call("SetControlValue","JizdniKontroler",0,vykon+0.5)
									casstupnu = 0
								elseif vykon < 0.05 and casstupnu >= caskroku and JOB == 1 then	
									Call("SetControlValue","JizdniKontroler",0,vykon+0.05)
									casstupnu = 0
								end
							elseif kontroler == 1 and not blokKrok and ojDiag == 0 then
								if vykon >= 0 and vykon < 1 and casstupnu >= caskroku and JOB == 1 then
									if Ammeter < proud then
										Call("SetControlValue","JizdniKontroler",0,vykon+0.05)
										casstupnu = 0
									end
								elseif vykon < 0 and casstupnu >= caszkroku and JOB == -1 then
									Call("SetControlValue","JizdniKontroler",0,vykon+0.5)
									casstupnu = 0
								end
							elseif kontroler == -0.5 and not blokKrok and Rychlost > 25 and not blokEDB then
								if vykon > 0 and casstupnu >= caszkroku and JOB == 1 then
									Call("SetControlValue","JizdniKontroler",0,vykon-0.05)
									casstupnu = 0
								elseif vykon == 0 and casstupnu >= caskroku and JOB == -1 then	
									Call("SetControlValue","JizdniKontroler",0,vykon-0.5)
									casstupnu = 0
								elseif vykon < -0.5 and casstupnu >= caszkroku and JOB == -1 then
									Call("SetControlValue","JizdniKontroler",0,vykon+0.5)
									casstupnu = 0
								end
							elseif kontroler == -1 and not blokKrok and not blokKrokNU and Rychlost > 25 and not blokEDB and ojDiag == 0 then 
								if vykon <= 0 and vykon > -1 and casstupnu >= caskroku and JOB == -1 then
									if Ammeter >= -350 then
										Call("SetControlValue","JizdniKontroler",0,vykon-0.5)
										casstupnu = 0
									end
								elseif vykon > 0 and casstupnu >= caszkroku and JOB == 1 then
									Call("SetControlValue","JizdniKontroler",0,vykon-0.05)
									casstupnu = 0
								end
							elseif Rychlost < 20 and vykon <= -0.5 then
								blokEDB = true
								Call("SetControlValue","JizdniKontroler",0,vykon+0.5)
							end
						elseif JeNouzovyRadic == 1 and Call("GetControlValue","PrepinaceTlak",0) > 3.5 and Baterie == 1 and not pojezdVDepu then
							caskroku = (math.random(8,12)/20)
							caszkroku = (math.random(3,7)/20)
							if Call("GetControlValue","RadicNouzovy",0) - vykon > 0.03 and casstupnu >= caskroku and JOB == 1 and Smer ~= 0 and ventilatory == 1 then
								Call("SetControlValue","JizdniKontroler",0,vykon+0.05)
								casstupnu = 0
							elseif Call("GetControlValue","RadicNouzovy",0) - vykon < -0.03 and vykon > 0 and casstupnu >= caszkroku or JOB ~= 1 then
								Call("SetControlValue","JizdniKontroler",0,vykon-0.05)
								casstupnu = 0
							end
						end
						vykon = Call("GetControlValue","JizdniKontroler",0) 
						if (vykon < 0.05 and vykon >= 0) or (vykon > -0.5 and vykon <= 0) then 
							Call("SetControlValue","JizdniKontroler",0,0) 
							vykon = 0 
						end
						if (PC == 3.75 and HlavniVypinac == 1 and Baterie == 1 and Call("GetControlValue","Ventilatory",0) == 1 and not (SnizenyVykonVozu and vykon > 0) and JOB ~= 0) or pojezdVDepu then -- kontrola podmínek pro jízdu
							Call("SetControlValue","VykonPredTrCh",0,Call("GetControlValue","JizdniKontroler",0))
						else
							Call("SetControlValue","VykonPredTrCh",0,0)
						end
						if JeNouzovyRadic == 0 then
							if Call("GetControlValue","VirtualThrottleAndBrake",0) > 1 then
								Call("SetControlValue","VirtualThrottleAndBrake",0,1)
							end
						end
						if JeNouzovyRadic == 1 and Call("GetControlValue","RadicNouzovy",0) > 0.85 then
							Call("SetControlValue","RadicNouzovy",0,0.85)
						end
						stupenKontroleruOld = stupenKontroleru
						if vykon > 0 then
							stupenKontroleru = vykon/0.05
							cele, zbytek = divMod(stupenKontroleru,1) 
							if zbytek ~= 0 then
								if zbytek > 0.5 then
									stupenKontroleru = cele + 1
								else 
									stupenKontroleru = cele
								end
							end
						end
						if vykon < 0 then
							stupenKontroleru = vykon/0.5
							cele, zbytek = divMod(stupenKontroleru,1)
							if zbytek ~= 0 then
								if zbytek < -0.5 then
									stupenKontroleru = cele - 1
								else
									stupenKontroleru = cele
								end
							end
						end

						local blokujJK = false
						local blokujSmer = false
						if Smer == 0 or Smer == 2 then
							blokujJK = true
						end
						if vykon ~= 0 or (Call("GetControlValue","VirtualThrottleAndBrake",0) ~= 0 and Call("GetControlValue","VirtualThrottleAndBrake",0) ~= 2) or (Call("GetControlValue","RadicNouzovy",0) ~= 0 and Call("GetControlValue","RadicNouzovy",0) ~= 2) then
							blokujSmer = true
						end

						if blokujSmer then
							if smerBlokovany == nil then
								cele, zbytek = divMod(Smer,1)
								smerBlokovany = cele
								if zbytek > 0.5 then
									smerBlokovany = smerBlokovany + 1
								end
							end
							Call("SetControlValue","UserVirtualReverser",0,smerBlokovany)
						else
							smerBlokovany = nil
						end
						
						if blokujJK then
							if JeNouzovyRadic == 0 then
								if JKBlokovany == nil then
									cele, zbytek = divMod(Call("GetControlValue","VirtualThrottleAndBrake",0),1)
									JKBlokovany = cele
									if zbytek > 0.5 then
										JKBlokovany = JKBlokovany + 1
									end
								end
								Call("SetControlValue","VirtualThrottleAndBrake",0,JKBlokovany)
							else
								Call("SetControlValue","RadicNouzovy",0,0)
							end
						else
							JKBlokovany = nil
						end
						
						if JeNouzovyRadic == 1 then
							Call("SetControlValue","VirtualThrottleAndBrake",0,2)
							if math.abs(Call("GetControlValue","RadicNouzovy",0)) < 0.025 then
								Call("LockControl","JeNouzovyRadic",0,0)
							end
						else
							Call("SetControlValue","RadicNouzovy",0,2)
							if math.abs(Call("GetControlValue","VirtualThrottleAndBrake",0)) < 0.05 then
								Call("LockControl","JeNouzovyRadic",0,0)
							end
						end

						if math.abs(Call("GetControlValue","VirtualThrottleAndBrake",0)) > 0.05 and math.abs(2-Call("GetControlValue","VirtualThrottleAndBrake",0)) > 0.05 then
							Call("SetControlValue","JeNouzovyRadic",0,0)
							Call("LockControl","JeNouzovyRadic",0,1)
						end

						if math.abs(Call("GetControlValue","RadicNouzovy",0)) > 0.025 and math.abs(2-Call("GetControlValue","RadicNouzovy",0)) > 0.025 then
							Call("SetControlValue","JeNouzovyRadic",0,1)
							Call("LockControl","JeNouzovyRadic",0,1)
						end

					----------------------------------------Ventil?tory---------------------------------------
						if HlavniVypinac == 1 and PC == 3.75 and Baterie == 1 and Call("GetControlValue","Reverser",0) ~= 0 and vnitrniSit220V == 1 then
							Call("SetControlValue","Ventilatory",0,1)
							ventilatory = 1
						elseif HlavniVypinac ~= 1 or PC ~= 3.75 or Baterie ~= 1 or Call("GetControlValue","Reverser",0) == 0 or vnitrniSit220V ~= 1 then
							Call("SetControlValue","Ventilatory",0,0)
							ventilatory = 0
						end

						if ventilatory == 0 and JOB ~= 0 then
							Call ( "SetControlValue", "HlavniVypinac", 0, 0)
							ZamekHLvyp = 1
						end

						local nabehVentilatoru = 5.333
						local dobehVentilatoru = 9.130
						local delkaLoop = 2.008

						local poleNabehy = {0,0.1,0.2,0.3,0.4,0.5,0.6,0.7,0.8,0.9}

						local poleDobehy = {1,0.9,0.8,0.7,0.6,0.5,0.4,0.3,0.2,0.1}

						if ventilatoryOtacky == 1 then
							blokujNabeh = false
						end
						if ventilatoryOtacky == 0 then
							blokujDobeh = false
						end

						local a, b = divMod(ventilatoryOtacky,0.05)

						local i = 1
						while i <= 10 do
							Call("SetControlValue","VentilatoryNabeh"..i,0,0)
							Call("SetControlValue","VentilatoryDobeh"..i,0,0)
							i = i + 1
						end

						if Smer == 0 then
							blokujNabeh = false
						else
							blokujDobeh = false
						end

						if ventilatory == 1 and b < 0.01 and not blokujNabeh and ventilatoryOtacky <= 0.91 then
							local i = 1
							while i <= 10 do
								if math.abs(ventilatoryOtacky - poleNabehy[i]) < 0.01 then
									Call("SetControlValue","VentilatoryNabeh"..i,0,1)
									blokujNabeh = true
									blokujDobeh = false
									break 
								end
								i = i + 1
							end
						elseif ventilatory == 0 and b < 0.01 and not blokujDobeh and ventilatoryOtacky >= 0.09 then
							local i = 1
							while i <= 10 do
								if math.abs(ventilatoryOtacky - poleDobehy[i]) < 0.01 then
									Call("SetControlValue","VentilatoryDobeh"..i,0,1)
									blokujDobeh = true
									blokujNabeh = false
									break 
								end
								i = i + 1
							end
						end

						if ventilatory == 1 and ventilatoryOtacky < 1 then
							ventilatoryOtacky = ventilatoryOtacky + cas/nabehVentilatoru
						elseif ventilatory == 0 and ventilatoryOtacky > 0 then
							ventilatoryOtacky = ventilatoryOtacky - cas/dobehVentilatoru
						end

						Call("SetControlValue","VentilatoryOtacky",0,ventilatoryOtacky)

						if ventilatoryOtacky < 0 then
							ventilatoryOtacky = 0
						elseif ventilatoryOtacky > 1 then
							ventilatoryOtacky = 1
						end

					----------------------------------------Vypnut? HV p?i nespln?n? (Baterie+Zdroj+Panto)----
						if HlavniVypinac == 1 and Baterie == 1 and vykon ~= 0 and JOB ~= 0 then
							HVvyp = 1
						else
							HVvyp = 0
						end
						if pojezdVDepu then
							Call("SetControlValue","PantographControl",0,1)
							vypinacstare = "zzzz"
						elseif HVvyp ~= vypinacstare then
							Call("SetControlValue","PantographControl",0,HVvyp)
							vypinacstare = HVvyp
						end
						if (vykon > 0 or JOB > 0) and Call("GetControlValue","VirtualBrakePipePressureBAR",0) < 3.2 then
							Call ( "SetControlValue", "HlavniVypinac", 0, 0)
							ZamekHLvyp = 1
						end

					----------------------------------------Sn??en? v?kon-------------------------------------
						if Call("GetControlValue","JizdniKontroler",0) == 0 then
							if Call("GetControlValue","snizenyvykonanim",0) == 1 then
								Call("SetControlValue","SnizenyVykon",0,1)
								snizenyVykonTady = true
							elseif snizenyVykonTady then
								snizenyVykonTady = false
								Call("SetControlValue","SnizenyVykon",0,0)
							end
						end
						if Call("GetControlValue","snizenyvykonanim",0) == 0 and Call("GetControlValue","SnizenyVykon",0) == 1 and Call("GetControlValue","VykonPredTrCh",0) == 0 then
							SnizenyVykonVozu = true
						else
							SnizenyVykonVozu = false
						end
					----------------------------------------Brzdi? z?mek--------------------------------------
						if (Call("GetControlValue","ZamekBS2vs",0) ~= 1 or gKlicTady) and Call("GetControlValue","VirtualBrake",0) > 0.85 and Call("GetControlValue","VirtualBrake",0) < 0.87 then
							Call("LockControl","ZamekBS2",0,0)
						else
							Call("LockControl","ZamekBS2",0,1)
						end
						if Call("GetControlValue","ZamekBS2",0) == 0 then
							Call("SetControlValue","ZamekBS2vs",0,1)
							Call("LockControl","VirtualBrake",0,0)
							gKlicTady = true
						elseif Call("GetControlValue","ZamekBS2",0) == 1 and gKlicTady then
							Call("SetControlValue","ZamekBS2vs",0,0)
							gKlicTady = false
						end
						if Call("GetControlValue","ZamekBS2",0) ~= 0 then
							Call("LockControl","VirtualBrake",0,1)
						end
					----------------------------------------Nouzové vypnutí všech HV--------------------------
						if Call("GetControlValue","NZvyp",0) >= 0.5 then
							Call ( "SetControlValue", "HlavniVypinac", 0, 0)
							Call ( "SetControlValue", "povel_HlavniVypinac", 0, 0)
							ZamekHLvyp = 1
						end
					----------------------------------------Matrosov------------------------------------------
						if Call("GetControlValue","Matrosov",0) >= 0.5 then
							matrosov = true
						else
							matrosov = false
						end
					----------------------------------------Rychlý start--------------------------------------
						if pozadavekNaFastStart == 1 and not jeMrtva then
							nastavenaBrzda = 5.0
							plynulaBrzda = 5.0
							nastaveneValce = 0
							plynuleValce = 0
							Call("SetControlValue","ZamekBS2",0,0)
							Call("SetControlValue","ZamekBS2vs",0,1)
							Call("SetControlValue","VirtualBrake",0,0.14)
							VirtualMainReservoirPressureBAR = 10
							VirtualBrakeReservoirPressureBAR = 5
							gKlicTady = true
							RizenaRidici = "ridici"
							Call("SetControlValue","Baterie",0,1)
							Baterie = 1
							Call("SetControlValue","VirtualPantographControl",0,1)
							Call ("SetControlValue", "PantoZadni", 0,3.75) 
							gZadniSberacControl = 3.75
							PC = 3.75
							Call("SendConsistMessage",460101,"1",1)
							Call("SendConsistMessage",460111,"Z",1)
							Call("SetControlValue","UserVirtualReverser",0,0)
							Smer = 0
							Call("SetControlValue","Reverser",0,0)
							Call("SetControlValue","mgp",0,1)
							mgp = 1
							Call("SetControlValue","mg",0,souprava)
							Call("SetControlValue","mgVS",0,souprava)
							Call("SetControlValue","mgPriprava",0,2^(ID-1))
							Call("SetControlValue","mgZvuk",0,1)
							mg = 1
							napetiVS220 = 380 
							napetiVS220nouz = 380
							Call("SetControlValue","VirtualStartup",0,75)
							Call ( "SetControlValue", "HlavniVypinac", 0, 1)
							Call ( "SetControlValue", "povel_HlavniVypinac", 0, 1)
							Call("SetControlValue","VolbaPozicKonecCelo",0,0)
							Call("SetControlValue","HlKompPrep",0,1)
							Call("SetControlValue","JeZivakZap",0,1)
							LDkontrolka = 0
							Call("SetControlValue","DvereLeveSignal",0,0)
							PDkontrolka = 0
							Call("SetControlValue","DverePraveSignal",0,0)
							Call("OnControlValueChange","VolbaPozicKonecCelo",0,0)
							JeZivak1 = 1
							LVZ(0,0,0,0)
							klic = 1
							Call("SetControlValue","VirtualMainReservoirPressureBAR",0,VirtualMainReservoirPressureBAR)
							Call("SetControlValue","VirtualBrakePipePressureBAR",0,plynulaBrzda)
							Call("SetControlValue","VirtualTrainBrakeCylinderPressureBAR",0,VirtualTrainBrakeCylinderPressureBAR)
							Call("SetControlValue","VirtualBrakeReservoirPressureBAR",0,VirtualBrakeReservoirPressureBAR)
							Call("SetControlValue","PantoJimka",0,3.11)
							Call("SetControlValue","EngineBrakeControl",0,0)
							Call("SetControlValue","HandBrake",0,0);
							SysCall("ScenarioManager:ShowMessage", ZPRAVA_HLAVICKA, ZPRAVA_FAST_START,ALERT)
							Call("SetControlValue","FastStart",0,0)
							pozadavekNaFastStart = 0
							levaPozBilVPKC = true
							levaPozCerVPKC = false
							pravaPozBilVPKC = true
							pravaPozCerVPKC = false
							PantoJimkaZKom = 3.11
							Call("SetControlValue","mgautostart",0,1)
						elseif pozadavekNaFastStart == 1 and jeMrtva then
							SysCall("ScenarioManager:ShowMessage", ZPRAVA_HLAVICKA, ZPRAVA_NEUSPESNY_FAST_START,ALERT)
							pozadavekNaFastStart = 0
						elseif pozadavekNaFastStart == 2 and not jeMrtva then
							levaPozBilVPKC = false
							levaPozCerVPKC = true
							pravaPozBilVPKC = false
							pravaPozCerVPKC = true
							nastavenaBrzda = 5.0
							plynulaBrzda = 5.0
							nastaveneValce = 0
							plynuleValce = 0
							Call("SetControlValue","Baterie",0,1)
							Baterie = 1
							Call("SetControlValue","VirtualPantographControl",0,1)
							if MaPredniPantograf == 1 then Call ("SetControlValue", "PantoPredni", 0,3.75) gPredniSberacControl = 3.75 else Call ("SetControlValue", "PantoZadni", 0,3.75) gZadniSberacControl = 3.75 end
							PC = 3.75
							Call("SetControlValue","EngineBrakeControl",0,0)
							Call("SetControlValue","HandBrake",0,0)
							Call("SetControlValue","VirtualStartup",0,0)
							Call("SetControlValue","VolbaPozicKonecCelo",0,2)
							Call("OnControlValueChange","VolbaPozicKonecCelo",0,2)
							klic = 0
							Call("SendConsistMessage",460101,"0",1)
							VirtualMainReservoirPressureBAR = 10
							VirtualBrakeReservoirPressureBAR = 5
							Call("SetControlValue","VirtualMainReservoirPressureBAR",0,VirtualMainReservoirPressureBAR)
							Call("SetControlValue","VirtualBrakePipePressureBAR",0,plynulaBrzda)
							Call("SetControlValue","VirtualTrainBrakeCylinderPressureBAR",0,VirtualTrainBrakeCylinderPressureBAR)
							Call("SetControlValue","VirtualBrakeReservoirPressureBAR",0,VirtualBrakeReservoirPressureBAR)
							Call("SetControlValue","PantoJimka",0,3.11)
							Call("SetControlValue","mgZvuk",0,1)
							mg = 1
							napetiVS220 = 380 
							napetiVS220nouz = 380
							pozadavekNaFastStart = 0
							PantoJimkaZKom = 3.11
							Call("SetControlValue","mgautostart",0,1)
						elseif pozadavekNaFastStart == 2 and jeMrtva then
							SysCall("ScenarioManager:ShowMessage", ZPRAVA_HLAVICKA, ZPRAVA_NEUSPESNY_FAST_START,ALERT)
							pozadavekNaFastStart = 0
						end
					----------------------------------------JOB-----------------------------------------------
						if RizenaRidici == "ridici" then
							if kontroler > 0 and Call("GetControlValue","VykonPredTrCh",0) == 0 and Baterie == 1 and ventilatory == 1 and not TlakovyBlokJizdy and P01 == 1 then
								Call("SetControlValue","JOBpovel",0,1)
							elseif kontroler < 0 and Call("GetControlValue","VykonPredTrCh",0) == 0 and Baterie == 1 and ventilatory == 1 and (not TlakovyBlokJizdy or (TlakovyBlokJizdy and PrvniEDBorVzduch ~= "vzduch") or plynulaBrzda <= 3.5) then
								Call("SetControlValue","JOBpovel",0,-1)
							elseif Call("GetControlValue","VykonPredTrCh",0) == 0 or ventilatory == 0 or Baterie == 0 or ((TlakovyBlokJizdy and not PrvniEDBorVzduch == "vzduch") and plynulaBrzda <= 3.5) or P01 ~= 1 then
								Call("SetControlValue","JOBpovel",0,0)
							end
						end
						if Call("GetControlValue","VykonPredTrCh",0) == 0 and Baterie == 1 and ventilatory == 1 and not TlakovyBlokJizdy and P01 == 1 and Call("GetControlValue","JOBpovel",0) == 1 and ojDiag == 0 then
							Call("SetControlValue","JOB",0,1)
						elseif Call("GetControlValue","VykonPredTrCh",0) == 0 and Baterie == 1 and ventilatory == 1 and (not TlakovyBlokJizdy or (TlakovyBlokJizdy and PrvniEDBorVzduch ~= "vzduch") or plynulaBrzda <= 3.5) and Call("GetControlValue","JOBpovel",0) == -1 and ojDiag == 0 then
							Call("SetControlValue","JOB",0,-1)
						elseif Call("GetControlValue","VykonPredTrCh",0) == 0 or ventilatory == 0 or Baterie == 0 or ((TlakovyBlokJizdy and not PrvniEDBorVzduch == "vzduch") and plynulaBrzda <= 3.5) or P01 ~= 1 or Call("GetControlValue","JOBpovel",0) == 0 or ojDiag == 1 then
							Call("SetControlValue","JOB",0,0)
						end
						if Ammeter > 600 and JOB == 0 and JOBold ~= 0 then
							VypniHVaVynutRestart()
						end
					----------------------------------------Pojezd v depu-------------------------------------
						if PC == 0 and Baterie == 1 and centrala == 1 and JOB == 0 and buttonPojezdVDepu > 0.75 then
							pojezdVDepu = true
							Call("SetControlValue","VykonPredTrCh",0,0.01)
							Call("SetControlValue","StykacPojezd",0,1)
						else
							pojezdVDepu = false
							Call("SetControlValue","StykacPojezd",0,0)
						end
					----------------------------------------Okenka--------------------------------------------
						-- okno = Call("GetControlValue","OknoL",0)
						-- if okno ~= oknoStare then
							-- occlusion = (-1200-(okno*600))
							-- lfRatio = (0.15+(okno*0.51))
							-- roomRatio = (1 - (okno*0.34))
							-- Call("*:SetParameter","Occlusion",occlusion)
							-- Call("SetControlValue","Occlusion",0,occlusion)
							-- Call("*:SetParameter","OcclusionLFratio",lfRatio)
							-- Call("SetControlValue","OcclusionLFratio",0,lfRatio)
							-- Call("*:SetParameter","OcclusionRoomRatio",roomRatio)
							-- Call("SetControlValue","OcclusionRoomRatio",0,roomRatio)
							-- oknoStare = okno
						-- end
					----------------------------------------Vnitrni sit---------------------------------------
						mgZvuk = Call("GetControlValue","mgZvuk",0)
						if mgZvuk == 1 and napetiVS220 < 380 then
							napetiVS220 = napetiVS220 + cas * 100
						elseif mgZvuk == 0 and napetiVS220 > 0 then
							napetiVS220 = napetiVS220 - cas * 10
						end
						if napetiVS220 > 300 and mgs == 0 and mgdocasny == 0 then
							vnitrniSit220V = 1
						else
							vnitrniSit220V = 0
						end
						Call("SetControlValue","VnitrniSit",0,napetiVS220)

						if Call("GetControlValue","mgVS",0) > 1 and napetiVS220nouz < 380 then
							napetiVS220nouz = napetiVS220nouz + cas * 100
						elseif Call("GetControlValue","mgVS",0) == 0 and napetiVS220nouz > 0 then
							napetiVS220nouz = napetiVS220nouz - cas * 10
						end
						if math.max(napetiVS220nouz,napetiVS220) > 300 and mgs == 0 and mgdocasny == 0 then
							vnitrniSit220Vnouzova = 1
						else
							vnitrniSit220Vnouzova = 0
						end
						Call("SetControlValue","VnitrniSitNouzova",0,math.max(napetiVS220nouz,napetiVS220))
					
					----------------------------------------Custom TrCh---------------------------------------
						Call("SetControlValue","ThrottleAndBrake",0,VratTCh(Call("GetControlValue","VykonPredTrCh",0)))
						vykon = Call("GetControlValue","VykonPredTrCh",0)
					----------------------------------------Custom Ampermetr----------------------------------
						Call("SetControlValue","Ampermetr",0,VratProud(Call("GetControlValue","ThrottleAndBrake",0),Call("GetControlValue","VykonPredTrCh",0)))
						Ammeter = Call("GetControlValue","Ampermetr",0)
						Call("SetControlValue","VirtualAmmeter",0,PIDcntrlAmp(Call("GetControlValue","Ampermetr",0),Call("GetControlValue","VirtualAmmeter",0)))
						
					----------------------------------------VOLTMETR------------------------------------------
						local tvrdostNapeti = math.sqrt(math.sqrt(math.floor(((math.floor(os.time()/100)/100) - math.floor(math.floor(os.time()/100)/100))*100)+mm))
						local napeti = ((3000 - (200 * Ammeter / 700)) - ((tvrdostNapeti-2.5) * 300)) / 3.896
						if Ammeter < 0 then
							napeti = (3000 - ((tvrdostNapeti-2.5) * 300)) / 3.896
						end
						if P01 == 1 and not pojezdVDepu then
							Call("SetControlValue","Napeti",0,napeti)
							Call("SetControlValue","Voltmeter",0,PIDcntrlVolt(napeti,Call("GetControlValue","Voltmeter",0)))
						else
							Call("SetControlValue","Voltmeter",0,PIDcntrlVolt(0,Call("GetControlValue","Voltmeter",0)))
							Call("SetControlValue","Napeti",0,0)
						end
						
					----------------------------------------Diagnostický panel a ochrany----------------------
						local podminkyDiag = false
						if Baterie == 1 and RizenaRidici == "ridici" then
							podminkyDiag = true
						end
						local stridaveNap = ToBolAndBack(vnitrniSit220Vnouzova)
						--*******H6
							if math.min(failmg, Baterie,RizenaRidiciJednaNula) == 1 then
								diag220V = 1
							else
								diag220V = 0
							end
							Call("SetControlValue","Diag_220V",0,diag220V) -- H6
							
						--*******H7
							if podminkyDiag and ZamekHLvyp == 1 then
								diagHV = 1
							end
							if PolohaKlice == 25 then
								diagHV = 0
							end
							Call("SetControlValue","Diag_HV",0,diagHV) -- H7
						
						--*******H8
							local diagVentilatoryBeh = 0
							if ventilatory == 1 then
								gTimeVentilatory = gTimeVentilatory + cas
								if gTimeVentilatory > math.random(3,6) then
									diagVentilatoryBeh = 0
								elseif podminkyDiag then
									diagVentilatoryBeh = 1
								end
							else
								gTimeVentilatory = 0
								if podminkyDiag then
									diagVentilatoryBeh = 0
								end
							end
							Call("SetControlValue","Diag_Ventilatory",0,diagVentilatoryBeh) -- H8
						
						--*******H9
							local diagArel = 0
							Call("SetControlValue","Diag_AREL",0,diagArel) -- H9
						
						--*******H10
							local diagPretaveni = 0
							Call("SetControlValue","Diag_Pretaveni",0,diagPretaveni) -- H10
						
						--*******H11
							if (not stridaveNap or (Rychlost > 85 and vykon < -0.5)) and podminkyDiag and blokOchran == false then
								diagNU = 1
								if Call("GetControlValue","Diag_NU",0) == 0 then
									-- Call ( "SetControlValue", "HlavniVypinac", 0, 0)
									-- ZamekHLvyp = 1
									blokKrokNU = true
									if vykon == -1 then
										Call("SetControlValue","JizdniKontroler",0,-0.5)
									end
								end
								if P01 ~= 1 then
									resetujNUpoZvednuti = true
								end
							elseif Smer == 0 then
								diagNU = 0
								blokKrokNU = false
							end
							if not stridaveNap and podminkyDiag then
								diagNU = 1
								if P01 ~= 1 then
									resetujNUpoZvednuti = true
								end
							end
							if resetujNUpoZvednuti and stridaveNap then
								diagNU = 0
								blokKrokNU = false
								resetujNUpoZvednuti = false
							end
							Call("SetControlValue","Diag_NU",0,diagNU) -- H11
						
						--*******H12
							if podminkyDiag and Smer ~= 0 and (not stridaveNap or (Call("GetControlValue","Napeti",0) < 500 and Call("GetControlValue","PantographControl",0) == 1)) and blokOchran == false then
								diagPU = 1
								if Call("GetControlValue","Diag_PU",0) == 0 and P01 == 1 then
									Call ( "SetControlValue", "HlavniVypinac", 0, 0)
									ZamekHLvyp = 1
								end
								if P01 ~= 1 then
									resetujPUpoZvednuti = true
								end
							elseif Smer == 0 then
								diagPU = 0
							end
							if not stridaveNap and podminkyDiag then
								diagPU = 1
								if P01 ~= 1 then
									resetujPUpoZvednuti = true
								end
							end
							if resetujPUpoZvednuti and stridaveNap then
								diagPU = 0
								resetujPUpoZvednuti = false
							end
							Call("SetControlValue","Diag_PU",0,diagPU) -- H12
						
						--*******H13
							if (skluzWheelSlip == 1 or not stridaveNap) and podminkyDiag and (blokOchran == false or blokOchran == "DOTO") then
								casSkluz = casSkluz + cas
								if wheelSlip > 2  and P01 == 1 then
									Call ( "SetControlValue", "HlavniVypinac", 0, 0)
									ZamekHLvyp = 1
								else
									if casSkluz > 1 then
										casSkluz = 0
										if vykon > 0 then
											Call("SetControlValue","JizdniKontroler",0,vykon - 0.05)
										elseif vykon < 0 then
											Call("SetControlValue","JizdniKontroler",0,vykon + 0.5)
										end
									end
								end
								if P01 ~= 1 then
									resetujDOTOpoZvednuti = true
								end
								skluzDiag = 1
								blokOchran = "DOTO"
								blokKrok = true
								--Call("GetControlValue","ResetDOTO",0) > 0.75
							elseif not podminkyDiag or (blokOchran == "DOTO" and Smer == 0) then
								skluzDiag = 0
								blokOchran = false
								blokKrok = false
							end
							if skluzWheelSlip == 0 then
								casSkluz = 0
							end
							if not stridaveNap and podminkyDiag and (blokOchran == false or blokOchran == "DOTO") then
								if P01 ~= 1 then
									resetujDOTOpoZvednuti = true
								end
								skluzDiag = 1
								blokOchran = "DOTO"
							end
							if resetujDOTOpoZvednuti and stridaveNap then
								skluzDiag = 0
								resetujDOTOpoZvednuti = false
								blokKrok = false
							end
							Call("SetControlValue","Diag_DOTO",0,skluzDiag) -- H13
						
						--*******H14
							local mgDiag = 0
							if false and podminkyDiag and (blokOchran == false or blokOchran == "DOPM") then
								mgDiag = 1 
								blokOchran = "DOPM"
								--Call("GetControlValue","ResetDOPM",0) > 0.75
							elseif not podminkyDiag or (blokOchran == "DOPM" and Smer == 0) then 
								mgDiag = 0 
								blokOchran = false
							end
							if not stridaveNap and podminkyDiag and (blokOchran == false or blokOchran == "DOPM") then
								mgDiag = 1
								blokOchran = "DOPM"
							end
							Call("SetControlValue","Diag_DOPM",0,mgDiag) -- H14
						
						--*******H15
							local niDiag = 0
							if Ammeter > 800 and podminkyDiag and (blokOchran == false or blokOchran == "NI") then
								niDiag = 1 
								blokOchran = "NI"
								if Call("GetControlValue","Diag_NI",0) == 0 and P01 == 1 then
									Call ( "SetControlValue", "HlavniVypinac", 0, 0)
									ZamekHLvyp = 1
								end
							elseif not podminkyDiag or (blokOchran == "NI" and Smer == 0) then 
								niDiag = 0 
								blokOchran = false
							end
							if not stridaveNap and podminkyDiag and (blokOchran == false or blokOchran == "NI") then
								niDiag = 1
								blokOchran = "NI"
							end
							Call("SetControlValue","Diag_NI",0,niDiag) -- H15
						
						--*******H18
							if podminkyDiag and blokOchran == false and vykon ~= 0 and math.abs(Ammeter) < 2 then
								ojDiag = 1
							elseif not podminkyDiag or blokOchran ~= false or kontroler == 0 or math.abs(Ammeter) > 2 then
								ojDiag = 0
							end
							Call("SetControlValue","Diag_OJ",0,ojDiag) -- H18

						--*******H19
							local rbDiag = 0
							if podminkyDiag and Ammeter > -300 and PrvniEDBorVzduch == "EDB" then
								rbDiag = 1
							end
							Call("SetControlValue","Diag_RB",0,rbDiag) -- H19
						
						--*******H20
							local uzemneniDiag = 0
							Call("SetControlValue","Diag_Uzem",0,uzemneniDiag) -- H20
						
						--*******H22
							local jobDiag = 0
							if podminkyDiag and ((Call("GetControlValue","VykonPredTrCh",0) > 0 and JOB ~= 1) or (Call("GetControlValue","VykonPredTrCh",0) == 0 and JOB ~= 0) or (Call("GetControlValue","VykonPredTrCh",0) < 0 and JOB ~= -1)) then
								jobDiag = 1
							end
							Call("SetControlValue","Diag_JOB",0,jobDiag) -- H22
						
						--*******H24
							local rozProudDiag = 0
							if podminkyDiag and Ammeter > proud then
								rozProudDiag = 1
							end
							if not stridaveNap and podminkyDiag then
								rozProudDiag = 1
							end
							Call("SetControlValue","Diag_RozProud",0,rozProudDiag) -- H24
						--*******ObecnaPorucha a Skluz
							if Call("GetControlValue","JOB",0) ~= 0 and Call("GetControlValue","VykonPredTrCh",0) == 0 then
								failvykon = 1 
							else
								failvykon = 0
							end
							if stridaveNap then
								skluzmg = 0
							else
								skluzmg = 1
							end
							if vnitrniSit220V ~= 1 then
								failmg = 1
							else
								failmg = 0
							end
							if Call("GetControlValue","SnizenyVykon",0) == 1 and Call("GetControlValue","snizenyvykonanim",0) == 1 and Call("GetControlValue","JizdniKontroler",0) ~= 0 and kontroler > 0 then
								desynchronizaceHK = 1
							elseif Call("GetControlValue","JizdniKontroler",0) == 0 or kontroler <= 0 then
								desynchronizaceHK = 0
							end
							Call("SetControlValue","fail",0,math.min(math.max(failmg,failvykon,desynchronizaceHK,diag220V,diagHV,diagArel,diagPretaveni,diagNU,diagPU,skluzDiag,mgDiag,niDiag,ojDiag,uzemneniDiag,jobDiag),Baterie))
							Call("SetControlValue","skluz",0,math.min(math.max(skluzmg,skluzWheelSlip),Baterie))
						--*******H5
							local PoruchaNap = 0
							if not stridaveNap and podminkyDiag then
								PoruchaNap = 1
							end
							Call("SetControlValue","Diag_Porucha",0,math.min(math.max(failmg,failvykon,PoruchaNap,diag220V,diagHV,diagArel,diagPretaveni,diagNU,diagPU,skluzDiag,mgDiag,niDiag,ojDiag,uzemneniDiag,jobDiag),Baterie,RizenaRidiciJednaNula)) -- H5
							
						--*******Odshuntovani az do odporu
							if stupenKontroleru > 17 then
								shunty = true
							else
								shunty = false
							end
							if shunty and stupenKontroleru < stupenKontroleruOld then
								pocitejCasShuntu = true
							end
							if not shunty then
								pocitejCasShuntu = false
							end 
							if pocitejCasShuntu then
								casShuntu = casShuntu + cas
							else
								casShuntu = 0
							end
							if casShuntu > 6 then
								Call("SetControlValue","HlavniVypinac",0,0)
								ZamekHLvyp = 1
							end
				--##################################################################################--
				------------------------------------KONEC gásti expert controls-----------------------
				--##################################################################################--
			-- else
			-- 	--##################################################################################--
			-- 	------------------------------------ČOST simple controls------------------------------
			-- 	--##################################################################################--
			-- 	if UzJsiZjistovalPanto == false then
			-- 		MaPredniPantograf = Call("ControlExists","PantoPredni",0)
			-- 		UzJsiZjistovalPanto = true
			-- 		Call ( "DalkovePrave:Activate", 0 )
			-- 		Call ( "DalkoveLeve:Activate", 0 )
			-- 		Call ( "ActivateNode","dalkaclevy",0)
			-- 		Call ( "ActivateNode","dalkacpravy",0)
			-- 		Call ( "ActivateNode","reflektor_rozsviceny",0) 
			-- 		Call ( "Reflektor:Activate", 0 )
			-- 		Call ( "PozickaLevaBi:Activate", 0 )
			-- 		Call ( "PozickaLevaCr:Activate", 0 )
			-- 		Call ( "PozickaPravaBi:Activate", 0 )
			-- 		Call ( "PozickaPravaCr:Activate", 0 )
			-- 		Call ( "ActivateNode", "pozickalevaBi", 0 ) 
			-- 		Call ( "ActivateNode", "pozickalevaCr", 0 ) 
			-- 		Call ( "ActivateNode", "pozickapravaBi", 0 ) 
			-- 		Call ( "ActivateNode", "pozickapravaCr", 0 ) 
			-- 		NouzoveBrzdeni = 0
			-- 		if PolohaKlice == 25 then klic = 1 end
			-- 		if MaPredniPantograf == 1 then
			-- 			Call ("SetTime","PredniSberac",0)
			-- 			Call ("SetTime","ZadniSberac",0)
			-- 		else
			-- 			Call ("SetTime","ZadniSberac",0)
			-- 		end
			-- 		Call("SetControlValue","vysilacka_displeje",0,0)
			-- 		Call("SetControlValue","HlavniVypinac",0,0)
			-- 		Call("SetControlValue","VirtualStartup",0,0)
			-- 		Call("SetControlValue","PantoJimka",0,3.11)
			-- 	end
			-- 	if MaPredniPantograf == 1 then PredniPanto = Call("GetControlValue", "PantoPredni", 0) else PredniPanto = 0 end
			-- 	ZadniPanto = Call("GetControlValue", "PantoZadni", 0)

			-- 	----------------------------------------Pantografy----------------------------------------
			-- 	sberaceSimple = Call("GetControlValue","VirtualPantographControl",0)
			-- 	smerSimple = 1
			-- 	if Call("GetSpeed") > 1 then
			-- 		smerSimple = 1
			-- 	elseif Call("GetSpeed") < -1 then
			-- 		smerSimple = -1
			-- 	end
			-- 	if sberaceSimple == 1 then
			-- 		if smerSimple == 1 then
			-- 			gPredniSmetak = 0
			-- 			gZadniSmetak = 1
			-- 		elseif smerSimple == 2 then
			-- 			gPredniSmetak = 1
			-- 			gZadniSmetak = 0
			-- 		end
			-- 	else
			-- 		gPredniSmetak = 0
			-- 		gZadniSmetak = 0
			-- 	end
					
			-- 	if gCommonTimer >= 0.0125 then
			-- 		if gPredniSmetak == 1 then -- predni zberac
			-- 			if PredniPanto < 3.75 and Call("GetControlValue","PantoJimka",0) > 0.87393202250021 then
			-- 				gPredniSberacControl = gPredniSberacControl + (((Call("GetControlValue","PantoJimka",0)/10)-0.087393202250021)^2)
			-- 				Call("SetControlValue", "PantoPredni", 0, gPredniSberacControl)
			-- 			end
			-- 		elseif gPredniSmetak == 0 then
			-- 			if PredniPanto > 0 then
			-- 				gPredniSberacControl = gPredniSberacControl - 0.075
			-- 				Call("SetControlValue", "PantoPredni", 0, gPredniSberacControl)
			-- 			end
			-- 		end
			-- 		if MaPredniPantograf == 1 then
			-- 			if gPredniSberacOld ~= Call("GetControlValue", "PantoPredni", 0) then
			-- 				Call("AddTime", "PredniSberac", Call("GetControlValue", "PantoPredni", 0) - gPredniSberacOld)
			-- 			end
			-- 			gPredniSberacOld = Call("GetControlValue", "PantoPredni", 0)
			-- 			if gPredniSberacControl > 3.75 then gPredniSberacControl = 3.75 end
			-- 			if gPredniSberacControl < 0 then gPredniSberacControl = 0 end
			-- 		end
			-- 		if gZadniSmetak == 1 then -- zadni zberac
			-- 			if ZadniPanto < 3.75 and Call("GetControlValue","PantoJimka",0) > 0.87393202250021 then
			-- 				ZpravaDebug("Sberac"..gZadniSberacControl)
			-- 				gZadniSberacControl = gZadniSberacControl + (((Call("GetControlValue","PantoJimka",0)/10)-0.087393202250021)^2)
			-- 				Call("SetControlValue", "PantoZadni", 0, gZadniSberacControl)
			-- 			end
			-- 		elseif gZadniSmetak == 0 then
			-- 			if ZadniPanto > 0 then
			-- 				gZadniSberacControl = gZadniSberacControl - 0.075
			-- 				Call("SetControlValue", "PantoZadni", 0, gZadniSberacControl)
			-- 			end
			-- 		end
			-- 		if gZadniSberacOld ~= Call("GetControlValue", "PantoZadni", 0) then
			-- 			Call("AddTime", "ZadniSberac", Call("GetControlValue", "PantoZadni", 0) - gZadniSberacOld)
			-- 		end
			-- 		gZadniSberacOld = Call("GetControlValue", "PantoZadni", 0)
			-- 		if gZadniSberacControl > 3.75 then gZadniSberacControl = 3.75 end
			-- 		if gZadniSberacControl < 0 then gZadniSberacControl = 0 end
			-- 		gCommonTimer = 0
			-- 	end
			-- 	if MaPredniPantograf == 1 then PP = Call ("GetControlValue", "PantoPredni", 0) else PP = 0 end
			-- 	ZP = Call ("GetControlValue", "PantoZadni", 0)
			-- 	if MaPredniPantograf == 1 then PC=math.max(PP,ZP) else PC = ZP end
			-- 	if PC == 3.75 then
			-- 		P01 = 1
			-- 	else
			-- 		P01 = 0
			-- 	end
			-- 	if PP > 3.70 and PP ~= 3.75 then 
			-- 		Call("SetControlValue","PantoPredni",0,3.75)
			-- 	end
			-- 	if ZP > 3.70 and ZP ~= 3.75 then 
			-- 		Call("SetControlValue","PantoZadni",0,3.75)
			-- 	end
			-- 	Call("SetControlValue","PantographControl",0,P01)
			end
		--######################################################################################--
		----------------------------------------KONEC gásti řízené userem-------------------------
		--######################################################################################--
		else
			Call("SetControlValue","AI",0,1)
			Call("SetControlValue","HandBrake",0,0)
			Call("SetControlValue","AbsolutniRychlomer",0,math.abs(Call("GetSpeed")*3.6))
			deltaSpeedMinula = deltaSpeed
			deltaSpeed = Call("GetSpeed")
			Call("SetControlValue","DeltaSpeed",0,deltaSpeed - deltaSpeedMinula)
			if deltaSpeed > 0.5 then
				SmerAI = 1
				if predMasinou == 0 and not jeMrtva then
					SvetlaAI = 1
				else
					SvetlaAI = 0
				end
			elseif deltaSpeed < -0.5 then
				SmerAI = -1
				if zaMasinou == 0 and not jeMrtva then
					SvetlaAI = 1
				else
					SvetlaAI = 0
				end
			elseif not jeMrtva then
				SvetlaAI = 1
			else
				SvetlaAI = 0
			end
			if not jeMrtva then
				if Call("ControlExists","PantoPredni",0) == 0 then
					Call ("SetTime","ZadniSberac",3.75)
				elseif SmerAI == 1 then 
					Call ("SetTime","PredniSberac",0)
					Call ("SetTime","ZadniSberac",3.75)
				elseif SmerAI == -1 then 
					Call ("SetTime","PredniSberac",3.75)
					Call ("SetTime","ZadniSberac",0)
				end
			else
				Call ("SetTime","ZadniSberac",0)
				if Call("ControlExists","PantoPredni",0) ~= 0 then
					Call ("SetTime","PredniSberac",0)
				end
			end
			if SvetlaAI == 1 then
				if SmerAI == -1 then
					Call ( "DalkovePrave:Activate", 0 )
					Call ( "DalkoveLeve:Activate", 0 )
					Call ( "ActivateNode","dalkaclevy",0)
					Call ( "ActivateNode","dalkacpravy",0)
					Call ( "ActivateNode","reflektor_rozsviceny",0) 
					Call ( "Reflektor:Activate", 0 )
					Call ( "PozickaLevaBi:Activate", 0 )
					Call ( "PozickaLevaCr:Activate", 1 )
					Call ( "PozickaPravaBi:Activate", 0 )
					Call ( "PozickaPravaCr:Activate", 1 )
					Call ( "ActivateNode", "pozickalevaBi", 0 ) 
					Call ( "ActivateNode", "pozickalevaCr", 1 ) 
					Call ( "ActivateNode", "pozickapravaBi", 0 ) 
					Call ( "ActivateNode", "pozickapravaCr", 1 ) 
				elseif SmerAI == 1 then
					if SysCall("ScenarioManager:GetSeason") ~= 3 then
						if dennicas < 063000 or dennicas > 220000 then
							Call ( "DalkovePrave:Activate", 1 )
							Call ( "DalkoveLeve:Activate", 1 )
							Call ( "ActivateNode","dalkaclevy",1)
							Call ( "ActivateNode","dalkacpravy",1)
							Call ( "ActivateNode","reflektor_rozsviceny",1) 
							Call ( "Reflektor:Activate", 1 )
							Call ( "PozickaLevaBi:Activate", 1 )
							Call ( "PozickaLevaCr:Activate", 0 )
							Call ( "PozickaPravaBi:Activate", 1 )
							Call ( "PozickaPravaCr:Activate", 0 )
							Call ( "ActivateNode", "pozickalevaBi", 1 ) 
							Call ( "ActivateNode", "pozickalevaCr", 0 ) 
							Call ( "ActivateNode", "pozickapravaBi", 1 ) 
							Call ( "ActivateNode", "pozickapravaCr", 0 ) 
						elseif dennicas > 063000 and dennicas < 220000 then
							Call ( "DalkovePrave:Activate", 0 )
							Call ( "DalkoveLeve:Activate", 0 )
							Call ( "ActivateNode","dalkaclevy",0)
							Call ( "ActivateNode","dalkacpravy",0)
							Call ( "ActivateNode","reflektor_rozsviceny",0) 
							Call ( "Reflektor:Activate", 0 )
							Call ( "PozickaLevaBi:Activate", 1 )
							Call ( "PozickaLevaCr:Activate", 0 )
							Call ( "PozickaPravaBi:Activate", 1 )
							Call ( "PozickaPravaCr:Activate", 0 )
							Call ( "ActivateNode", "pozickalevaBi", 1 ) 
							Call ( "ActivateNode", "pozickalevaCr", 0 ) 
							Call ( "ActivateNode", "pozickapravaBi", 1 ) 
							Call ( "ActivateNode", "pozickapravaCr", 0 ) 
						end
					else
						if dennicas < 080000 or dennicas > 163000 then
							Call ( "DalkovePrave:Activate", 1 )
							Call ( "DalkoveLeve:Activate", 1 )
							Call ( "ActivateNode","dalkaclevy",1)
							Call ( "ActivateNode","dalkacpravy",1)
							Call ( "ActivateNode","reflektor_rozsviceny",1) 
							Call ( "Reflektor:Activate", 1 )
							Call ( "PozickaLevaBi:Activate", 1 )
							Call ( "PozickaLevaCr:Activate", 0 )
							Call ( "PozickaPravaBi:Activate", 1 )
							Call ( "PozickaPravaCr:Activate", 0 )
							Call ( "ActivateNode", "pozickalevaBi", 1 ) 
							Call ( "ActivateNode", "pozickalevaCr", 0 ) 
							Call ( "ActivateNode", "pozickapravaBi", 1 ) 
							Call ( "ActivateNode", "pozickapravaCr", 0 ) 
						elseif dennicas > 080000 and dennicas < 163000 then
							Call ( "DalkovePrave:Activate", 0 )
							Call ( "DalkoveLeve:Activate", 0 )
							Call ( "ActivateNode","dalkaclevy",0)
							Call ( "ActivateNode","dalkacpravy",0)
							Call ( "ActivateNode","reflektor_rozsviceny",0) 
							Call ( "Reflektor:Activate", 0 )
							Call ( "PozickaLevaBi:Activate", 1 )
							Call ( "PozickaLevaCr:Activate", 0 )
							Call ( "PozickaPravaBi:Activate", 1 )
							Call ( "PozickaPravaCr:Activate", 0 )
							Call ( "ActivateNode", "pozickalevaBi", 1 ) 
							Call ( "ActivateNode", "pozickalevaCr", 0 ) 
							Call ( "ActivateNode", "pozickapravaBi", 1 ) 
							Call ( "ActivateNode", "pozickapravaCr", 0 ) 
						end
					end
				else
					Call ( "DalkovePrave:Activate", 0 )
					Call ( "DalkoveLeve:Activate", 0 )
					Call ( "ActivateNode","dalkaclevy",0)
					Call ( "ActivateNode","dalkacpravy",0)
					Call ( "ActivateNode","reflektor_rozsviceny",0) 
					Call ( "Reflektor:Activate", 0 )
					Call ( "PozickaLevaBi:Activate", 0 )
					Call ( "PozickaLevaCr:Activate", 0 )
					Call ( "PozickaPravaBi:Activate", 1 )
					Call ( "PozickaPravaCr:Activate", 0 )
					Call ( "ActivateNode", "pozickalevaBi", 0 ) 
					Call ( "ActivateNode", "pozickalevaCr", 0 ) 
					Call ( "ActivateNode", "pozickapravaBi", 1 ) 
					Call ( "ActivateNode", "pozickapravaCr", 0 )
				end
			else
				Call ( "DalkovePrave:Activate", 0 )
				Call ( "DalkoveLeve:Activate", 0 )
				Call ( "ActivateNode","dalkaclevy",0)
				Call ( "ActivateNode","dalkacpravy",0)
				Call ( "ActivateNode","reflektor_rozsviceny",0) 
				Call ( "Reflektor:Activate", 0 )
				Call ( "PozickaLevaBi:Activate", 0 )
				Call ( "PozickaLevaCr:Activate", 0 )
				Call ( "PozickaPravaBi:Activate", 0 )
				Call ( "PozickaPravaCr:Activate", 0 )
				Call ( "ActivateNode", "pozickalevaBi", 0 ) 
				Call ( "ActivateNode", "pozickalevaCr", 0 ) 
				Call ( "ActivateNode", "pozickapravaBi", 0 ) 
				Call ( "ActivateNode", "pozickapravaCr", 0 )
			end
			Call("SetControlValue","JeNouzovyRadic",0,0)
			Call("SetControlValue","Picka",0,0)
			Call("SetControlValue","EngineBrakeControl",0,0)
			Call("SetControlValue","HandBrake",0,0)
			Call ( "Zarovka1:Activate", 0 )
			Call ( "Zarovka2:Activate", 0 )
			Call ( "Zarivka1:Activate", 0 )
			Call ( "Zarivka2:Activate", 0 )
			Call ( "Zarivka3:Activate", 0 )
			Call ( "CabLight1:Activate", 0 )
			Call ( "SvetloRychlomer:Activate", 0 )
			Call ( "SvetloBudik1:Activate", 0 )
			Call ( "SvetloBudik2:Activate", 0 )
			Call ( "SvetloBudik3:Activate", 0 )
			Call ( "SvetloBudik4:Activate", 0 )
			Call ("KourP1L:SetEmitterActive",0 ) 
			Call ("KourP2L:SetEmitterActive",0 ) 
			Call ("KourP1P:SetEmitterActive",0 ) 
			Call ("KourP2P:SetEmitterActive",0 )
			Call("ZimniJiskra:Activate",0)
			Call("ZimniJiskra1:Activate",0)
			Call("ZimniJiskra2:Activate",0)
			Call("ZimniJiskra3:Activate",0)
			Call("ZimniJiskra4:Activate",0)
			if Call("GetControlValue","DoorsOpenCloseLeft") then
				Call("SetControlValue","DvereLP",0,1)
				Call("SetControlValue","DvereLZ",0,1)
			else
				Call("SetControlValue","DvereLP",0,0)
				Call("SetControlValue","DvereLZ",0,0)
			end
			if Call("GetControlValue","DoorsOpenCloseRight") then
				Call("SetControlValue","DverePP",0,1)
				Call("SetControlValue","DverePZ",0,1)
			else
				Call("SetControlValue","DverePP",0,0)
				Call("SetControlValue","DverePZ",0,0)
			end

			--kridla dveri
				local LP = Call("GetControlValue","DvereLP",0)
				local LZ = Call("GetControlValue","DvereLZ",0)
				local PP = Call("GetControlValue","DverePP",0)
				local PZ = Call("GetControlValue","DverePZ",0)

				if LP ~= dvereLPskutecne then
					if LP > dvereLPskutecne then
						dvereLPskutecne = dvereLPskutecne + (cas * rychlostOteviraniDveri)
					elseif LP < dvereLPskutecne then
						dvereLPskutecne = dvereLPskutecne - (cas * rychlostZaviraniDveri)
					end
					if dvereLPskutecne < 0 then
						dvereLPskutecne = 0
					end
				end
				Call("SetTime", "Dvere1L", dvereLPskutecne * 2.125)

				if LZ ~= dvereLZskutecne then
					if LZ > dvereLZskutecne then
						dvereLZskutecne = dvereLZskutecne + (cas * rychlostOteviraniDveri)
					elseif LZ < dvereLZskutecne then
						dvereLZskutecne = dvereLZskutecne - (cas * rychlostZaviraniDveri)
					end
					if dvereLZskutecne < 0 then
						dvereLZskutecne = 0
					end
				end
				Call("SetTime", "Dvere2L", dvereLZskutecne * 2.125)

				if PP ~= dverePPskutecne then
					if PP > dverePPskutecne then
						dverePPskutecne = dverePPskutecne + (cas * rychlostOteviraniDveri)
					elseif PP < dverePPskutecne then
						dverePPskutecne = dverePPskutecne - (cas * rychlostZaviraniDveri)
					end
					if dverePPskutecne < 0 then
						dverePPskutecne = 0
					end
				end
				Call("SetTime", "Dvere1P", dverePPskutecne * 2.125)

				if PZ ~= dverePZskutecne then
					if PZ > dverePZskutecne then
						dverePZskutecne = dverePZskutecne + (cas * rychlostOteviraniDveri)
					elseif PZ < dverePZskutecne then
						dverePZskutecne = dverePZskutecne - (cas * rychlostZaviraniDveri)
					end
					if dverePZskutecne < 0 then
						dverePZskutecne = 0
					end
				end
				Call("SetTime", "Dvere2P", dverePZskutecne * 2.125)
		end
	end
end
function OnControlValueChange ( name, index, value )
	if Call( "*:ControlExists", name, index ) then
		if name == "JeZivakZap" then
			if value == 1 then
				JeZivak1 = 1
				Call("SendConsistMessage",460110,"1",1)
				Call("SendConsistMessage",460110,"1",0)
			end
			if value == 0 then
				JeZivak1 = 0
				Call ("SetControlValue", "LVZzivak", 0, 0)
				CasZivak = 0
				Call("SendConsistMessage",460110,"0",0)
				Call("SendConsistMessage",460110,"0",1)
			end
		end
		if name == "VirtualStartup" then
			if value <= 50 and value > 10 then
				pozadavekNaZapisKlice = true
				PolohaKlice = 25
			elseif value > 50 and value < 90 then
				pozadavekNaZapisKlice = true
				PolohaKlice = 75
			end
		end
		if name == "Baterie" then
			Baterie = math.abs(value)
			if jeMrtva then
				Baterie = 0
				SysCall("ScenarioManager:ShowMessage", ZPRAVA_HLAVICKA, ZPRAVA_BATERIE_POSKOZENE, ALERT)
			end
			if math.abs(value) == 1 then 
				SysCall("ScenarioManager:ShowMessage", ZPRAVA_HLAVICKA, ZPRAVA_BATERIE_ZAP, ALERT)
			end
			if math.abs(value) <= 0.75 then
				VypniVse()
			end
		end
		if name == "vytahniklic" then
			if math.abs(PolohaKlice - 25) < 10 then
				pozadavekNaZapisKlice = true
				PolohaKlice = 0
				Call("SetControlValue", "VirtualStartup", 0,0)
				klic = 0
				Call("SendConsistMessage",460101,"0",1)
			end
		end
		if name == "vlozklic" then
			if PolohaKlice < 25 and KlicNaDruheKabine == 0 then
				pozadavekNaZapisKlice = true
				PolohaKlice = 25
				Call("SetControlValue", "VirtualStartup", 0,25)
				klic = 1
				Call("SendConsistMessage",460101,"1",1)
			end
		end
		if name == "OsvetleniVozu" then
			if value == 0 then
				OsvetleniVozu = 0
				Call ("SendConsistMessage",460106,"0",1)
			end
			if value == 1 then
				OsvetleniVozu = 1
				Call ("SendConsistMessage",460106,"1",1)
			end
			if value == 2 then
				OsvetleniVozu = 2
				Call ("SendConsistMessage",460106,"2",1)
			end
		end
		if name == "JeNouzovyRadic" then
			if value == 0 then
				Call("SetControlValue","VirtualThrottleAndBrake",0,0)
				Call("SetControlValue","RadicNouzovy",0,2)
			else
				Call("SetControlValue","VirtualThrottleAndBrake",0,2)
				Call("SetControlValue","RadicNouzovy",0,0)
			end
		end
		if name == "FastStart" and value == 1 then
			pozadavekNaFastStart = 1
		end
		if name == "vysilackaStart" and vysilackaObrazovka == 0 then
			if value == 1 then 
				vysilackaObrazovka = 1
				Call("SetControlValue","VysilackaStartSound",0,1)
			end
		end
		if name == "vysilacka8" then
			tlacitko8 = value
		end
		if name == "vysilacka1" then
			tlacitko1 = value
		end
		if name == "vysilackaEnter" then
			tlacitkoEnter = value
		end
		if name == "vysilackaDelete" then
			tlacitkoDelete = value
		end
		if name == "vysilacka0" then
			tlacitko0 = value
		end
		if name == "vysilacka2" then
			tlacitko2 = value
		end
		if name == "vysilacka3" then
			tlacitko3 = value
		end
		if name == "vysilacka4" then
			tlacitko4 = value
		end
		if name == "vysilacka5" then
			tlacitko5 = value
		end
		if name == "vysilacka6" then
			tlacitko6 = value
		end
		if name == "vysilacka7" then
			tlacitko7 = value
		end
		if name == "vysilacka9" then
			tlacitko9 = value
		end
		if name == "RidiciKontrolerOkno" then
			ridiciKontrolerOknoOCVC = value
		end
		if name == "Headlights" then
			if value <= 0.5 then
				DalkovaSv = 0
			end
			if value >= 0.75 and value <= 1.25 then
				DalkovaSv = 1
			end
			if value > 1.25 and value < 1.75 then
				DalkovaSv = 0
			end
			if value >= 1.75 then
				DalkovaSv = 2
			end
		end
		if name == "OsvetleniKabiny" then
			if value <= 0.25 then
				KabinaPrist = 1
			end
			if value >= 1.75 then
				KabinaPrist = 2
			end
			if value >= 0.75 and value <= 1.25 then
				KabinaPrist = 0
			end
		end
		if name == "Picka" then
			if value < 0.5 then
				Picka = 0
			end
			if value > 0.5 then
				Picka = 1
			end
		end
		if name == "VolbaPozicKonecCelo" then
			if value > 0.5 and value < 1.5 then
				levaPozBilVPKC = false
				levaPozCerVPKC = false
				pravaPozBilVPKC = false
				pravaPozCerVPKC = false
			end
			if value > 1.75 then
				levaPozBilVPKC = false
				levaPozCerVPKC = true
				pravaPozBilVPKC = false
				pravaPozCerVPKC = true
			end
			if value < 0.25 then
				levaPozBilVPKC = true
				levaPozCerVPKC = false
				pravaPozBilVPKC = true
				pravaPozCerVPKC = false
			end
		end
		if name == "LevaPoz" then
			if value > 0.5 and value < 1.5 then
				levaPozCer = false
				levaPozBil = false
			end
			if value > 1.75 then
				levaPozCer = true
				levaPozBil = false
			end
			if value < 0.25 then
				levaPozCer = false
				levaPozBil = true				
			end
		end
		if name == "PravaPoz" then
			if value > 0.5 and value < 1.5 then
				pravaPozCer = false
				pravaPozBil = false
			end
			if value > 1.75 then
				pravaPozCer = true
				pravaPozBil = false
			end
			if value < 0.25 then
				pravaPozCer = false
				pravaPozBil = true
			end
		end
		if name == "Napoveda" then
			levelNapovedy = levelNapovedy + 1
			if levelNapovedy == 4 then
				levelNapovedy = 0
			end
			SysCall("ScenarioManager:ShowMessage", ZPRAVA_HLAVICKA, SysCall("ScenarioManager:FormatString",ZPRAVA_UROVEN_HELP,levelNapovedy),ALERT)
		end
		Call( "*:SetControlValue", name, index, value )
	end
end