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

	map_attributes PagotaCity, PAGOTA_CITY, $05, WEST
	connection west, Route102, ROUTE_102, 5

	map_attributes BirdonTown, BIRDON_TOWN, $4B, SOUTH | EAST
	connection south, Route103, ROUTE_103, 0
	connection east, Route104, ROUTE_104, 0

	map_attributes SunpointCity, CIANWOOD_CITY, $34, EAST
	connection east, Route111, ROUTE_111, 0

	map_attributes WestportCity, WESTPORT_CITY, $35, NORTH | EAST
	connection north, Route103, ROUTE_103, 5
	connection east, Route102, ROUTE_102, 5

	map_attributes AlloyCity, ALLOY_CITY, $05, WEST | EAST
	connection west, Route106, ROUTE_106, 0
	connection east, Route108, ROUTE_108, 9

	map_attributes TeknosCity, TEKNOS_CITY, $07, NORTH | WEST
	connection north, Boardwalk, BOARDWALK, 8
	connection west, Route120, ROUTE_120, 0

	map_attributes SanskritTown, SANSKRIT_TOWN, $07, NORTH | SOUTH | WEST | EAST
	connection north, RuinsOfAlphOutside, RUINS_OF_ALPH_OUTSIDE, 0
	connection south, Boardwalk, BOARDWALK, -3
	connection west, Route118, ROUTE_118, 0
	connection east, Route117, ROUTE_117, 0
	
	map_attributes RuinsOfAlphOutside, RUINS_OF_ALPH_OUTSIDE, $07, SOUTH
	connection south, SanskritTown, SANSKRIT_TOWN, 0

	map_attributes BlueForest, BLUE_FOREST, $3C, NORTH | SOUTH | WEST
	connection north, Route111, ROUTE_111, 5
	connection south, Route112, ROUTE_112, 5
	connection west, Route110, ROUTE_110, 9

	map_attributes Route115, ROUTE_27, $35, WEST | EAST
	connection west, SilentTown, SILENT_TOWN, -4

	map_attributes Route101, ROUTE_29, $05, EAST
	connection east, SilentTown, SILENT_TOWN, 6

	map_attributes Route105, ROUTE_105, $33, SOUTH | WEST
	connection south, Route106, ROUTE_106, 0
	connection west, Route104, ROUTE_104, 0

	map_attributes Route106, ROUTE_106, $05, EAST
	connection east, AlloyCity, ALLOY_CITY, 0

	map_attributes Route112, ROUTE_112, $3C, NORTH
	connection north, BlueForest, BLUE_FOREST, -5

	map_attributes Route104, ROUTE_104, $4B, WEST | EAST
	connection west, BirdonTown, BIRDON_TOWN, 0
	connection east, Route105, ROUTE_105, 0

	map_attributes Route113, ROUTE_34, $05, NORTH
	connection north, StandCity, STAND_CITY, -10

	map_attributes Route103, ROUTE_103, $4B, NORTH | SOUTH
	connection north, BirdonTown, BIRDON_TOWN, 0
	connection south, WestportCity, WESTPORT_CITY, -5

	map_attributes Route102, ROUTE_102, $05, WEST | EAST
	connection west, WestportCity, WESTPORT_CITY, -5
	connection east, PagotaCity, PAGOTA_CITY, -5

	map_attributes SilentHills, SILENT_HILLS, $05, 0

	map_attributes Route108, ROUTE_108, $78, WEST | EAST
	connection west, AlloyCity, ALLOY_CITY, -9
	connection east, Route109, ROUTE_109, -36

	map_attributes Route109, ROUTE_109, $78, WEST
	connection west, Route108, ROUTE_108, 36

	map_attributes Route110, ROUTE_110, $3C, EAST
	connection east, BlueForest, BLUE_FOREST, -9

	map_attributes Route111, ROUTE_111, $35, NORTH | SOUTH
	connection north, FrostpointTown, FROSTPOINT_TOWN, 0
	connection south, BlueForest, BLUE_FOREST, -5

	map_attributes Boardwalk, BOARDWALK, $07, NORTH | SOUTH
	connection north, SanskritTown, SANSKRIT_TOWN, 3
	connection south, TeknosCity, TEKNOS_CITY, -8

	map_attributes YoronCity, YORON_CITY, $35, EAST
	connection east, YoronPoint, YORON_POINT, 9

	map_attributes Route116, ROUTE_116, $65, WEST
	connection west, Route117, ROUTE_117, 0

	map_attributes KobanIsland, KOBAN_ISLAND, $07, SOUTH
	connection south, Route107, ROUTE_107, 0

	map_attributes Route107, ROUTE_107, $07, NORTH
	connection north, KobanIsland, KOBAN_ISLAND, 0

	map_attributes FrostpointTown, FROSTPOINT_TOWN, $3C, SOUTH
	connection south, Route111, ROUTE_111, 0

	map_attributes IsenStrait, ISEN_STRAIT, $35, WEST
	connection west, NagoVillage, NAGO_VILLAGE, 0

	map_attributes KeramaStrait, KERAMA_STRAIT, $35, WEST | EAST
	connection west, YoronPoint, YORON_POINT, 0
	connection east, UrasoeTrail, URASOE_TRAIL, -9

	map_attributes StandCity, STAND_CITY, $05, SOUTH
	connection south, Route113, ROUTE_34, 10

	map_attributes KantoCity, CELADON_CITY, $0f, EAST
	connection east, Route114, ROUTE_9, 9

	map_attributes Route119, ROUTE_119, $07, EAST
	connection east, Route120, ROUTE_120, 18

	map_attributes UrasoeTrail, URASOE_TRAIL, $35, WEST
	connection west, KeramaStrait, KERAMA_STRAIT, 9

	map_attributes AmamiTown, AMAMI_TOWN, $07, SOUTH
	connection south, SeasidePath, SEASIDE_PATH, 0

	map_attributes RyukyuCity, SAFFRON_CITY, $5d, SOUTH
	connection south, UrasoePark, ROUTE_10_SOUTH, 0

	map_attributes SunpointDocks, ROUTE_5, $0A, 0

	map_attributes NagoVillage, NAGO_VILLAGE, $35, SOUTH | EAST
	connection south, MeridianPath, MERIDIAN_PATH, 0
	connection east, IsenStrait, ISEN_STRAIT, 0

	map_attributes Route114, ROUTE_9, $0f, WEST
	connection west, KantoCity, CELADON_CITY, -9

	map_attributes YoronPoint, YORON_POINT, $35, WEST | EAST
	connection west, YoronCity, YORON_CITY, -9
	connection east, KeramaStrait, KERAMA_STRAIT, 0

	map_attributes MeridianPath, MERIDIAN_PATH, $35, NORTH | EAST
	connection north, NagoVillage, NAGO_VILLAGE, 0
	connection east, CharredSummit, CHARRED_SUMMIT, 9

	map_attributes Route117, ROUTE_117, $65, WEST | EAST
	connection west, SanskritTown, SANSKRIT_TOWN, 0
	connection east, Route116, ROUTE_116, 0

	map_attributes Route118, ROUTE_118, $07, EAST
	connection east, SanskritTown, SANSKRIT_TOWN, 0

	map_attributes Route120, ROUTE_120, $07, WEST | EAST
	connection west, Route119, ROUTE_119, -18
	connection east, TeknosCity, TEKNOS_CITY, 0

	map_attributes SeasidePath, SEASIDE_PATH, $07, NORTH
	connection north, AmamiTown, AMAMI_TOWN, 0

	map_attributes UrasoePark, ROUTE_10_SOUTH, $5d, NORTH
	connection north, RyukyuCity, SAFFRON_CITY, 0

	map_attributes IndigoPlateau, ROUTE_23, $05, SOUTH
	connection south, VictoryRoadOutside, MOUNT_MOON_SQUARE, 0
	
	map_attributes CharredSummit, CHARRED_SUMMIT, $35, WEST
	connection west, MeridianPath, MERIDIAN_PATH, -9

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
	map_attributes TeknosAquarium1F, TEKNOS_AQUARIUM_1F, $00, 0
	map_attributes TeknosAquarium2F, TEKNOS_AQUARIUM_2F, $00, 0
	map_attributes EndonCaveB1F, ENDON_CAVE_B1F, $09, 0
	map_attributes KobanMart, KOBAN_MART, $00, 0
	map_attributes KobanClairsHouse, KOBAN_CLAIRS_HOUSE, $00, 0
	map_attributes KobanFisherHouse, KOBAN_FISHER_HOUSE, $00, 0
	map_attributes BlueForestNightmareHouse, BLUE_FOREST_NIGHTMARE_HOUSE, $00, 0
	map_attributes TeamRocketBaseB2FOffice, TEAM_ROCKET_BASE_B2F_OFFICE, $00, 0
	map_attributes TeamRocketBaseB1F, TEAM_ROCKET_BASE_B1F, $00, 0
	map_attributes TeamRocketBaseB2F, TEAM_ROCKET_BASE_B2F, $00, 0
	map_attributes JadeForest, JADE_FOREST, $05, 0
	map_attributes WestportUnderground, WESTPORT_UNDERGROUND, $00, 0
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
	map_attributes DragonsMaw, DRAGONS_MAW, $09, 0
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
	map_attributes BlueForestGym, BLUE_FOREST_GYM, $00, 0
	map_attributes SanskritPokecenter1F, SANSKRIT_POKECENTER_1F, $00, 0
	map_attributes EndonCave1F, ENDON_CAVE_1F, $09, 0
	map_attributes BoulderMinesB4F, BOULDER_MINES_B4F, $09, 0
	map_attributes CrownPass, CROWN_PASS, $09, 0
	map_attributes BoulderMinesB2F, BOULDER_MINES_B2F, $09, 0
	map_attributes BoulderMinesB3F, BOULDER_MINES_B3F, $09, 0
	map_attributes NanjoForest, NANJO_FOREST, $00, 0
	map_attributes VictoryRoad, VICTORY_ROAD, $09, 0
	map_attributes VictoryRoad2F, VICTORY_ROAD_2F, $09, 0
	map_attributes TeknosPokecenter1F, TEKNOS_POKECENTER_1F, $00, 0
	map_attributes TeknosOldRodHouse, TEKNOS_OLD_ROD_HOUSE, $00, 0
	map_attributes KantoFossilLab, DANCE_THEATRE, $00, 0
	map_attributes TeknosMart, TEKNOS_MART, $00, 0
	map_attributes BirdonGym, BIRDON_GYM, $00, 0
	map_attributes TeknosGrampsItemfinderHouse, TEKNOS_GRAMPS_ITEMFINDER_HOUSE, $00, 0
	map_attributes ResearchFacilityBackRoom, RESEARCH_FACILITY_BACK_ROOM, $00, 0
	map_attributes ResearchFacilityEntrance, RESEARCH_FACILITY_ENTRANCE, $00, 0
	map_attributes BlueForestSpeechHouse, BLUE_FOREST_SPEECH_HOUSE, $00, 0
	map_attributes BlueForestEmysHouse, BLUE_FOREST_EMYS_HOUSE, $00, 0
	map_attributes BlueForestMart, BLUE_FOREST_MART, $00, 0
	map_attributes BlueForestPokecenter1F, BLUE_FOREST_POKECENTER_1F, $00, 0
	map_attributes MoveDeletersHouse, MOVE_DELETERS_HOUSE, $00, 0
	map_attributes FrostpointPokecenter1F, FROSTPOINT_POKECENTER_1F, $00, 0
	map_attributes RyukyuCityMeridianPathGate, RYUKYU_CITY_MERIDIAN_PATH_GATE, $00, 0
	map_attributes NagoImposterHouse, NAGO_IMPOSTER_HOUSE, $00, 0
	map_attributes NagoPokecenter1F, NAGO_POKECENTER_1F, $00, 0
	map_attributes JadeForestSnorlaxRoom, JADE_FOREST_SNORLAX_ROOM, $05, 0
	map_attributes NagoMart, NAGO_MART, $00, 0
	map_attributes Route109Pokecenter1F, ROUTE_109_POKECENTER_1F, $00, 0
	map_attributes EarlsArtHouse, EARLS_ART_HOUSE, $00, 0
	map_attributes BirdonPokecenter1F, BIRDON_POKECENTER_1F, $00, 0
	map_attributes BirdonCafe, BIRDON_CAFE, $00, 0
	map_attributes BirdonMart, BIRDON_MART, $00, 0
	map_attributes KurtsHouse, KURTS_HOUSE, $00, 0
	map_attributes WestportGym, WESTPORT_GYM, $00, 0
	map_attributes BoardwalkTeknosGate, BOARDWALK_TEKNOS_GATE, $00, 0
	map_attributes BoardwalkSanskritGate, BOARDWALK_SANSKRIT_GATE, $00, 0
	map_attributes PagotaMart, PAGOTA_MART, $00, 0
	map_attributes PagotaGym, PAGOTA_GYM, $00, 0
	map_attributes PagotaTrainerSchool, PAGOTA_TRAINER_SCHOOL, $00, 0
	map_attributes PagotaNicknameSpeechHouse, PAGOTA_NICKNAME_SPEECH_HOUSE, $00, 0
	map_attributes PagotaPokecenter1F, PAGOTA_POKECENTER_1F, $00, 0
	map_attributes TeknosKylesHouse, TEKNOS_KYLES_HOUSE, $00, 0
	map_attributes Route106Pokecenter1F, ROUTE_106_POKECENTER_1F, $00, 0
	map_attributes Route103WestportGate, ROUTE_103_WESTPORT_GATE, $00, 0
	map_attributes Route112StandCityGate, ROUTE_112_STAND_CITY_GATE, $00, 0
	map_attributes NationalParkStandGate, ROUTE_36_NATIONAL_PARK_GATE, $00, 0
	map_attributes TeknosGym, TEKNOS_GYM, $00, 0
	map_attributes WestportBikeShop, WESTPORT_BIKE_SHOP, $00, 0
	map_attributes WestportHappinessRater, WESTPORT_HAPPINESS_RATER, $00, 0
	map_attributes BillsFamilysHouse, BILLS_FAMILYS_HOUSE, $00, 0
	map_attributes KantoHotel, GOLDENROD_MAGNET_TRAIN_STATION, $00, 0
	map_attributes Route102N64House, ROUTE_102_N64_HOUSE, $00, 0
	map_attributes WestportPPSpeechHouse, WESTPORT_PP_SPEECH_HOUSE, $00, 0
	map_attributes WestportNameRater, WESTPORT_NAME_RATER, $00, 0
	map_attributes WestportDeptStore1F, WESTPORT_DEPT_STORE_1F, $00, 0
	map_attributes WestportDeptStore2F, WESTPORT_DEPT_STORE_2F, $00, 0
	map_attributes WestportDeptStore3F, WESTPORT_DEPT_STORE_3F, $00, 0
	map_attributes WestportDeptStore4F, WESTPORT_DEPT_STORE_4F, $00, 0
	map_attributes WestportDeptStore5F, WESTPORT_DEPT_STORE_5F, $00, 0
	map_attributes WestportDeptStore6F, WESTPORT_DEPT_STORE_6F, $00, 0
	map_attributes WestportDeptStoreElevator, WESTPORT_DEPT_STORE_ELEVATOR, $00, 0
	map_attributes WestportDeptStoreRoof, WESTPORT_DEPT_STORE_ROOF, $24, 0
	map_attributes BoardwalkGameCorner, BOARDWALK_GAME_CORNER, $00, 0
	map_attributes WestpointPokecenter1F, WESTPORT_POKECENTER_1F, $00, 0
	map_attributes Route115KantoGate, ROUTE_115_KANTO_GATE, $00, 0
	map_attributes Route113Route114Gate, ROUTE_113_ROUTE_114_GATE, $00, 0
	map_attributes DayCare, DAY_CARE, $00, 0
	map_attributes AmamiFishingSpeechHouse, AMAMI_FISHING_SPEECH_HOUSE, $00, 0
	map_attributes AmamiPokecenter1F, AMAMI_POKECENTER_1F, $00, 0
	map_attributes NagoCharmanderHouse, NAGO_CHARMANDER_HOUSE, $00, 0
	map_attributes AmamiMart, AMAMI_MART, $00, 0
	map_attributes NagoSpeechHouse, NAGO_SPEECH_HOUSE, $00, 0
	map_attributes AmamiSwimmingPool, AMAMI_SWIMMING_POOL, $00, 0
	map_attributes RyukyuUrasoeGate, RYUKYU_URASOE_GATE, $00, 0
	map_attributes RedsHouse1F, REDS_HOUSE_1F, $00, 0
	map_attributes RedsHouse2F, REDS_HOUSE_2F, $00, 0
	map_attributes BluesHouse, BLUES_HOUSE, $00, 0
	map_attributes OaksLabKanto, OAKS_LAB, $00, 0
	map_attributes YoronPartsShop, YORON_PARTS_SHOP, $00, 0
	map_attributes YoronSocialHouse, YORON_SOCIAL_HOUSE, $00, 0
	map_attributes YoronMart, PEWTER_MART, $00, 0
	map_attributes YoronPokecenter1F, YORON_POKECENTER_1F, $00, 0
	map_attributes YoronSnoozeSpeechHouse, YORON_SNOOZE_SPEECH_HOUSE, $00, 0
	map_attributes WestportPort, WESTPORT_PORT, $0a, 0
	map_attributes AmamiPort, AMAMI_PORT, $0a, 0
	map_attributes FastShip1F, FAST_SHIP_1F, $00, 0
	map_attributes FastShipCabins_NNW_NNE_NE, FAST_SHIP_CABINS_NNW_NNE_NE, $00, 0
	map_attributes FastShipCabins_SW_SSW_NW, FAST_SHIP_CABINS_SW_SSW_NW, $00, 0
	map_attributes FastShipCabins_SE_SSE_CaptainsCabin, FAST_SHIP_CABINS_SE_SSE_CAPTAINS_CABIN, $00, 0
	map_attributes FastShipB1F, FAST_SHIP_B1F, $00, 0
	map_attributes WestportPortPassage, WESTPORT_PORT_PASSAGE, $00, 0
	map_attributes AmamiPortPassage, AMAMI_PORT_PASSAGE, $00, 0
	map_attributes BrassTowerRoof, BRASS_TOWER_ROOF, $00, 0
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
	map_attributes KobanPokecenter1F, KOBAN_POKECENTER_1F, $00, 0
	map_attributes PrycesFamilyHouse, PRYCES_FAMILY_HOUSE, $00, 0
	map_attributes FrostpointNameRater, FROSTPOINT_NAME_RATER, $00, 0
	map_attributes FrostpointMart, FROSTPOINT_MART, $00, 0
	map_attributes SanskritRocketHouse, SANSKRIT_ROCKET_HOUSE, $00, 0
	map_attributes UrasoeParkUrasoeTrailGate, ROUTE_8_SAFFRON_GATE, $00, 0
	map_attributes UrasoeTrailSuperRodHouse, URASOE_TRAIL_SUPER_ROD_HOUSE, $00, 0
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
	map_attributes Route116Gate, ROUTE_116_GATE, $00, 0
	map_attributes VictoryRoadGate, VICTORY_ROAD_GATE, $00, 0
	map_attributes OaksLabEntrance, ELM_ENTRANCE, $00, 0
	map_attributes OaksLab, ELMS_LAB, $00, 0
	map_attributes PlayersHouse1F, PLAYERS_HOUSE_1F, $00, 0
	map_attributes PlayersHouse2F, PLAYERS_HOUSE_2F, $00, 0
	map_attributes SilentHouse, ELMS_HOUSE, $00, 0
	map_attributes Route110SandstormHouse, ROUTE_110_SANDSTORM_HOUSE, $00, 0
	map_attributes Route111BlueForestGate, ROUTE_111_BLUE_FOREST_GATE, $00, 0
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
	map_attributes BirdonEldersHouse, BIRDON_ELDERS_HOUSE, $00, 0
	map_attributes BirdonSpeechHouse, BIRDON_SPEECH_HOUSE, $00, 0
	map_attributes Route104GardenersHouse, ROUTE_104_GARDENERS_HOUSE, $00, 0
	map_attributes Route110PagotaGate, ROUTE_31_VIOLET_GATE, $00, 0
	map_attributes Route102WestportGate, ROUTE_102_WESTPORT_GATE, $00, 0
	map_attributes Route105Route106Gate, ROUTE_105_ROUTE_106_GATE, $00, 0
	map_attributes Route107AlloyGate, ROUTE_107_ALLOY_GATE, $00, 0
	map_attributes Route107AlloyGate2F, ROUTE_107_ALLOY_GATE_2F, $00, 0
	map_attributes Route110PagotaGate2F, ROUTE_31_VIOLET_GATE_2F, $00, 0
	map_attributes Route102WestportGate2F, ROUTE_102_WESTPORT_GATE_2F, $00, 0
	map_attributes TeknosPort, TEKNOS_PORT, $0a, 0
	map_attributes TeknosPortPassage, TEKNOS_PORT_PASSAGE, $00, 0
	map_attributes StandZooInfirmary, STAND_POKE, $00, 0
	map_attributes KantoPokecenter1F, KANTO_POKECENTER_1F, $00, 0
	map_attributes KantoMart, KANTO_MART, $00, 0
	map_attributes KantoBattleClub1F, KANTO_BATTLE_CLUB_1F, $00, 0
	map_attributes KantoBattleClubB1F, KANTO_BATTLE_CLUB_B1F, $00, 0
	map_attributes KantoHouse1, KANTO_HOUSE_1, $00, 0
	map_attributes KantoHouse2, KANTO_HOUSE_2, $00, 0
	map_attributes KantoHouse3, KANTO_HOUSE_3, $00, 0
	map_attributes KantoHouse4, KANTO_HOUSE_4, $00, 0
