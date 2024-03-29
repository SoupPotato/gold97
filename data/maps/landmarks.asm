landmark: MACRO
; x, y, name
	db \1 + 8, \2 + 16
	dw \3
ENDM

Landmarks:
; entries correspond to constants/landmark_constants.asm
	dbbw       0,   0, SpecialMapName
	landmark  100, 116, SilentTownName
	landmark  92, 116, Route101Name
	landmark  84, 116, SilentHillsName
	landmark  84, 100, PagotaCityName
	landmark  83,  99, BrassTowerName
	landmark  72, 100, Route102Name
	landmark  60, 100, WestportCityName
	landmark  59,  99, RadioTowerName
	landmark  60,  84, Route103Name
	landmark  60,  68, BirdonTownName
	landmark  59,  67, SlowpokeWellName
	landmark  60,  60, Route116Name
	landmark  52,  60, Route117Name
	landmark  52,  52, EndonCaveName
	landmark  44,  60, SanskritTownName
	landmark  44,  52, RuinsOfAlphName
	landmark  50,  48, TidalGrottoName
	landmark  32,  60, Route118Name
	landmark  20,  60, SunpointCityName
	landmark  19,  59, MagmaShaftName
	landmark  20,  52, SunpointDocksName
	landmark  20,  76, Route119Name
	landmark  28,  92, BoulderMinesName
	landmark  36,  92, Route120Name
	landmark  44,  92, TeknosCityName
	landmark  44,  76, BoardwalkName
	landmark  76,  68, Route104Name
	landmark  92,  68, Route105Name
	landmark  92,  76, JadeForestName
	landmark 100,  76, Route106Name
	landmark 108,  76, AlloyCityName
	landmark 108,  64, Route107Name
	landmark 108,  52, KobanIslandName
	landmark 107,  51, DragonsMawName
	landmark 116,  76, Route108Name
	landmark 124,  68, Route109Name
	landmark 124,  60, AmpareCavernName
	landmark 128,  52, Route110Name
	landmark 140,  52, BlueForestName
	landmark 136,  46, DeepwaterPassageName
	landmark 140,  40, Route111Name
	landmark 132,  36, WhirlIslandName
	landmark 140,  28, FrostpointTownName
	landmark 140,  68, Route112Name
	landmark 140,  84, StandCityName
	landmark 132,  84, NationalParkName
	landmark 140, 100, Route113Name
	landmark 132, 116, Route114Name
	landmark 124, 116, KantoRegionName
	landmark 108, 116, Route115Name
	landmark 100, 108, CrownPassName
	landmark 100, 100, CrownCityName
	landmark  96,  96, VictoryRoadName
	landmark 100,  92, NihonLeagueName
	landmark  20, 124, RainbowIslandName
	landmark  52, 124, TropicalIslandName
	landmark  36, 112, ForkedStraitName
	landmark  36,  92, IcedCavernName
	landmark  36, 100, KumeCityName
	landmark  44, 100, KumePointName
	landmark  60, 100, KeramaStraitName
	landmark  148,  92, AppleOrchardName
	landmark  148, 100, DaitoRanchName
	landmark  116, 100, GreatEastStraitName
	landmark  84, 100, NanjoForestName
	landmark  76,  96, UrasoeTrailName
	landmark  76,  84, UrasoeParkName
	landmark  76,  76, RyukyuCityName
	landmark  92,  68, CharredSummitName
	landmark  84,  68, MeridianPathName
	landmark  44,  44, CastleMountainName
	landmark  44,  52, IeTownName
	landmark  68,  52, MotobuPathName
	landmark  84,  52, NagoVillageName
	landmark  96,  52, IsenStraitName
	landmark 112,  52, SeasidePathName
	landmark 124,  52, JouleCaveName
	landmark 148, 28,  KikaiCalderaName
	landmark 140, 36,  KikaiVillageName
	landmark 140, 44,  KikaiStraitName
	landmark 132, 44,  TatsugoPathName  
	landmark 118,  44, BattleTowerName
	landmark 116,  44, AmamiCityName
	landmark  36, 124, FastShipName
	; the formula to get these numbers from the X/Y in tilemap studio is: (X or Y) * 8 + 4

