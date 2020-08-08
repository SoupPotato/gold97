landmark: MACRO
; x, y, name
	db \1 + 8, \2 + 16
	dw \3
ENDM

Landmarks:
; entries correspond to constants/landmark_constants.asm
	dbbw       0,   0, SpecialMapName
	landmark  92, 116, SilentTownName
	landmark  84, 116, Route29Name
	landmark  76, 116, Route37Name
	landmark  76, 100, OldCityName
	landmark  75,  99, SproutTowerName
	landmark  68, 100, Route36Name
	landmark  60, 100, GoldenrodCityName
	landmark  59,  99, RadioTowerName
	landmark  60,  84, Route35Name
	landmark  60,  68, AzaleaTownName
	landmark  59,  67, SlowpokeWellName
	landmark  60,  60, Route2Name
	landmark  56,  60, Route3Name
	landmark  52,  60, LighthouseName
	landmark  44,  60, MahoganyTownName
	landmark  44,  52, RuinsOfAlphName
	landmark  32,  60, Route4Name
	landmark  20,  60, CianwoodCityName
	landmark  19,  59, BurnedTowerName
	landmark  20,  52, Route5Name
	landmark  20,  76, Route7Name
	landmark  28,  92, UnionCaveName
	landmark  36,  92, Route8Name
	landmark  44,  92, EcruteakCityName
	landmark  44,  76, Route43Name
	landmark  76,  68, Route33Name
	landmark  92,  68, Route30Name
	landmark  92,  76, IlexForestName
	landmark 100,  76, Route31Name
	landmark 108,  76, OlivineCityName
	landmark 108,  64, Route21Name
	landmark 108,  52, PalletTownName
	landmark 107,  51, DragonsDenName
	landmark 116,  76, Route38Name
	landmark 124,  68, Route39Name
	landmark 124,  60, DarkCaveName
	landmark 128,  52, Route40Name
	landmark 140,  52, BlackthornCityName
	landmark 136,  46, IcePathName
	landmark 140,  40, Route41Name
	landmark 132,  36, WhirlIslandsName
	landmark 140,  28, CinnabarIslandName
	landmark 140,  68, Route32Name
	landmark 140,  84, FuchsiaCityName
	landmark 132,  84, NationalParkName
	landmark 140, 100, Route34Name
	landmark 132, 116, Route9Name
	landmark 124, 116, CeladonCityName
	landmark 108, 116, Route27Name
	landmark  92, 108, ViridianCityName
	landmark  92, 100, CherrygroveCityName
	landmark  96,  96, VictoryRoadName
	landmark  92,  92, IndigoPlateauName
	landmark 116,  84, Route11Name
	landmark 123, 115, BattleTowerName
	landmark 108, 108, MtMortarName
	landmark  92, 112, Route14Name
	landmark 124, 100, Route13Name
	landmark 104, 116, Route15Name
	landmark  68,  68, Route16Name
	landmark  68,  92, Route17Name
	landmark  80, 116, Route18Name
	landmark  36,  68, Route22Name
	landmark  28,  44, Route23Name
	landmark  28,  92, Route26Name
	landmark  12, 100, TohjoFallsName
	landmark  20,  68, Route28Name
	landmark  70,  42, TinTowerName
	landmark 108,  28, LakeOfRageName
	landmark 120,  44, Route44Name
	landmark 132,  64, Route45Name
	landmark 124,  88, Route46Name
	landmark  52,  92, Route1Name
	landmark 132,  60, PowerPlantName
	landmark 132,  68, LavenderTownName
	landmark 140,  68, LavRadioTowerName
	landmark 148,  68, SilverCaveName
	landmark  36, 100, PewterCityName
	landmark  35,  99, DiglettsCaveName
	landmark  44, 100, Route24Name
	landmark  60, 100, Route19Name
	landmark  76,  96, Route12Name
	landmark  84, 100, SeafoamIslandsName
	landmark  76,  84, MtMoonName
	landmark  76,  76, SaffronCityName
	landmark  84,  68, Route25Name
	landmark  92,  68, RockTunnelName
	landmark  84,  52, CeruleanCityName
	landmark  96,  52, Route20Name
	landmark 112,  52, Route10Name
	landmark 124,  52, UndergroundName
	landmark 116,  44, VermilionCityName
	landmark  36, 124, FastShipName

