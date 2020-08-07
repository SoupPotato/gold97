map_attributes: MACRO
;\1: map name
;\2: map id
;\3: border block
;\4: connections: combo of NORTH, SOUTH, WEST, and/or EAST, or 0 for none
CURRENT_MAP_WIDTH = \2_WIDTH
CURRENT_MAP_HEIGHT = \2_HEIGHT
\1_MapAttributes::
	db \3
	db CURRENT_MAP_HEIGHT, CURRENT_MAP_WIDTH
	db BANK(\1_Blocks)
	dw \1_Blocks
	db BANK(\1_MapScripts) ; BANK(\1_MapEvents)
	dw \1_MapScripts
	dw \1_MapEvents
	db \4
ENDM

; Connections go in order: north, south, west, east
connection: MACRO
;\1: direction
;\2: map name
;\3: map id
;\4: offset of the target map relative to the current map
;    (x offset for east/west, y offset for north/south)

; LEGACY: Support for old connection macro
if _NARG == 6
	connection \1, \2, \3, (\4) - (\5)
else

; Calculate tile offsets for source (current) and target maps
_src = 0
_tgt = (\4) + 3
if _tgt < 0
_src = -_tgt
_tgt = 0
endc

if "\1" == "north"
_blk = \3_WIDTH * (\3_HEIGHT + -3) + _src
_map = _tgt
_win = (\3_WIDTH + 6) * \3_HEIGHT + 1
_y = \3_HEIGHT * 2 - 1
_x = (\4) * -2
_len = CURRENT_MAP_WIDTH + 3 - (\4)
if _len > \3_WIDTH
_len = \3_WIDTH
endc

elif "\1" == "south"
_blk = _src
_map = (CURRENT_MAP_WIDTH + 6) * (CURRENT_MAP_HEIGHT + 3) + _tgt
_win = \3_WIDTH + 7
_y = 0
_x = (\4) * -2
_len = CURRENT_MAP_WIDTH + 3 - (\4)
if _len > \3_WIDTH
_len = \3_WIDTH
endc

elif "\1" == "west"
_blk = (\3_WIDTH * _src) + \3_WIDTH + -3
_map = (CURRENT_MAP_WIDTH + 6) * _tgt
_win = (\3_WIDTH + 6) * 2 + -6
_y = (\4) * -2
_x = \3_WIDTH * 2 - 1
_len = CURRENT_MAP_HEIGHT + 3 - (\4)
if _len > \3_HEIGHT
_len = \3_HEIGHT
endc

elif "\1" == "east"
_blk = (\3_WIDTH * _src)
_map = (CURRENT_MAP_WIDTH + 6) * _tgt + CURRENT_MAP_WIDTH + 3
_win = \3_WIDTH + 7
_y = (\4) * -2
_x = 0
_len = CURRENT_MAP_HEIGHT + 3 - (\4)
if _len > \3_HEIGHT
_len = \3_HEIGHT
endc

else
fail "Invalid direction for 'connection'."
endc

	map_id \3
	dw \2_Blocks + _blk
	dw wOverworldMapBlocks + _map
	db _len - _src
	db \3_WIDTH
	db _y, _x
	dw wOverworldMapBlocks + _win