SilentTownName:       db "SILENT TOWN@"
CrownCityName:        db "CROWN CITY@"
PagotaCityName:       db "PAGOTA CITY@"
BirdonTownName:       db "BIRDON TOWN@"
WestportCityName:     db "WESTPORT¯CITY@"
TeknosCityName:       db "TEKNOS CITY@"
AlloyCityName:        db "ALLOY CITY@"
SunpointCityName:     db "SUNPOINT¯CITY@"
SanskritTownName:     db "SANSKRIT¯TOWN@"
BlueForestName:       db "BLUE FOREST@"
BrassTowerName:       db "BRASS TOWER@"
RuinsOfAlphName:      db "RUINS OF¯ALPH@"
TidalGrottoName:      db "TIDAL¯GROTTO@"
BoulderMinesName:     db "BOULDER¯MINES@"
SlowpokeWellName:     db "SLOWPOKE¯WELL@"
RadioTowerName:       db "RADIO TOWER@"
NationalParkName:     db "NATIONAL¯PARK@"
EndonCaveName:        db "ENDON CAVE@"
WhirlIslandName:      db "WHIRL¯ISLAND@"
ForkedStraitName:     db "FORKED¯STRAIT@"
DragonsMawName:       db "DRAGON'S¯MAW@"
DeepwaterPassageName: db "DEEPWATER¯PASSAGE@"
TropicalIslandName:   db "TROPICAL¯ISLAND@"
KobanIslandName:      db "KOBAN¯ISLAND@"
CrownPassName:        db "CROWN¯PASS@"
KumeCityName:         db "KUME CITY@"
NagoVillageName:      db "NAGO¯VILLAGE@"
AmamiCityName:        db "AMAMI TOWN@"
KantoRegionName:      db "KANTO¯REGION@"
RyukyuCityName:       db "RYUKYU CITY@"
StandCityName:        db "STAND CITY@"
FrostpointTownName:   db "FROSTPOINT¯TOWN@"
NihonLeagueName:      db "NIHON¯LEAGUE@"
VictoryRoadName:      db "VICTORY¯ROAD@"
UrasoeParkName:       db "URASOE PARK@"
CharredSummitName:    db "CHARRED¯SUMMIT@"
NanjoForestName:      db "NANJO¯FOREST@"
Route116Name:         db "ROUTE 116@"
Route117Name:         db "ROUTE 117@"
Route118Name:         db "ROUTE 118@"
SunpointDocksName:    db "SUNPOINT¯DOCKS@"
Route119Name:         db "ROUTE 119@"
Route120Name:         db "ROUTE 120@"
Route114Name:         db "ROUTE 114@"
SeasidePathName:      db "SEASIDE¯PATH@"
UrasoeTrailName:      db "URASOE¯TRAIL@"
Route121Name:         db "ROUTE 121@"
KeramaStraitName:     db "KERAMA¯STRAIT@"
IsenStraitName:       db "ISEN STRAIT@"
Route107Name:         db "ROUTE 107@"
KumePointName:        db "KUME POINT@"
MeridianPathName:     db "MERIDIAN¯PATH@"
Route115Name:         db "ROUTE 115@"
Route101Name:         db "ROUTE 101@"
Route105Name:         db "ROUTE 105@"
Route106Name:         db "ROUTE 106@"
Route112Name:         db "ROUTE 112@"
Route104Name:         db "ROUTE 104@"
Route113Name:         db "ROUTE 113@"
Route103Name:         db "ROUTE 103@"
Route102Name:         db "ROUTE 102@"
SilentHillsName:      db "SILENT¯HILLS@"
Route108Name:         db "ROUTE 108@"
Route109Name:         db "ROUTE 109@"
Route110Name:         db "ROUTE 110@"
Route111Name:         db "ROUTE 111@"
BoardwalkName:        db "BOARDWALK@"
AmpareCavernName:     db "AMPARE¯CAVERN@"
JadeForestName:       db "JADE FOREST@"
MagmaShaftName:       db "MAGMA SHAFT@"
FastShipName:         db "FAST SHIP@"
IcedCavernName:       db "ICED CAVERN@"
JouleCaveName:        db "JOULE CAVE@"
BattleTowerName:      db "BATTLE¯TOWER@"
RainbowIslandName:    db "RAINBOW¯ISLAND@"
TatsugoPathName:      db "TATSUGO¯PATH@"
KikaiStraitName:      db "KIKAI¯STRAIT@"
KikaiVillageName:     db "KIKAI¯VILLAGE@"
KikaiCalderaName:     db "KIKAI¯CALDERA@"
GreatEastStraitName:  db "GREAT EAST¯STRAIT@"
DaitoRanchName:       db "DAITO RANCH@"
AppleOrchardName:     db "APPLE¯ORCHARD@"
MotobuPathName:       db "MOTOBU PATH@"
IeTownName:           db "IE TOWN@"
CastleMountainName:   db "CASTLE¯MOUNTAIN@"
SpecialMapName:       db "SPECIAL@"