SilentTownName:      db "SILENT TOWN@"
CherrygroveCityName: db "CROWN CITY@"
OldCityName:         db "PAGOTA CITY@"
AzaleaTownName:      db "BIRDON TOWN@"
GoldenrodCityName:   db "WESTPORT¯CITY@"
EcruteakCityName:    db "TEKNOS CITY@"
OlivineCityName:     db "ALLOY CITY@"
CianwoodCityName:    db "SUNPOINT¯CITY@"
MahoganyTownName:    db "SANSKRIT¯TOWN@"
BlackthornCityName:  db "BLUE FOREST@"
LakeOfRageName:      db "LAKE OF¯RAGE@"
SilverCaveName:      db "SILVER CAVE@"
SproutTowerName:     db "BRASS TOWER@"
RuinsOfAlphName:     db "SANSKRIT¯RUINS@"
UnionCaveName:       db "BOULDER¯MINES@"
SlowpokeWellName:    db "SLOWPOKE¯WELL@"
RadioTowerName:      db "RADIO TOWER@"
PowerPlantName:      db "POWER PLANT@"
NationalParkName:    db "NATIONAL¯PARK@"
TinTowerName:        db "TIN TOWER@"
LighthouseName:      db "ENDON CAVE@"
WhirlIslandsName:    db "WHIRL¯ISLAND@"
MtMortarName:        db "NOT USED@"
DragonsDenName:      db "DRAGON'S¯MAW@"
IcePathName:         db "DEEPWATER¯PASSAGE@"
NotApplicableName:   db "N/A@" ; "オバケやしき" ("HAUNTED HOUSE") in Japanese
PalletTownName:      db "KOBAN¯ISLAND@"
ViridianCityName:    db "CROWN¯PASS@"
PewterCityName:      db "YORON CITY@"
CeruleanCityName:    db "NAGO¯VILLAGE@"
LavenderTownName:    db "LAVENDER¯TOWN@"
VermilionCityName:   db "AMAMI TOWN@"
CeladonCityName:     db "KANTO¯REGION@"
SaffronCityName:     db "RYUKYU CITY@"
FuchsiaCityName:     db "STAND CITY@"
CinnabarIslandName:  db "FROSTPOINT¯TOWN@"
IndigoPlateauName:   db "NIHON¯LEAGUE@"
VictoryRoadName:     db "VICTORY¯ROAD@"
MtMoonName:          db "URASOE PARK@"
RockTunnelName:      db "CHARRED¯SUMMIT@"
LavRadioTowerName:   db "LAV¯RADIO TOWER@"
SilphCoName:         db "SILPH CO.@"
SafariZoneName:      db "SAFARI ZONE@"
SeafoamIslandsName:  db "NANJO¯FOREST@"
PokemonMansionName:  db "#MON¯MANSION@"
CeruleanCaveName:    db "CERULEAN¯CAVE@"
Route1Name:          db "ROUTE 1@"
Route2Name:          db "ROUTE 116@"
Route3Name:          db "ROUTE 117@"
Route4Name:          db "ROUTE 118@"
Route5Name:          db "SUNPOINT¯DOCKS@"
Route7Name:          db "ROUTE 119@"
Route8Name:          db "ROUTE 120@"
Route9Name:          db "ROUTE 114@"
Route10Name:         db "SEASIDE¯PATH@"
Route11Name:         db "ROUTE 11@"
Route12Name:         db "URASOE¯TRAIL@"
Route13Name:         db "ROUTE 13@"
Route14Name:         db "ROUTE 121@"
Route15Name:         db "ROUTE 15@"
Route16Name:         db "ROUTE 16@"
Route17Name:         db "ROUTE 17@"
Route18Name:         db "ROUTE 18@"
Route19Name:         db "KERAMA¯STRAIT@"
Route20Name:         db "ISEN STRAIT@"
Route21Name:         db "ROUTE 107@"
Route22Name:         db "ROUTE 22@"
Route23Name:         db "ROUTE 23@"
Route24Name:         db "YORON POINT@"
Route25Name:         db "MERIDIAN¯PATH@"
Route26Name:         db "ROUTE 26@"
Route27Name:         db "ROUTE 115@"
Route28Name:         db "ROUTE 28@"
Route29Name:         db "ROUTE 101@"
Route30Name:         db "ROUTE 105@"
Route31Name:         db "ROUTE 106@"
Route32Name:         db "ROUTE 112@"
Route33Name:         db "ROUTE 104@"
Route34Name:         db "ROUTE 113@"
Route35Name:         db "ROUTE 103@"
Route36Name:         db "ROUTE 102@"
Route37Name:         db "SILENT¯HILLS@"
Route38Name:         db "ROUTE 108@"
Route39Name:         db "ROUTE 109@"
Route40Name:         db "ROUTE 110@"
Route41Name:         db "ROUTE 111@"
Route43Name:         db "BOARDWALK@"
Route44Name:         db "ROUTE 44@"
Route45Name:         db "ROUTE 45@"
Route46Name:         db "ROUTE 46@"
DarkCaveName:        db "AMPARE¯CAVERN@"
IlexForestName:      db "JADE FOREST@"
BurnedTowerName:     db "MAGMA SHAFT@"
FastShipName:        db "FAST SHIP@"
ViridianForestName:  db "VIRIDIAN¯FOREST@"
DiglettsCaveName:    db "ICED CAVERN@"
TohjoFallsName:      db "TOHJO FALLS@"
UndergroundName:     db "JOULE CAVE@"
BattleTowerName:     db "BATTLE¯TOWER@"
SpecialMapName:      db "SPECIAL@"
