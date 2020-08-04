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
	connection east, Route27, ROUTE_27, 4

	map_attributes CherrygroveCity, CHERRYGROVE_CITY, $05, NORTH 
	connection north, MountMoonSquare, MOUNT_MOON_SQUARE, 0
	
	map_attributes MountMoonSquare, MOUNT_MOON_SQUARE, $6D, NORTH | SOUTH
	connection north, Route23, ROUTE_23, 0
	connection south, CherrygroveCity, CHERRYGROVE_CITY, 0

	map_attributes OldCity, OLD_CITY, $05, WEST
	connection west, Route102, ROUTE_36, 5

	map_attributes AzaleaTown, AZALEA_TOWN, $4B, SOUTH | EAST
	connection south, Route35, ROUTE_35, 0
	connection east, Route104, ROUTE_33, 0

	map_attributes CianwoodCity, CIANWOOD_CITY, $34, EAST
	connection east, Route111, ROUTE_41, 0

	map_attributes GoldenrodCity, GOLDENROD_CITY, $35, NORTH | EAST
	connection north, Route35, ROUTE_35, 5
	connection east, Route102, ROUTE_36, 5

	map_attributes OlivineCity, OLIVINE_CITY, $05, WEST | EAST
	connection west, Route31, ROUTE_31, 0
	connection east, Route108, ROUTE_38, 9

	map_attributes EcruteakCity, ECRUTEAK_CITY, $07, NORTH | WEST
	connection north, Route43, ROUTE_43, 8
	connection west, Route120, ROUTE_8, 0

	map_attributes MahoganyTown, MAHOGANY_TOWN, $07, NORTH | SOUTH | WEST | EAST
	connection north, RuinsOfAlphOutside, RUINS_OF_ALPH_OUTSIDE, 0
	connection south, Route43, ROUTE_43, -3
	connection west, Route118, ROUTE_4, 0
	connection east, Route117, ROUTE_3, 0
	
	map_attributes RuinsOfAlphOutside, RUINS_OF_ALPH_OUTSIDE, $07, SOUTH
	connection south, MahoganyTown, MAHOGANY_TOWN, 0

	map_attributes BlackthornCity, BLACKTHORN_CITY, $3C, NORTH | SOUTH | WEST
	connection north, Route111, ROUTE_41, 5
	connection south, Route112, ROUTE_32, 5
	connection west, Route110, ROUTE_40, 9

	map_attributes Route27, ROUTE_27, $35, WEST | EAST
	connection west, SilentTown, SILENT_TOWN, -4

	map_attributes Route101, ROUTE_29, $05, EAST
	connection east, SilentTown, SILENT_TOWN, 6

	map_attributes Route105, ROUTE_30, $33, SOUTH | WEST
	connection south, Route31, ROUTE_31, 0
	connection west, Route104, ROUTE_33, 0

	map_attributes Route31, ROUTE_31, $05, EAST
	connection east, OlivineCity, OLIVINE_CITY, 0

	map_attributes Route112, ROUTE_32, $3C, NORTH
	connection north, BlackthornCity, BLACKTHORN_CITY, -5

	map_attributes Route104, ROUTE_33, $4B, WEST | EAST
	connection west, AzaleaTown, AZALEA_TOWN, 0
	connection east, Route105, ROUTE_30, 0

	map_attributes Route113, ROUTE_34, $05, NORTH
	connection north, StandCity, FUCHSIA_CITY, -10

	map_attributes Route35, ROUTE_35, $4B, NORTH | SOUTH
	connection north, AzaleaTown, AZALEA_TOWN, 0
	connection south, GoldenrodCity, GOLDENROD_CITY, -5

	map_attributes Route102, ROUTE_36, $05, WEST | EAST
	connection west, GoldenrodCity, GOLDENROD_CITY, -5
	connection east, OldCity, OLD_CITY, -5

	map_attributes SilentHills, ROUTE_37, $05, 0

	map_attributes Route108, ROUTE_38, $78, WEST | EAST
	connection west, OlivineCity, OLIVINE_CITY, -9
	connection east, Route39, ROUTE_39, -36

	map_attributes Route39, ROUTE_39, $78, WEST
	connection west, Route108, ROUTE_38, 36

	map_attributes Route110, ROUTE_40, $3C, EAST
	connection east, BlackthornCity, BLACKTHORN_CITY, -9

	map_attributes Route111, ROUTE_41, $35, NORTH | SOUTH
	connection north, FrostPoint, CINNABAR_ISLAND, 0
	connection south, BlackthornCity, BLACKTHORN_CITY, -5

	map_attributes Route43, ROUTE_43, $07, NORTH | SOUTH
	connection north, MahoganyTown, MAHOGANY_TOWN, 3
	connection south, EcruteakCity, ECRUTEAK_CITY, -8

	map_attributes PewterCity, PEWTER_CITY, $35, EAST
	connection east, Route24, ROUTE_24, 9

	map_attributes Route116, ROUTE_2, $65, WEST
	connection west, Route117, ROUTE_3, 0

	map_attributes KobanIsland, PALLET_TOWN, $07, SOUTH
	connection south, Route21, ROUTE_21, 0

	map_attributes Route21, ROUTE_21, $07, NORTH
	connection north, KobanIsland, PALLET_TOWN, 0

	map_attributes FrostPoint, CINNABAR_ISLAND, $3C, SOUTH
	connection south, Route111, ROUTE_41, 0

	map_attributes Route20, ROUTE_20, $35, WEST
	connection west, CeruleanCity, CERULEAN_CITY, 0

	map_attributes Route19, ROUTE_19, $35, WEST | EAST
	connection west, Route24, ROUTE_24, 0
	connection east, Route12, ROUTE_12, -9

	map_attributes StandCity, FUCHSIA_CITY, $05, SOUTH
	connection south, Route113, ROUTE_34, 10

	map_attributes Route18, ROUTE_18, $43, WEST | EAST
	connection west, Route17, ROUTE_17, -38
	connection east, StandCity, FUCHSIA_CITY, -7

	map_attributes Route17, ROUTE_17, $43, NORTH | EAST
	connection north, Route16, ROUTE_16, 0
	connection east, Route18, ROUTE_18, 38

	map_attributes Route16, ROUTE_16, $05, 0

	map_attributes KantoCity, CELADON_CITY, $0f, EAST
	connection east, Route9, ROUTE_9, 9

	map_attributes Route7, ROUTE_7, $07, EAST
	connection east, Route120, ROUTE_8, 18

	map_attributes Route12, ROUTE_12, $35, WEST
	connection west, Route19, ROUTE_19, 9

	map_attributes VermilionCity, VERMILION_CITY, $07, SOUTH
	connection south, Route10North, ROUTE_10_NORTH, 0

	map_attributes SaffronCity, SAFFRON_CITY, $5d, SOUTH
	connection south, Route10South, ROUTE_10_SOUTH, 0

	map_attributes Route5, ROUTE_5, $0A, 0

	map_attributes CeruleanCity, CERULEAN_CITY, $35, SOUTH | EAST
	connection south, Route25, ROUTE_25, 0
	connection east, Route20, ROUTE_20, 0

	map_attributes Route9, ROUTE_9, $0f, WEST
	connection west, KantoCity, CELADON_CITY, -9

	map_attributes Route24, ROUTE_24, $35, WEST | EAST
	connection west, PewterCity, PEWTER_CITY, -9
	connection east, Route19, ROUTE_19, 0

	map_attributes Route25, ROUTE_25, $35, NORTH | EAST
	connection north, CeruleanCity, CERULEAN_CITY, 0
	connection east, EastwardSummit, EASTWARD_SUMMIT, 9

	map_attributes Route117, ROUTE_3, $65, WEST | EAST
	connection west, MahoganyTown, MAHOGANY_TOWN, 0
	connection east, Route116, ROUTE_2, 0

	map_attributes Route118, ROUTE_4, $07, EAST
	connection east, MahoganyTown, MAHOGANY_TOWN, 0

	map_attributes Route120, ROUTE_8, $07, WEST | EAST
	connection west, Route7, ROUTE_7, -18
	connection east, EcruteakCity, ECRUTEAK_CITY, 0

	map_attributes Route10North, ROUTE_10_NORTH, $07, NORTH
	connection north, VermilionCity, VERMILION_CITY, 0

	map_attributes Route10South, ROUTE_10_SOUTH, $5d, NORTH
	connection north, SaffronCity, SAFFRON_CITY, 0

	map_attributes Route23, ROUTE_23, $05, SOUTH
	connection south, MountMoonSquare, MOUNT_MOON_SQUARE, 0
	
	map_attributes EastwardSummit, EASTWARD_SUMMIT, $35, WEST
	connection west, Route25, ROUTE_25, -9

	map_attributes SproutTower1F, SPROUT_TOWER_1F, $00, 0
	map_attributes SproutTower2F, SPROUT_TOWER_2F, $00, 0
	map_attributes SproutTower3F, SPROUT_TOWER_3F, $00, 0
	map_attributes TinTower1F, TIN_TOWER_1F, $00, 0
	map_attributes TinTower2F, TIN_TOWER_2F, $00, 0
	map_attributes TinTower3F, TIN_TOWER_3F, $00, 0
	map_attributes TinTower4F, TIN_TOWER_4F, $00, 0
	map_attributes TinTower5F, TIN_TOWER_5F, $00, 0
	map_attributes TinTower6F, TIN_TOWER_6F, $00, 0
	map_attributes TinTower7F, TIN_TOWER_7F, $00, 0
	map_attributes TinTower8F, TIN_TOWER_8F, $00, 0
	map_attributes TinTower9F, TIN_TOWER_9F, $00, 0
	map_attributes BurnedTower1F, BURNED_TOWER_1F, $00, 0
	map_attributes BurnedTowerB1F, BURNED_TOWER_B1F, $09, 0
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
	map_attributes UnionCave1F, UNION_CAVE_1F, $09, 0
	map_attributes UnionCaveB1F, UNION_CAVE_B1F, $09, 0
	map_attributes UnionCaveB2F, UNION_CAVE_B2F, $09, 0
	map_attributes SlowpokeWellB1F, SLOWPOKE_WELL_B1F, $09, 0
	map_attributes SlowpokeWellB2F, SLOWPOKE_WELL_B2F, $09, 0
	map_attributes OlivineLighthouse1F, OLIVINE_LIGHTHOUSE_1F, $00, 0
	map_attributes OlivineLighthouse2F, OLIVINE_LIGHTHOUSE_2F, $00, 0
	map_attributes OlivineLighthouse3F, OLIVINE_LIGHTHOUSE_3F, $09, 0
	map_attributes MahoganyMart1F, MAHOGANY_MART_1F, $00, 0
	map_attributes SugarMart, SUGAR_MART, $00, 0
	map_attributes KobanClairsHouse, SUGAR_HOUSE_1, $00, 0
	map_attributes SugarHouse2, SUGAR_HOUSE_2, $00, 0
	map_attributes BlueForestNightmareHouse, BLUEFOREST_HOUSE_1, $00, 0
	map_attributes TeamRocketBaseB1F, TEAM_ROCKET_BASE_B1F, $00, 0
	map_attributes TeamRocketBaseB2F, TEAM_ROCKET_BASE_B2F, $00, 0
	map_attributes TeamRocketBaseB3F, TEAM_ROCKET_BASE_B3F, $00, 0
	map_attributes IlexForest, ILEX_FOREST, $05, 0
	map_attributes GoldenrodUnderground, GOLDENROD_UNDERGROUND, $00, 0
	map_attributes GoldenrodUndergroundSwitchRoomEntrances, GOLDENROD_UNDERGROUND_SWITCH_ROOM_ENTRANCES, $00, 0
	map_attributes GoldenrodDeptStoreB1F, GOLDENROD_DEPT_STORE_B1F, $00, 0
	map_attributes GoldenrodUndergroundWarehouse, GOLDENROD_UNDERGROUND_WAREHOUSE, $00, 0
	map_attributes MountMortar1FOutside, MOUNT_MORTAR_1F_OUTSIDE, $09, 0
	map_attributes MountMortarZapdosRoom, MOUNT_MORTAR_ZAPDOS_ROOM, $09, 0
	map_attributes MountMortar1FInside, MOUNT_MORTAR_1F_INSIDE, $09, 0
	map_attributes MountMortar2FInside, MOUNT_MORTAR_2F_INSIDE, $09, 0
	map_attributes MountMortarB1F, MOUNT_MORTAR_B1F, $09, 0
	map_attributes IcePath1F, ICE_PATH_1F, $09, 0
	map_attributes IcePathB1F, ICE_PATH_B1F, $59, 0
	map_attributes IcePathB2FMahoganySide, ICE_PATH_B2F_MAHOGANY_SIDE, $59, 0
	map_attributes IcePathB2FBlackthornSide, ICE_PATH_B2F_BLACKTHORN_SIDE, $59, 0
	map_attributes IcePathB3F, ICE_PATH_B3F, $09, 0
	map_attributes IcePathNew, ICE_PATH_NEW, $09, 0
	map_attributes WhirlIslandNW, WHIRL_ISLAND_NW, $09, 0
	map_attributes WhirlIslandNE, WHIRL_ISLAND_NE, $09, 0
	map_attributes WhirlIslandSW, WHIRL_ISLAND_SW, $09, 0
	map_attributes WhirlIslandCave, WHIRL_ISLAND_CAVE, $09, 0
	map_attributes WhirlIslandSE, WHIRL_ISLAND_SE, $09, 0
	map_attributes WhirlIslandB1F, WHIRL_ISLAND_B1F, $09, 0
	map_attributes WhirlIslandB2F, WHIRL_ISLAND_B2F, $09, 0
	map_attributes WhirlIslandBlisseyChamber, WHIRL_ISLAND_BLISSEY_CHAMBER, $0f, 0
	map_attributes DarkCaveVioletEntrance, DARK_CAVE_VIOLET_ENTRANCE, $1D, 0
	map_attributes DarkCaveBlackthornEntrance, DARK_CAVE_BLACKTHORN_ENTRANCE, $09, 0
	map_attributes DragonsDen1F, DRAGONS_DEN_1F, $09, 0
	map_attributes DragonsDenB1F, DRAGONS_DEN_B1F, $09, 0
	map_attributes DragonShrine, DRAGON_SHRINE, $00, 0
	map_attributes TohjoFalls, TOHJO_FALLS, $09, 0
	map_attributes OlivinePokecenter1F, OLIVINE_POKECENTER_1F, $00, 0
	map_attributes OlivineGym, OLIVINE_GYM, $00, 0
	map_attributes AlloyTimsHouse, OLIVINE_TIMS_HOUSE, $00, 0
	map_attributes OlivineHouseBeta, OLIVINE_HOUSE_BETA, $00, 0
	map_attributes AlloyPunishmentSpeechHouse, OLIVINE_PUNISHMENT_SPEECH_HOUSE, $00, 0
	map_attributes AlloyGoodRodHouse, OLIVINE_GOOD_ROD_HOUSE, $00, 0
	map_attributes OlivineCafe, OLIVINE_CAFE, $00, 0
	map_attributes OlivineMart, OLIVINE_MART, $00, 0
	map_attributes Route109Route110Gate, ROUTE_38_ECRUTEAK_GATE, $00, 0
	map_attributes Route39Barn, ROUTE_39_BARN, $00, 0
	map_attributes SanskritCoinCaseSpeechHouse, MAHOGANY_RED_GYARADOS_SPEECH_HOUSE, $00, 0
	map_attributes MahoganyGym, MAHOGANY_GYM, $00, 0
	map_attributes MahoganyPokecenter1F, MAHOGANY_POKECENTER_1F, $00, 0
	map_attributes DiglettsCave, DIGLETTS_CAVE, $09, 0
	map_attributes MountMoon, MOUNT_MOON, $09, 0
	map_attributes UndergroundPath, UNDERGROUND_PATH, $09, 0
	map_attributes RockTunnel1F, ROCK_TUNNEL_1F, $09, 0
	map_attributes RockTunnelB1F, ROCK_TUNNEL_B1F, $09, 0
	map_attributes SafariZoneBeta, SAFARI_ZONE_BETA, $00, 0
	map_attributes VictoryRoad, VICTORY_ROAD, $09, 0
	map_attributes VictoryRoad2F, VICTORY_ROAD_2F, $09, 0
	map_attributes EcruteakTinTowerEntrance, ECRUTEAK_TIN_TOWER_ENTRANCE, $00, 0
	map_attributes WiseTriosRoom, WISE_TRIOS_ROOM, $00, 0
	map_attributes EcruteakPokecenter1F, ECRUTEAK_POKECENTER_1F, $00, 0
	map_attributes EcruteakBlisseySpeechHouse, ECRUTEAK_BLISSEY_SPEECH_HOUSE, $00, 0
	map_attributes DanceTheatre, DANCE_THEATRE, $00, 0
	map_attributes EcruteakMart, ECRUTEAK_MART, $00, 0
	map_attributes EcruteakGym, ECRUTEAK_GYM, $00, 0
	map_attributes WestportElderItemfinderHouse, ECRUTEAK_ITEMFINDER_HOUSE, $00, 0
	map_attributes BlackthornGym1F, BLACKTHORN_GYM_1F, $00, 0
	map_attributes BlackthornGym2F, BLACKTHORN_GYM_2F, $00, 0
	map_attributes BlackthornDragonSpeechHouse, BLACKTHORN_DRAGON_SPEECH_HOUSE, $00, 0
	map_attributes BlueForestEmysHouse, BLACKTHORN_EMYS_HOUSE, $00, 0
	map_attributes BlackthornMart, BLACKTHORN_MART, $00, 0
	map_attributes BlackthornPokecenter1F, BLACKTHORN_POKECENTER_1F, $00, 0
	map_attributes MoveDeletersHouse, MOVE_DELETERS_HOUSE, $00, 0
	map_attributes CinnabarPokecenter1F, CINNABAR_POKECENTER_1F, $00, 0
	map_attributes Route19FuchsiaGate, ROUTE_19_FUCHSIA_GATE, $00, 0
	map_attributes SeafoamGym, SEAFOAM_GYM, $09, 0
	map_attributes CeruleanPoliceStation, CERULEAN_POLICE_STATION, $00, 0
	map_attributes CeruleanPokecenter1F, CERULEAN_POKECENTER_1F, $00, 0
	map_attributes CeruleanGym, CERULEAN_GYM, $05, 0
	map_attributes CeruleanMart, CERULEAN_MART, $00, 0
	map_attributes Route10Pokecenter1F, ROUTE_10_POKECENTER_1F, $00, 0
	map_attributes PowerPlant, POWER_PLANT, $00, 0
	map_attributes BillsHouse, BILLS_HOUSE, $00, 0
	map_attributes AzaleaPokecenter1F, AZALEA_POKECENTER_1F, $00, 0
	map_attributes CharcoalKiln, CHARCOAL_KILN, $00, 0
	map_attributes AzaleaMart, AZALEA_MART, $00, 0
	map_attributes KurtsHouse, KURTS_HOUSE, $00, 0
	map_attributes AzaleaGym, AZALEA_GYM, $00, 0
	map_attributes Route43MahoganyGate, ROUTE_43_MAHOGANY_GATE, $00, 0
	map_attributes Route43Gate, ROUTE_43_GATE, $00, 0
	map_attributes VioletMart, VIOLET_MART, $00, 0
	map_attributes VioletGym, VIOLET_GYM, $00, 0
	map_attributes EarlsPokemonAcademy, EARLS_POKEMON_ACADEMY, $00, 0
	map_attributes VioletNicknameSpeechHouse, VIOLET_NICKNAME_SPEECH_HOUSE, $00, 0
	map_attributes VioletPokecenter1F, VIOLET_POKECENTER_1F, $00, 0
	map_attributes VioletKylesHouse, VIOLET_KYLES_HOUSE, $00, 0
	map_attributes Route32RuinsOfAlphGate, ROUTE_32_RUINS_OF_ALPH_GATE, $00, 0
	map_attributes Route32Pokecenter1F, ROUTE_32_POKECENTER_1F, $00, 0
	map_attributes Route103WestportGate, ROUTE_35_GOLDENROD_GATE, $00, 0
	map_attributes Route112StandCityGate, ROUTE_36_RUINS_OF_ALPH_GATE, $00, 0
	map_attributes Route36NationalParkGate, ROUTE_36_NATIONAL_PARK_GATE, $00, 0
	map_attributes GoldenrodGym, GOLDENROD_GYM, $00, 0
	map_attributes GoldenrodBikeShop, GOLDENROD_BIKE_SHOP, $00, 0
	map_attributes GoldenrodHappinessRater, GOLDENROD_HAPPINESS_RATER, $00, 0
	map_attributes BillsFamilysHouse, BILLS_FAMILYS_HOUSE, $00, 0
	map_attributes GoldenrodMagnetTrainStation, GOLDENROD_MAGNET_TRAIN_STATION, $00, 0
	map_attributes GoldenrodFlowerShop, GOLDENROD_FLOWER_SHOP, $00, 0
	map_attributes GoldenrodPPSpeechHouse, GOLDENROD_PP_SPEECH_HOUSE, $00, 0
	map_attributes WestportNameRater, GOLDENROD_NAME_RATER, $00, 0
	map_attributes GoldenrodDeptStore1F, GOLDENROD_DEPT_STORE_1F, $00, 0
	map_attributes GoldenrodDeptStore2F, GOLDENROD_DEPT_STORE_2F, $00, 0
	map_attributes GoldenrodDeptStore3F, GOLDENROD_DEPT_STORE_3F, $00, 0
	map_attributes GoldenrodDeptStore4F, GOLDENROD_DEPT_STORE_4F, $00, 0
	map_attributes GoldenrodDeptStore5F, GOLDENROD_DEPT_STORE_5F, $00, 0
	map_attributes GoldenrodDeptStore6F, GOLDENROD_DEPT_STORE_6F, $00, 0
	map_attributes GoldenrodDeptStoreElevator, GOLDENROD_DEPT_STORE_ELEVATOR, $00, 0
	map_attributes GoldenrodDeptStoreRoof, GOLDENROD_DEPT_STORE_ROOF, $24, 0
	map_attributes GoldenrodGameCorner, GOLDENROD_GAME_CORNER, $00, 0
	map_attributes GoldenrodPokecenter1F, GOLDENROD_POKECENTER_1F, $00, 0
	map_attributes IlexForestAzaleaGate, ILEX_FOREST_AZALEA_GATE, $00, 0
	map_attributes Route113Route114Gate, ROUTE_34_ILEX_FOREST_GATE, $00, 0
	map_attributes DayCare, DAY_CARE, $00, 0
	map_attributes VermilionFishingSpeechHouse, VERMILION_FISHING_SPEECH_HOUSE, $00, 0
	map_attributes VermilionPokecenter1F, VERMILION_POKECENTER_1F, $00, 0
	map_attributes PokemonFanClub, POKEMON_FAN_CLUB, $00, 0
	map_attributes VermilionMagnetTrainSpeechHouse, VERMILION_MAGNET_TRAIN_SPEECH_HOUSE, $00, 0
	map_attributes VermilionMart, VERMILION_MART, $00, 0
	map_attributes VermilionDiglettsCaveSpeechHouse, VERMILION_DIGLETTS_CAVE_SPEECH_HOUSE, $00, 0
	map_attributes VermilionGym, VERMILION_GYM, $00, 0
	map_attributes Route6SaffronGate, ROUTE_6_SAFFRON_GATE, $00, 0
	map_attributes RedsHouse1F, REDS_HOUSE_1F, $00, 0
	map_attributes RedsHouse2F, REDS_HOUSE_2F, $00, 0
	map_attributes BluesHouse, BLUES_HOUSE, $00, 0
	map_attributes OaksLab, OAKS_LAB, $00, 0
	map_attributes PewterNidoranSpeechHouse, PEWTER_NIDORAN_SPEECH_HOUSE, $00, 0
	map_attributes PewterGym, PEWTER_GYM, $00, 0
	map_attributes PewterMart, PEWTER_MART, $00, 0
	map_attributes PewterPokecenter1F, PEWTER_POKECENTER_1F, $00, 0
	map_attributes PewterSnoozeSpeechHouse, PEWTER_SNOOZE_SPEECH_HOUSE, $00, 0
	map_attributes OlivinePort, OLIVINE_PORT, $0a, 0
	map_attributes VermilionPort, VERMILION_PORT, $0a, 0
	map_attributes FastShip1F, FAST_SHIP_1F, $00, 0
	map_attributes FastShipCabins_NNW_NNE_NE, FAST_SHIP_CABINS_NNW_NNE_NE, $00, 0
	map_attributes FastShipCabins_SW_SSW_NW, FAST_SHIP_CABINS_SW_SSW_NW, $00, 0
	map_attributes FastShipCabins_SE_SSE_CaptainsCabin, FAST_SHIP_CABINS_SE_SSE_CAPTAINS_CABIN, $00, 0
	map_attributes FastShipB1F, FAST_SHIP_B1F, $00, 0
	map_attributes OlivinePortPassage, OLIVINE_PORT_PASSAGE, $00, 0
	map_attributes VermilionPortPassage, VERMILION_PORT_PASSAGE, $00, 0
	map_attributes MountMoonGiftShop, MOUNT_MOON_GIFT_SHOP, $00, 0
	map_attributes TinTowerRoof, TIN_TOWER_ROOF, $00, 0
	map_attributes IndigoPlateauPokecenter1F, INDIGO_PLATEAU_POKECENTER_1F, $00, 0
	map_attributes WillsRoom, WILLS_ROOM, $00, 0
	map_attributes KogasRoom, KOGAS_ROOM, $00, 0
	map_attributes BrunosRoom, BRUNOS_ROOM, $00, 0
	map_attributes KarensRoom, KARENS_ROOM, $00, 0
	map_attributes LancesRoom, LANCES_ROOM, $00, 0
	map_attributes HallOfFame, HALL_OF_FAME, $00, 0
	map_attributes FuchsiaMart, FUCHSIA_MART, $00, 0
	map_attributes SafariZoneMainOffice, SAFARI_ZONE_MAIN_OFFICE, $00, 0
	map_attributes FuchsiaGym, FUCHSIA_GYM, $00, 0
	map_attributes BillsBrothersHouse, BILLS_BROTHERS_HOUSE, $00, 0
	map_attributes FuchsiaPokecenter1F, FUCHSIA_POKECENTER_1F, $00, 0
	map_attributes SafariZoneWardensHome, SAFARI_ZONE_WARDENS_HOME, $00, 0
	map_attributes SafariZoneWardensHome2F, SAFARI_ZONE_WARDENS_HOME_2F, $00, 0
	map_attributes Route119SunpointGate, ROUTE_15_FUCHSIA_GATE, $00, 0
	map_attributes LavenderPokecenter1F, LAVENDER_POKECENTER_1F, $00, 0
	map_attributes PrycesFamilyHouse, LAVENDER_SPEECH_HOUSE, $00, 0
	map_attributes FrostpointNameRater, LAVENDER_NAME_RATER, $00, 0
	map_attributes FrostpointMart, LAVENDER_MART, $00, 0
	map_attributes LavRadioTower1F, LAV_RADIO_TOWER_1F, $00, 0
	map_attributes Route8SaffronGate, ROUTE_8_SAFFRON_GATE, $00, 0
	map_attributes Route12SuperRodHouse, ROUTE_12_SUPER_ROD_HOUSE, $00, 0
	map_attributes Pokecenter2F, POKECENTER_2F, $00, 0
	map_attributes TradeCenter, TRADE_CENTER, $00, 0
	map_attributes Colosseum, COLOSSEUM, $00, 0
	map_attributes TimeCapsule, TIME_CAPSULE, $00, 0
	map_attributes MobileTradeRoom, MOBILE_TRADE_ROOM, $00, 0
	map_attributes MobileBattleRoom, MOBILE_BATTLE_ROOM, $00, 0
	map_attributes CeladonDeptStore1F, CELADON_DEPT_STORE_1F, $00, 0
	map_attributes CeladonDeptStore2F, CELADON_DEPT_STORE_2F, $00, 0
	map_attributes CeladonDeptStore3F, CELADON_DEPT_STORE_3F, $00, 0
	map_attributes CeladonDeptStore4F, CELADON_DEPT_STORE_4F, $00, 0
	map_attributes CeladonDeptStore5F, CELADON_DEPT_STORE_5F, $00, 0
	map_attributes CeladonDeptStore6F, CELADON_DEPT_STORE_6F, $00, 0
	map_attributes CeladonDeptStoreElevator, CELADON_DEPT_STORE_ELEVATOR, $00, 0
	map_attributes CeladonMansion1F, CELADON_MANSION_1F, $00, 0
	map_attributes CeladonMansion2F, CELADON_MANSION_2F, $00, 0
	map_attributes CeladonMansion3F, CELADON_MANSION_3F, $00, 0
	map_attributes CeladonMansionRoof, CELADON_MANSION_ROOF, $00, 0
	map_attributes CeladonMansionRoofHouse, CELADON_MANSION_ROOF_HOUSE, $00, 0
	map_attributes CeladonPokecenter1F, CELADON_POKECENTER_1F, $00, 0
	map_attributes CeladonGameCorner, CELADON_GAME_CORNER, $00, 0
	map_attributes CeladonGameCornerPrizeRoom, CELADON_GAME_CORNER_PRIZE_ROOM, $00, 0
	map_attributes CeladonGym, CELADON_GYM, $00, 0
	map_attributes CeladonCafe, CELADON_CAFE, $00, 0
	map_attributes Route16FuchsiaSpeechHouse, ROUTE_16_FUCHSIA_SPEECH_HOUSE, $00, 0
	map_attributes Route16Gate, ROUTE_16_GATE, $00, 0
	map_attributes Route7SaffronGate, ROUTE_7_SAFFRON_GATE, $00, 0
	map_attributes Route17Route18Gate, ROUTE_17_ROUTE_18_GATE, $00, 0
	map_attributes CianwoodGym, CIANWOOD_GYM, $00, 0
	map_attributes CianwoodPokecenter1F, CIANWOOD_POKECENTER_1F, $00, 0
	map_attributes CianwoodPharmacy, CIANWOOD_PHARMACY, $00, 0
	map_attributes SunpointPhotoStudio, CIANWOOD_PHOTO_STUDIO, $00, 0
	map_attributes CianwoodBlisseySpeechHouse, CIANWOOD_BLISSEY_SPEECH_HOUSE, $00, 0
	map_attributes PokeSeersHouse, POKE_SEERS_HOUSE, $00, 0
	map_attributes BattleTower1F, BATTLE_TOWER_1F, $00, 0
	map_attributes BattleTowerBattleRoom, BATTLE_TOWER_BATTLE_ROOM, $00, 0
	map_attributes BattleTowerElevator, BATTLE_TOWER_ELEVATOR, $00, 0
	map_attributes BattleTowerHallway, BATTLE_TOWER_HALLWAY, $00, 0
	map_attributes BattleTowerOutside, BATTLE_TOWER_OUTSIDE, $05, 0
	map_attributes ViridianGym, VIRIDIAN_GYM, $00, 0
	map_attributes ViridianMart, VIRIDIAN_MART, $00, 0
	map_attributes ViridianPokecenter1F, VIRIDIAN_POKECENTER_1F, $00, 0
	map_attributes Route116Gate, ROUTE_2_GATE, $00, 0
	map_attributes VictoryRoadGate, VICTORY_ROAD_GATE, $00, 0
	map_attributes ElmEntrance, ELM_ENTRANCE, $00, 0
	map_attributes ElmsLab, ELMS_LAB, $00, 0
	map_attributes PlayersHouse1F, PLAYERS_HOUSE_1F, $00, 0
	map_attributes PlayersHouse2F, PLAYERS_HOUSE_2F, $00, 0
	map_attributes SilentHouse, ELMS_HOUSE, $00, 0
	map_attributes Route110SandstormHouse, ROUTE_27_SANDSTORM_HOUSE, $00, 0
	map_attributes Route111BlueForestGate, ROUTE_29_ROUTE_46_GATE, $00, 0
	map_attributes FightingDojo, FIGHTING_DOJO, $00, 0
	map_attributes SaffronGym, SAFFRON_GYM, $00, 0
	map_attributes SaffronMart, SAFFRON_MART, $00, 0
	map_attributes SaffronPokecenter1F, SAFFRON_POKECENTER_1F, $00, 0
	map_attributes MrPsychicsHouse, MR_PSYCHICS_HOUSE, $00, 0
	map_attributes SaffronMagnetTrainStation, SAFFRON_MAGNET_TRAIN_STATION, $00, 0
	map_attributes SilphCo1F, SILPH_CO_1F, $00, 0
	map_attributes CopycatsHouse1F, COPYCATS_HOUSE_1F, $00, 0
	map_attributes CopycatsHouse2F, COPYCATS_HOUSE_2F, $00, 0
	map_attributes Route5UndergroundPathEntrance, ROUTE_5_UNDERGROUND_PATH_ENTRANCE, $00, 0
	map_attributes SunPointDocksSunPointGate, ROUTE_5_SAFFRON_GATE, $00, 0
	map_attributes CherrygroveMart, CHERRYGROVE_MART, $00, 0
	map_attributes CherrygrovePokecenter1F, CHERRYGROVE_POKECENTER_1F, $00, 0
	map_attributes CherrygroveGymSpeechHouse, CHERRYGROVE_GYM_SPEECH_HOUSE, $00, 0
	map_attributes BirdonSpeechHouse, CHERRYGROVE_EVOLUTION_SPEECH_HOUSE, $00, 0
	map_attributes Route104GardenersHouse, ROUTE_30_BERRY_HOUSE, $00, 0
	map_attributes MrPokemonsHouse, MR_POKEMONS_HOUSE, $00, 0
	map_attributes Route110PagotaGate, ROUTE_31_VIOLET_GATE, $00, 0
	map_attributes Route102WestPortGate, NEW_VIOLET_GATE_NORTH, $00, 0
	map_attributes Route105Route106Gate, NEW_ECRUTEAK_GATE_SOUTH, $00, 0
	map_attributes Route107AlloyGate, NEW_OLIVINE_GATE_WEST, $00, 0
	map_attributes Route107AlloyGate2F, NEW_OLIVINE_GATE_WEST_2F, $00, 0
	map_attributes Route110PagotaGate2F, ROUTE_31_VIOLET_GATE_2F, $00, 0
	map_attributes Route102WestPortGate2F, NEW_VIOLET_GATE_NORTH_2F, $00, 0
	map_attributes TekuPort, TEKU_PORT, $0a, 0
	map_attributes TekuPortPassage, TEKU_PORT_PASSAGE, $00, 0
	map_attributes StandPoke, STAND_POKE, $00, 0
	map_attributes KantoPokecenter1F, KANTO_POKECENTER_1F, $00, 0
	map_attributes KantoMart, KANTO_MART, $00, 0
	map_attributes KantoBattleClub1F, KANTO_BATTLE_CLUB_1F, $00, 0
	map_attributes KantoBattleClubB1F, KANTO_BATTLE_CLUB_B1F, $00, 0
	map_attributes KantoHouse1, KANTO_HOUSE_1, $00, 0
	map_attributes KantoHouse2, KANTO_HOUSE_2, $00, 0
	map_attributes KantoHouse3, KANTO_HOUSE_3, $00, 0
	map_attributes KantoHouse4, KANTO_HOUSE_4, $00, 0