endc
ENDM


	map_attributes SilentTown, SILENT_TOWN, $05, WEST | EAST
	connection west, Route101, ROUTE_29, -6
	connection east, Route115, ROUTE_27, 4

	map_attributes CrownCity, CHERRYGROVE_CITY, $05, NORTH 
	connection north, VictoryRoadOutside, MOUNT_MOON_SQUARE, 0
	
	map_attributes VictoryRoadOutside, MOUNT_MOON_SQUARE, $6D, NORTH | SOUTH
	connection north, IndigoPlateau, ROUTE_23, 0
	connection south, CrownCity, CHERRYGROVE_CITY, 0

	map_attributes PagotaCity, OLD_CITY, $05, WEST
	connection west, Route102, ROUTE_36, 5

	map_attributes BirdonTown, AZALEA_TOWN, $4B, SOUTH | EAST
	connection south, Route103, ROUTE_35, 0
	connection east, Route104, ROUTE_33, 0

	map_attributes SunpointCity, CIANWOOD_CITY, $34, EAST
	connection east, Route111, ROUTE_41, 0

	map_attributes WestportCity, GOLDENROD_CITY, $35, NORTH | EAST
	connection north, Route103, ROUTE_35, 5
	connection east, Route102, ROUTE_36, 5

	map_attributes AlloyCity, ALLOY_CITY, $05, WEST | EAST
	connection west, Route106, ROUTE_106, 0
	connection east, Route108, ROUTE_108, 9

	map_attributes TeknosCity, ECRUTEAK_CITY, $07, NORTH | WEST
	connection north, Boardwalk, BOARDWALK, 8
	connection west, Route120, ROUTE_8, 0

	map_attributes SanskritTown, SANSKRIT_TOWN, $07, NORTH | SOUTH | WEST | EAST
	connection north, RuinsOfAlphOutside, RUINS_OF_ALPH_OUTSIDE, 0
	connection south, Boardwalk, BOARDWALK, -3
	connection west, Route118, ROUTE_118, 0
	connection east, Route117, ROUTE_117, 0
	
	map_attributes RuinsOfAlphOutside, RUINS_OF_ALPH_OUTSIDE, $07, SOUTH
	connection south, SanskritTown, SANSKRIT_TOWN, 0

	map_attributes BlueForest, BLACKTHORN_CITY, $3C, NORTH | SOUTH | WEST
	connection north, Route111, ROUTE_41, 5
	connection south, Route112, ROUTE_32, 5
	connection west, Route110, ROUTE_110, 9

	map_attributes Route115, ROUTE_27, $35, WEST | EAST
	connection west, SilentTown, SILENT_TOWN, -4

	map_attributes Route101, ROUTE_29, $05, EAST
	connection east, SilentTown, SILENT_TOWN, 6

	map_attributes Route105, ROUTE_30, $33, SOUTH | WEST
	connection south, Route106, ROUTE_106, 0
	connection west, Route104, ROUTE_33, 0

	map_attributes Route106, ROUTE_106, $05, EAST
	connection east, AlloyCity, ALLOY_CITY, 0

	map_attributes Route112, ROUTE_32, $3C, NORTH
	connection north, BlueForest, BLACKTHORN_CITY, -5

	map_attributes Route104, ROUTE_33, $4B, WEST | EAST
	connection west, BirdonTown, AZALEA_TOWN, 0
	connection east, Route105, ROUTE_30, 0

	map_attributes Route113, ROUTE_34, $05, NORTH
	connection north, StandCity, STAND_CITY, -10

	map_attributes Route103, ROUTE_35, $4B, NORTH | SOUTH
	connection north, BirdonTown, AZALEA_TOWN, 0
	connection south, WestportCity, GOLDENROD_CITY, -5

	map_attributes Route102, ROUTE_36, $05, WEST | EAST
	connection west, WestportCity, GOLDENROD_CITY, -5
	connection east, PagotaCity, OLD_CITY, -5

	map_attributes SilentHills, ROUTE_37, $05, 0

	map_attributes Route108, ROUTE_108, $78, WEST | EAST
	connection west, AlloyCity, ALLOY_CITY, -9
	connection east, Route109, ROUTE_109, -36

	map_attributes Route109, ROUTE_109, $78, WEST
	connection west, Route108, ROUTE_108, 36

	map_attributes Route110, ROUTE_110, $3C, EAST
	connection east, BlueForest, BLACKTHORN_CITY, -9

	map_attributes Route111, ROUTE_41, $35, NORTH | SOUTH
	connection north, FrostPoint, CINNABAR_ISLAND, 0
	connection south, BlueForest, BLACKTHORN_CITY, -5

	map_attributes Boardwalk, BOARDWALK, $07, NORTH | SOUTH
	connection north, SanskritTown, SANSKRIT_TOWN, 3
	connection south, TeknosCity, ECRUTEAK_CITY, -8

	map_attributes YoronCity, PEWTER_CITY, $35, EAST
	connection east, YoronPoint, ROUTE_24, 9

	map_attributes Route116, ROUTE_116, $65, WEST
	connection west, Route117, ROUTE_117, 0

	map_attributes KobanIsland, PALLET_TOWN, $07, SOUTH
	connection south, Route107, ROUTE_107, 0

	map_attributes Route107, ROUTE_107, $07, NORTH
	connection north, KobanIsland, PALLET_TOWN, 0

	map_attributes FrostPoint, CINNABAR_ISLAND, $3C, SOUTH
	connection south, Route111, ROUTE_41, 0

	map_attributes IsenStrait, ROUTE_20, $35, WEST
	connection west, NagoVillage, CERULEAN_CITY, 0

	map_attributes KeramaStrait, ROUTE_19, $35, WEST | EAST
	connection west, YoronPoint, ROUTE_24, 0
	connection east, UrasoeTrail, ROUTE_12, -9

	map_attributes StandCity, STAND_CITY, $05, SOUTH
	connection south, Route113, ROUTE_34, 10

	map_attributes KantoCity, CELADON_CITY, $0f, EAST
	connection east, Route114, ROUTE_9, 9

	map_attributes Route119, ROUTE_7, $07, EAST
	connection east, Route120, ROUTE_8, 18

	map_attributes UrasoeTrail, ROUTE_12, $35, WEST
	connection west, KeramaStrait, ROUTE_19, 9

	map_attributes AmamiTown, VERMILION_CITY, $07, SOUTH
	connection south, SeasidePath, ROUTE_10_NORTH, 0

	map_attributes RyukyuCity, SAFFRON_CITY, $5d, SOUTH
	connection south, UrasoePark, ROUTE_10_SOUTH, 0

	map_attributes SunpointDocks, ROUTE_5, $0A, 0

	map_attributes NagoVillage, CERULEAN_CITY, $35, SOUTH | EAST
	connection south, MeridianPath, ROUTE_25, 0
	connection east, IsenStrait, ROUTE_20, 0

	map_attributes Route114, ROUTE_9, $0f, WEST
	connection west, KantoCity, CELADON_CITY, -9

	map_attributes YoronPoint, ROUTE_24, $35, WEST | EAST
	connection west, YoronCity, PEWTER_CITY, -9
	connection east, KeramaStrait, ROUTE_19, 0

	map_attributes MeridianPath, ROUTE_25, $35, NORTH | EAST
	connection north, NagoVillage, CERULEAN_CITY, 0
	connection east, CharredSummit, EASTWARD_SUMMIT, 9

	map_attributes Route117, ROUTE_117, $65, WEST | EAST
	connection west, SanskritTown, SANSKRIT_TOWN, 0
	connection east, Route116, ROUTE_116, 0

	map_attributes Route118, ROUTE_118, $07, EAST
	connection east, SanskritTown, SANSKRIT_TOWN, 0

	map_attributes Route120, ROUTE_8, $07, WEST | EAST
	connection west, Route119, ROUTE_7, -18
	connection east, TeknosCity, ECRUTEAK_CITY, 0

	map_attributes SeasidePath, ROUTE_10_NORTH, $07, NORTH
	connection north, AmamiTown, VERMILION_CITY, 0

	map_attributes UrasoePark, ROUTE_10_SOUTH, $5d, NORTH
	connection north, RyukyuCity, SAFFRON_CITY, 0

	map_attributes IndigoPlateau, ROUTE_23, $05, SOUTH
	connection south, VictoryRoadOutside, MOUNT_MOON_SQUARE, 0
	
	map_attributes CharredSummit, EASTWARD_SUMMIT, $35, WEST
	connection west, MeridianPath, ROUTE_25, -9

	map_attributes BrassTower1F, BRASS_TOWER_1F, $00, 0
	map_attributes BrassTower2F, BRASS_TOWER_2F, $00, 0
	map_attributes BrassTower3F, BRASS_TOWER_3F, $00, 0
	map_attributes BrassTower4F, BRASS_TOWER_4F, $00, 0
	map_attributes BrassTower5F, BRASS_TOWER_5F, $00, 0
	map_attributes NationalPark, NATIONAL_PARK, $04, 0
	map_attributes NationalParkBugContest, NATIONAL_PARK_BUG_CONTEST, $04, 0
	map_attributes RadioTower1F, RADIO_TOWER_1F, $00, 0
	map_attributes RadioTower2F, RADIO_TOWER_2F, $00, 0
	map_attributes RadioTower3F, RADIO_TOWER_3F, $00, 0
	map_attributes RadioTower4F, RADIO_TOWER_4F, $00, 0
	map_attributes RadioTower5F, RADIO_TOWER_5F, $00, 0
	map_attributes RadioTower6F, RADIO_TOWER_5F, $00, 0
	map_attributes RuinsOfAlphHoOhChamber, RUINS_OF_ALPH_HO_OH_CHAMBER, $00, 0
	map_attributes RuinsOfAlphKabutoChamber, RUINS_OF_ALPH_KABUTO_CHAMBER, $00, 0
	map_attributes RuinsOfAlphOmanyteChamber, RUINS_OF_ALPH_OMANYTE_CHAMBER, $00, 0
	map_attributes RuinsOfAlphAerodactylChamber, RUINS_OF_ALPH_AERODACTYL_CHAMBER, $00, 0
	map_attributes RuinsOfAlphInnerChamber, RUINS_OF_ALPH_INNER_CHAMBER, $00, 0
	map_attributes RuinsOfAlphResearchCenter, RUINS_OF_ALPH_RESEARCH_CENTER, $00, 0
	map_attributes BoulderMines1F, BOULDER_MINES_1F, $09, 0
	map_attributes BoulderMinesB1F, BOULDER_MINES_B1F, $09, 0
	map_attributes BoulderMinesB5F, BOULDER_MINES_B5F, $09, 0
	map_attributes SlowpokeWellB1F, SLOWPOKE_WELL_B1F, $09, 0
	map_attributes SlowpokeWellB2F, SLOWPOKE_WELL_B2F, $09, 0
	map_attributes TeknosAquarium1F, OLIVINE_LIGHTHOUSE_1F, $00, 0
	map_attributes TeknosAquarium2F, OLIVINE_LIGHTHOUSE_2F, $00, 0
	map_attributes EndonCaveB1F, ENDON_CAVE_B1F, $09, 0
	map_attributes KobanMart, SUGAR_MART, $00, 0
	map_attributes KobanClairsHouse, SUGAR_HOUSE_1, $00, 0
	map_attributes KobanFisherHouse, SUGAR_HOUSE_2, $00, 0
	map_attributes BlueForestNightmareHouse, BLUEFOREST_HOUSE_1, $00, 0
	map_attributes TeamRocketBaseB2FOffice, TEAM_ROCKET_BASE_B2F_OFFICE, $00, 0
	map_attributes TeamRocketBaseB1F, TEAM_ROCKET_BASE_B1F, $00, 0
	map_attributes TeamRocketBaseB2F, TEAM_ROCKET_BASE_B2F, $00, 0
	map_attributes JadeForest, JADE_FOREST, $05, 0
	map_attributes WestportUnderground, GOLDENROD_UNDERGROUND, $00, 0
	map_attributes CharredSummitCave, CHARRED_SUMMIT_CAVE, $09, 0
	map_attributes JouleCaveZapdosRoom, JOULE_CAVE_ZAPDOS_ROOM, $09, 0
	map_attributes JouleCave, JOULE_CAVE, $09, 0
	map_attributes IcedCavern1F, ICED_CAVERN_1F, $09, 0
	map_attributes IcedCavernB1F, ICED_CAVERN_B1F, $09, 0
	map_attributes DeepwaterPassageB2F, DEEPWATER_PASSAGE_B2F, $09, 0
	map_attributes MagmaShaftB1F, MAGMA_SHAFT_B1F, $59, 0
	map_attributes MagmaShaftB2F, MAGMA_SHAFT_B2F, $59, 0
	map_attributes MagmaShaft1F, MAGMA_SHAFT_1F, $59, 0
	map_attributes DeepwaterPassageB1F, DEEPWATER_PASSAGE_B1F, $09, 0
	map_attributes DeepwaterPassageB3F, DEEPWATER_PASSAGE_B3F, $09, 0
	map_attributes WhirlIslandB2FCave, WHIRL_ISLAND_B2F_CAVE, $09, 0
	map_attributes WhirlIsland1F, WHIRL_ISLAND_1F, $09, 0
	map_attributes WhirlIslandB1F, WHIRL_ISLAND_B1F, $09, 0
	map_attributes WhirlIslandB2F, WHIRL_ISLAND_B2F, $09, 0
	map_attributes WhirlIslandLugiaChamber, WHIRL_ISLAND_LUGIA_CHAMBER, $0f, 0
	map_attributes AmpareCavernB1F, AMPARE_CAVERN_B1F, $1D, 0
	map_attributes AmpareCavern1F, AMPARE_CAVERN_1F, $09, 0
	map_attributes DeepwaterPassage1F, DEEPWATER_PASSAGE_1F, $09, 0
	map_attributes DragonsMaw, DRAGONS_DEN_B1F, $09, 0
	map_attributes KantoCafe, DRAGON_SHRINE, $00, 0
	map_attributes AlloyPokecenter1F, ALLOY_POKECENTER_1F, $00, 0
	map_attributes AlloyGym, ALLOY_GYM, $00, 0
	map_attributes AlloyTimsHouse, ALLOY_TIMS_HOUSE, $00, 0
	map_attributes AlloyOldCaptainsHouse, ALLOY_CAPTAINS_HOUSE, $00, 0
	map_attributes AlloyPunishmentSpeechHouse, ALLOY_PUNISHMENT_SPEECH_HOUSE, $00, 0
	map_attributes AlloyGoodRodHouse, ALLOY_GOOD_ROD_HOUSE, $00, 0
	map_attributes AlloyCafe, ALLOY_CAFE, $00, 0
	map_attributes AlloyMart, ALLOY_MART, $00, 0
	map_attributes Route109Route110Gate, ROUTE_109_ROUTE_110_GATE, $00, 0
	map_attributes SanskritCoinCaseSpeechHouse, ROUTE_110, $00, 0
	map_attributes BlueForestGym, MAHOGANY_GYM, $00, 0
	map_attributes SanskritPokecenter1F, SANSKRIT_POKECENTER_1F, $00, 0
	map_attributes EndonCave1F, ENDON_CAVE_1F, $09, 0
	map_attributes BoulderMinesB4F, BOULDER_MINES_B4F, $09, 0
	map_attributes CrownPass, CROWN_PASS, $09, 0
	map_attributes BoulderMinesB2F, BOULDER_MINES_B2F, $09, 0
	map_attributes BoulderMinesB3F, BOULDER_MINES_B3F, $09, 0
	map_attributes NanjoForest, NANJO_FOREST, $00, 0
	map_attributes VictoryRoad, VICTORY_ROAD, $09, 0
	map_attributes VictoryRoad2F, VICTORY_ROAD_2F, $09, 0
	map_attributes TeknosPokecenter1F, ECRUTEAK_POKECENTER_1F, $00, 0
	map_attributes TeknosOldRodHouse, ECRUTEAK_BLISSEY_SPEECH_HOUSE, $00, 0
	map_attributes KantoFossilLab, DANCE_THEATRE, $00, 0
	map_attributes TeknosMart, ECRUTEAK_MART, $00, 0
	map_attributes BirdonGym, ECRUTEAK_GYM, $00, 0
	map_attributes WestportElderItemfinderHouse, ECRUTEAK_ITEMFINDER_HOUSE, $00, 0
	map_attributes ResearchFacilityBackRoom, BLACKTHORN_GYM_1F, $00, 0
	map_attributes ResearchFacilityEntrance, BLACKTHORN_GYM_2F, $00, 0
	map_attributes BlueForestSpeechHouse, BLACKTHORN_DRAGON_SPEECH_HOUSE, $00, 0
	map_attributes BlueForestEmysHouse, BLACKTHORN_EMYS_HOUSE, $00, 0
	map_attributes BlueForestMart, BLACKTHORN_MART, $00, 0
	map_attributes BlueForestPokecenter1F, BLACKTHORN_POKECENTER_1F, $00, 0
	map_attributes MoveDeletersHouse, MOVE_DELETERS_HOUSE, $00, 0
	map_attributes FrostpointPokecenter1F, CINNABAR_POKECENTER_1F, $00, 0
	map_attributes RyukyuCityMeridianPathGate, ROUTE_19_FUCHSIA_GATE, $00, 0
	map_attributes NagoImposterHouse, CERULEAN_POLICE_STATION, $00, 0
	map_attributes NagoPokecenter1F, CERULEAN_POKECENTER_1F, $00, 0
	map_attributes JadeForestSnorlaxRoom, CERULEAN_GYM, $05, 0
	map_attributes NagoMart, CERULEAN_MART, $00, 0
	map_attributes Route109Pokecenter1F, ROUTE_109_POKECENTER_1F, $00, 0
	map_attributes EarlsArtHouse, BILLS_HOUSE, $00, 0
	map_attributes BirdonPokecenter1F, AZALEA_POKECENTER_1F, $00, 0
	map_attributes BirdonCafe, CHARCOAL_KILN, $00, 0
	map_attributes BirdonMart, AZALEA_MART, $00, 0
	map_attributes KurtsHouse, KURTS_HOUSE, $00, 0
	map_attributes WestportGym, AZALEA_GYM, $00, 0
	map_attributes BoardwalkTeknosGate, ROUTE_43_MAHOGANY_GATE, $00, 0
	map_attributes BoardwalkSanskritGate, ROUTE_43_GATE, $00, 0
	map_attributes PagotaMart, VIOLET_MART, $00, 0
	map_attributes PagotaGym, VIOLET_GYM, $00, 0
	map_attributes PagotaTrainerSchool, EARLS_POKEMON_ACADEMY, $00, 0
	map_attributes PagotaNicknameSpeechHouse, VIOLET_NICKNAME_SPEECH_HOUSE, $00, 0
	map_attributes PagotaPokecenter1F, VIOLET_POKECENTER_1F, $00, 0
	map_attributes TeknosKylesHouse, VIOLET_KYLES_HOUSE, $00, 0
	map_attributes Route106Pokecenter1F, ROUTE_106_POKECENTER_1F, $00, 0
	map_attributes Route103WestportGate, ROUTE_35_GOLDENROD_GATE, $00, 0
	map_attributes Route112StandCityGate, ROUTE_36_RUINS_OF_ALPH_GATE, $00, 0
	map_attributes NationalParkStandGate, ROUTE_36_NATIONAL_PARK_GATE, $00, 0
	map_attributes TeknosGym, GOLDENROD_GYM, $00, 0
	map_attributes WestportBikeShop, GOLDENROD_BIKE_SHOP, $00, 0
	map_attributes WestportHappinessRater, GOLDENROD_HAPPINESS_RATER, $00, 0
	map_attributes BillsFamilysHouse, BILLS_FAMILYS_HOUSE, $00, 0
	map_attributes KantoHotel, GOLDENROD_MAGNET_TRAIN_STATION, $00, 0
	map_attributes Route102N64House, GOLDENROD_FLOWER_SHOP, $00, 0
	map_attributes WestportPPSpeechHouse, GOLDENROD_PP_SPEECH_HOUSE, $00, 0
	map_attributes WestportNameRater, GOLDENROD_NAME_RATER, $00, 0
	map_attributes WestportDeptStore1F, GOLDENROD_DEPT_STORE_1F, $00, 0
	map_attributes WestportDeptStore2F, GOLDENROD_DEPT_STORE_2F, $00, 0
	map_attributes WestportDeptStore3F, GOLDENROD_DEPT_STORE_3F, $00, 0
	map_attributes WestportDeptStore4F, GOLDENROD_DEPT_STORE_4F, $00, 0
	map_attributes WestportDeptStore5F, GOLDENROD_DEPT_STORE_5F, $00, 0
	map_attributes WestportDeptStore6F, GOLDENROD_DEPT_STORE_6F, $00, 0
	map_attributes WestportDeptStoreElevator, GOLDENROD_DEPT_STORE_ELEVATOR, $00, 0
	map_attributes WestportDeptStoreRoof, GOLDENROD_DEPT_STORE_ROOF, $24, 0
	map_attributes BoardwalkGameCorner, BOARDWALK_GAME_CORNER, $00, 0
	map_attributes WestpointPokecenter1F, GOLDENROD_POKECENTER_1F, $00, 0
	map_attributes Route115KantoGate, ILEX_FOREST_AZALEA_GATE, $00, 0
	map_attributes Route113Route114Gate, ROUTE_34_ILEX_FOREST_GATE, $00, 0
	map_attributes DayCare, DAY_CARE, $00, 0
	map_attributes AmamiFishingSpeechHouse, VERMILION_FISHING_SPEECH_HOUSE, $00, 0
	map_attributes AmamiPokecenter1F, VERMILION_POKECENTER_1F, $00, 0
	map_attributes NagoCharmanderHouse, VERMILION_MAGNET_TRAIN_SPEECH_HOUSE, $00, 0
	map_attributes AmamiMart, VERMILION_MART, $00, 0
	map_attributes NagoSpeechHouse, VERMILION_DIGLETTS_CAVE_SPEECH_HOUSE, $00, 0
	map_attributes AmamiSwimmingPool, VERMILION_GYM, $00, 0
	map_attributes RyukyuUrasoeGate, ROUTE_6_SAFFRON_GATE, $00, 0
	map_attributes RedsHouse1F, REDS_HOUSE_1F, $00, 0
	map_attributes RedsHouse2F, REDS_HOUSE_2F, $00, 0
	map_attributes BluesHouse, BLUES_HOUSE, $00, 0
	map_attributes OaksLabKanto, OAKS_LAB, $00, 0
	map_attributes YoronPartsShop, PEWTER_NIDORAN_SPEECH_HOUSE, $00, 0
	map_attributes YoronSocialHouse, PEWTER_GYM, $00, 0
	map_attributes YoronMart, PEWTER_MART, $00, 0
	map_attributes YoronPokecenter1F, PEWTER_POKECENTER_1F, $00, 0
	map_attributes YoronSnoozeSpeechHouse, PEWTER_SNOOZE_SPEECH_HOUSE, $00, 0
	map_attributes WestportPort, OLIVINE_PORT, $0a, 0
	map_attributes AmamiPort, VERMILION_PORT, $0a, 0
	map_attributes FastShip1F, FAST_SHIP_1F, $00, 0
	map_attributes FastShipCabins_NNW_NNE_NE, FAST_SHIP_CABINS_NNW_NNE_NE, $00, 0
	map_attributes FastShipCabins_SW_SSW_NW, FAST_SHIP_CABINS_SW_SSW_NW, $00, 0
	map_attributes FastShipCabins_SE_SSE_CaptainsCabin, FAST_SHIP_CABINS_SE_SSE_CAPTAINS_CABIN, $00, 0
	map_attributes FastShipB1F, FAST_SHIP_B1F, $00, 0
	map_attributes WestportPortPassage, OLIVINE_PORT_PASSAGE, $00, 0
	map_attributes AmamiPortPassage, VERMILION_PORT_PASSAGE, $00, 0
	map_attributes BrassTowerRoof, TIN_TOWER_ROOF, $00, 0
	map_attributes IndigoPlateauPokecenter1F, INDIGO_PLATEAU_POKECENTER_1F, $00, 0
	map_attributes LoreleisRoom, WILLS_ROOM, $00, 0
	map_attributes KogasRoom, KOGAS_ROOM, $00, 0
	map_attributes AgathasRoom, BRUNOS_ROOM, $00, 0
	map_attributes GiovannisRoom, KARENS_ROOM, $00, 0
	map_attributes LancesRoom, LANCES_ROOM, $00, 0
	map_attributes HallOfFame, HALL_OF_FAME, $00, 0
	map_attributes StandMart, FUCHSIA_MART, $00, 0
	map_attributes StandZooMainOffice, SAFARI_ZONE_MAIN_OFFICE, $00, 0
	map_attributes BillsBrothersHouse, BILLS_BROTHERS_HOUSE, $00, 0
	map_attributes StandPokecenter1F, FUCHSIA_POKECENTER_1F, $00, 0
	map_attributes StandRocketHouse1F, SAFARI_ZONE_WARDENS_HOME, $00, 0
	map_attributes StandRocketHouse2F, SAFARI_ZONE_WARDENS_HOME_2F, $00, 0
	map_attributes Route119SunpointGate, ROUTE_15_FUCHSIA_GATE, $00, 0
	map_attributes KobanPokecenter1F, LAVENDER_POKECENTER_1F, $00, 0
	map_attributes PrycesFamilyHouse, LAVENDER_SPEECH_HOUSE, $00, 0
	map_attributes FrostpointNameRater, LAVENDER_NAME_RATER, $00, 0
	map_attributes FrostpointMart, LAVENDER_MART, $00, 0
	map_attributes SanskritRocketHouse, SANSKRIT_ROCKET_HOUSE, $00, 0
	map_attributes UrasoeParkUrasoeTrailGate, ROUTE_8_SAFFRON_GATE, $00, 0
	map_attributes UrasoeTrailSuperRodHouse, ROUTE_12_SUPER_ROD_HOUSE, $00, 0
	map_attributes Pokecenter2F, POKECENTER_2F, $00, 0
	map_attributes TradeCenter, TRADE_CENTER, $00, 0
	map_attributes Colosseum, COLOSSEUM, $00, 0
	map_attributes TimeCapsule, TIME_CAPSULE, $00, 0
	map_attributes MobileTradeRoom, MOBILE_TRADE_ROOM, $00, 0
	map_attributes MobileBattleRoom, MOBILE_BATTLE_ROOM, $00, 0
	map_attributes KantoDeptStore1F, CELADON_DEPT_STORE_1F, $00, 0
	map_attributes KantoDeptStore2F, CELADON_DEPT_STORE_2F, $00, 0
	map_attributes KantoDeptStore3F, CELADON_DEPT_STORE_3F, $00, 0
	map_attributes KantoDeptStore4F, CELADON_DEPT_STORE_4F, $00, 0
	map_attributes KantoDeptStore5F, CELADON_DEPT_STORE_5F, $00, 0
	map_attributes KantoDeptStore6F, CELADON_DEPT_STORE_6F, $00, 0
	map_attributes KantoDeptStoreElevator, CELADON_DEPT_STORE_ELEVATOR, $00, 0
	map_attributes KantoCeladonMansion1F, CELADON_MANSION_1F, $00, 0
	map_attributes KantoCeladonMansion2F, CELADON_MANSION_2F, $00, 0
	map_attributes KantoCeladonMansion3F, CELADON_MANSION_3F, $00, 0
	map_attributes KantoCeladonMansionRoof, CELADON_MANSION_ROOF, $00, 0
	map_attributes KantoCeladonMansionRoofHouse, CELADON_MANSION_ROOF_HOUSE, $00, 0
	map_attributes KantoPokecenterWest1F, CELADON_POKECENTER_1F, $00, 0
	map_attributes KantoGameCorner, CELADON_GAME_CORNER, $00, 0
	map_attributes KantoGameCornerPrizeRoom, CELADON_GAME_CORNER_PRIZE_ROOM, $00, 0
	map_attributes KantoGym, CELADON_GYM, $00, 0
	map_attributes KantoLeftoversHouse, CELADON_CAFE, $00, 0
	map_attributes CrownCityTrainerHouse, ROUTE_16_FUCHSIA_SPEECH_HOUSE, $00, 0
	map_attributes Route118SunpointGate, ROUTE_118_SUNPOINT_GATE, $00, 0
	map_attributes IsenStraitSeasidePathGate, ROUTE_17_ROUTE_18_GATE, $00, 0
	map_attributes StandGym, CIANWOOD_GYM, $00, 0
	map_attributes SunpointPokecenter1F, CIANWOOD_POKECENTER_1F, $00, 0
	map_attributes CrownCitySpeechHouse, CIANWOOD_PHARMACY, $00, 0
	map_attributes SunpointPhotoStudio, CIANWOOD_PHOTO_STUDIO, $00, 0
	map_attributes CrownCityScopeLensHouse, CIANWOOD_BLISSEY_SPEECH_HOUSE, $00, 0
	map_attributes PokeSeersHouse, POKE_SEERS_HOUSE, $00, 0
	map_attributes BattleTower1F, BATTLE_TOWER_1F, $00, 0
	map_attributes BattleTowerBattleRoom, BATTLE_TOWER_BATTLE_ROOM, $00, 0
	map_attributes BattleTowerElevator, BATTLE_TOWER_ELEVATOR, $00, 0
	map_attributes BattleTowerHallway, BATTLE_TOWER_HALLWAY, $00, 0
	map_attributes BattleTowerOutside, BATTLE_TOWER_OUTSIDE, $05, 0
	map_attributes RocketShipBase, VIRIDIAN_GYM, $00, 0
	map_attributes SanskritMart, SANSKRIT_MART, $00, 0
	map_attributes SilentPokecenter1F, VIRIDIAN_POKECENTER_1F, $00, 0
	map_attributes Route116Gate, ROUTE_2_GATE, $00, 0
	map_attributes VictoryRoadGate, VICTORY_ROAD_GATE, $00, 0
	map_attributes OaksLabEntrance, ELM_ENTRANCE, $00, 0
	map_attributes OaksLab, ELMS_LAB, $00, 0
	map_attributes PlayersHouse1F, PLAYERS_HOUSE_1F, $00, 0
	map_attributes PlayersHouse2F, PLAYERS_HOUSE_2F, $00, 0
	map_attributes SilentHouse, ELMS_HOUSE, $00, 0
	map_attributes Route110SandstormHouse, ROUTE_27_SANDSTORM_HOUSE, $00, 0
	map_attributes Route111BlueForestGate, ROUTE_29_ROUTE_46_GATE, $00, 0
	map_attributes FightingDojo, FIGHTING_DOJO, $00, 0
	map_attributes RyukyuFakeGym, SAFFRON_GYM, $00, 0
	map_attributes RyukyuMart, SAFFRON_MART, $00, 0
	map_attributes RyukyuPokecenter1F, SAFFRON_POKECENTER_1F, $00, 0
	map_attributes MrPsychicsHouse, MR_PSYCHICS_HOUSE, $00, 0
	map_attributes RyukyuArboretum, SAFFRON_MAGNET_TRAIN_STATION, $00, 0
	map_attributes SilphCo1F, SILPH_CO_1F, $00, 0
	map_attributes SunPointDocksSunPointGate, ROUTE_5_SAFFRON_GATE, $00, 0
	map_attributes CrownMart, CHERRYGROVE_MART, $00, 0
	map_attributes CrownPokecenter1F, CHERRYGROVE_POKECENTER_1F, $00, 0
	map_attributes BirdonEldersHouse, CHERRYGROVE_GYM_SPEECH_HOUSE, $00, 0
	map_attributes BirdonSpeechHouse, CHERRYGROVE_EVOLUTION_SPEECH_HOUSE, $00, 0
	map_attributes Route104GardenersHouse, ROUTE_30_BERRY_HOUSE, $00, 0
	map_attributes Route110PagotaGate, ROUTE_31_VIOLET_GATE, $00, 0
	map_attributes Route102WestportGate, NEW_VIOLET_GATE_NORTH, $00, 0
	map_attributes Route105Route106Gate, NEW_ECRUTEAK_GATE_SOUTH, $00, 0
	map_attributes Route107AlloyGate, ROUTE_107_ALLOY_GATE, $00, 0
	map_attributes Route107AlloyGate2F, ROUTE_107_ALLOY_GATE_2F, $00, 0
	map_attributes Route110PagotaGate2F, ROUTE_31_VIOLET_GATE_2F, $00, 0
	map_attributes Route102WestportGate2F, NEW_VIOLET_GATE_NORTH_2F, $00, 0
	map_attributes TeknosPort, TEKU_PORT, $0a, 0
	map_attributes TeknosPortPassage, TEKU_PORT_PASSAGE, $00, 0
	map_attributes StandZooInfirmary, STAND_POKE, $00, 0
	map_attributes KantoPokecenter1F, KANTO_POKECENTER_1F, $00, 0
	map_attributes KantoMart, KANTO_MART, $00, 0
	map_attributes KantoBattleClub1F, KANTO_BATTLE_CLUB_1F, $00, 0
	map_attributes KantoBattleClubB1F, KANTO_BATTLE_CLUB_B1F, $00, 0
	map_attributes KantoHouse1, KANTO_HOUSE_1, $00, 0
	map_attributes KantoHouse2, KANTO_HOUSE_2, $00, 0
	map_attributes KantoHouse3, KANTO_HOUSE_3, $00, 0
	map_attributes KantoHouse4, KANTO_HOUSE_4, $00, 0
