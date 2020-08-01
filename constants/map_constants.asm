newgroup: MACRO
const_value = const_value + 1
	enum_start 1
ENDM

map_const: MACRO
;\1: map id
;\2: width: in blocks
;\3: height: in blocks
GROUP_\1 EQU const_value
	enum MAP_\1
\1_WIDTH EQU \2
\1_HEIGHT EQU \3
ENDM

; map group ids
; `newgroup` indexes are for:
; - MapGroupPointers (see data/maps/maps.asm)
; - MapGroupRoofs (see data/maps/roofs.asm)
; - OutdoorSprites (see data/maps/outdoor_sprites.asm)
; - RoofPals (see gfx/tilesets/roofs.pal)
; `map_const` indexes are for the sub-tables of MapGroupPointers (see data/maps/maps.asm)
; Each map also has associated data:
; - attributes (see data/maps/attributes.asm)
; - blocks (see data/maps/blocks.asm)
; - scripts and events (see data/maps/scripts.asm)
	const_def

	newgroup                                                      ;  1

	map_const OLIVINE_POKECENTER_1F,                        8,  4 ;  1
	map_const OLIVINE_GYM,                                 10,  8 ;  2
	map_const OLIVINE_TIMS_HOUSE,                           5,  4 ;  3
	map_const OLIVINE_HOUSE_BETA,                           5,  4 ;  4
	map_const OLIVINE_PUNISHMENT_SPEECH_HOUSE,              5,  4 ;  5
	map_const OLIVINE_GOOD_ROD_HOUSE,                       5,  4 ;  6
	map_const OLIVINE_CAFE,                                 4,  4 ;  7
	map_const OLIVINE_MART,                                 8,  4 ;  8
	map_const ROUTE_38_ECRUTEAK_GATE,                       5,  4 ;  9
	map_const ROUTE_39_BARN,                                4,  4 ; 10
	map_const ROUTE_39_FARMHOUSE,                           4,  4 ; 11
	map_const ROUTE_38,                                    15,  9 ; 12
	map_const ROUTE_39,                                    10, 45 ; 13
	map_const OLIVINE_CITY,                                20, 18 ; 14
	map_const NEW_OLIVINE_GATE_WEST,						5,  4 ; 15
	map_const NEW_OLIVINE_GATE_WEST_2F,						4,  3 ; 15
	map_const ROUTE_31,                                    30,  9 ;  2
	map_const ROUTE_32_POKECENTER_1F,                       8,  4 ; 13
	map_const DAY_CARE,                                     5,  4 ; 24
	map_const FIGHTING_DOJO,                                5,  6 ;  3
	map_const ROUTE_10_POKECENTER_1F,                       8,  4 ;  8

	newgroup                                                      ;  2

	map_const MAHOGANY_RED_GYARADOS_SPEECH_HOUSE,           5,  4 ;  1
	map_const MAHOGANY_POKECENTER_1F,                       8,  4 ;  3
	map_const ROUTE_44,                                    30,  9 ;  6
	map_const MAHOGANY_TOWN,                               10,  9 ;  7
	map_const ROUTE_2,                                     10, 18 ;  1
	map_const ROUTE_3,                                     30,  9 ;  1
	map_const RUINS_OF_ALPH_OUTSIDE,                       10, 18 ; 22
	map_const ROUTE_43,                                    10, 27 ;  5
	map_const ROUTE_4,                                     35,  9 ; 12
	map_const ROUTE_7_SAFFRON_GATE,                         5,  4 ; 25
	map_const RUINS_OF_ALPH_RESEARCH_CENTER,                4,  4 ; 28
	map_const LAV_RADIO_TOWER_1F,                          10,  4 ; 12
	map_const VIRIDIAN_MART,                                8,  4 ;  8
	map_const GOLDENROD_GAME_CORNER,                       10,  7 ; 19

	newgroup                                                      ;  3

	map_const SPROUT_TOWER_1F,                              6,  6 ;  1
	map_const SPROUT_TOWER_2F,                              6,  6 ;  2
	map_const SPROUT_TOWER_3F,                              6,  6 ;  3
	map_const TIN_TOWER_1F,                                10,  9 ;  4
	map_const TIN_TOWER_2F,                                10,  9 ;  5
	map_const TIN_TOWER_3F,                                10,  9 ;  6
	map_const TIN_TOWER_4F,                                 6,  6 ;  7
	map_const TIN_TOWER_5F,                                 3,  3 ;  8
	map_const TIN_TOWER_6F,                                10,  9 ;  9
	map_const TIN_TOWER_7F,                                10,  9 ; 10
	map_const TIN_TOWER_8F,                                10,  9 ; 11
	map_const TIN_TOWER_9F,                                10,  9 ; 12
	map_const BURNED_TOWER_1F,                             10,  9 ; 13
	map_const BURNED_TOWER_B1F,                            10,  9 ; 14
	map_const NATIONAL_PARK,                               20, 27 ; 15
	map_const NATIONAL_PARK_BUG_CONTEST,                   20, 27 ; 16
	map_const RUINS_OF_ALPH_HO_OH_CHAMBER,                  4,  5 ; 23
	map_const RUINS_OF_ALPH_KABUTO_CHAMBER,                 4,  5 ; 24
	map_const RUINS_OF_ALPH_OMANYTE_CHAMBER,                4,  5 ; 25
	map_const RUINS_OF_ALPH_AERODACTYL_CHAMBER,             4,  5 ; 26
	map_const RUINS_OF_ALPH_INNER_CHAMBER,                 10, 14 ; 27
	map_const UNION_CAVE_1F,                               28, 11 ; 37
	map_const UNION_CAVE_B1F,                              22, 11 ; 38
	map_const UNION_CAVE_B2F,                              12, 11 ; 39
	map_const SLOWPOKE_WELL_B1F,                            9,  9 ; 40
	map_const SLOWPOKE_WELL_B2F,                           10,  9 ; 41
	map_const OLIVINE_LIGHTHOUSE_3F,                       30,  9 ; 44
	map_const MAHOGANY_MART_1F,                             4,  4 ; 48
	map_const TEAM_ROCKET_BASE_B1F,                        15,  9 ; 49
	map_const TEAM_ROCKET_BASE_B2F,                        15, 15 ; 50
	map_const TEAM_ROCKET_BASE_B3F,                        15, 15 ; 51
	map_const ILEX_FOREST,                                 25, 32 ; 52
	map_const ROUTE_16,                                    10,  9 ;  2
	map_const UNDERGROUND_PATH,                            10, 18 ; 86
	map_const GOLDENROD_UNDERGROUND_SWITCH_ROOM_ENTRANCES, 15, 18 ; 54
	map_const GOLDENROD_DEPT_STORE_B1F,                    10,  9 ; 55
	map_const GOLDENROD_UNDERGROUND_WAREHOUSE,             10,  9 ; 56
	map_const MOUNT_MORTAR_1F_OUTSIDE,                     20, 18 ; 57
	map_const MOUNT_MORTAR_1F_INSIDE,                      30, 18 ; 58
	map_const MOUNT_MORTAR_ZAPDOS_ROOM,                    10,  9 ; 58
	map_const MOUNT_MORTAR_2F_INSIDE,                      20, 18 ; 59
	map_const MOUNT_MORTAR_B1F,                            20, 18 ; 60
	map_const ICE_PATH_1F,                                 10, 36 ; 61
	map_const ICE_PATH_B1F,                                20,  9 ; 62
	map_const ICE_PATH_B2F_MAHOGANY_SIDE,                  20, 18 ; 63
	map_const ICE_PATH_B2F_BLACKTHORN_SIDE,                11,  9 ; 64
	map_const ICE_PATH_B3F,                                10,  9 ; 65
	map_const ICE_PATH_NEW,								   20, 18 ; idk
	map_const WHIRL_ISLAND_NW,                              5,  9 ; 66
	map_const WHIRL_ISLAND_NE,                             10,  9 ; 67
	map_const WHIRL_ISLAND_SW,                             10,  9 ; 68
	map_const WHIRL_ISLAND_CAVE,                            5,  9 ; 69
	map_const WHIRL_ISLAND_SE,                              5,  9 ; 70
	map_const WHIRL_ISLAND_B1F,                            20, 18 ; 71
	map_const WHIRL_ISLAND_B2F,                            20, 18 ; 72
	map_const WHIRL_ISLAND_BLISSEY_CHAMBER,                  10,  9 ; 73
	map_const SILVER_CAVE_ROOM_1,                          10, 18 ; 74
	map_const SILVER_CAVE_ROOM_2,                          15, 18 ; 75
	map_const SILVER_CAVE_ROOM_3,                          10, 18 ; 76
	map_const SILVER_CAVE_ITEM_ROOMS,                      10,  9 ; 77
	map_const DARK_CAVE_VIOLET_ENTRANCE,                   20, 18 ; 78
	map_const DARK_CAVE_BLACKTHORN_ENTRANCE,               15, 18 ; 79
	map_const DRAGONS_DEN_1F,                               5, 18 ; 80
	map_const TOHJO_FALLS,                                 15,  9 ; 83
	map_const DIGLETTS_CAVE,                               30,  9 ; 84
	map_const MOUNT_MOON,                                  17, 11 ; 85
	map_const ROCK_TUNNEL_1F,                              22, 11 ; 87
	map_const ROCK_TUNNEL_B1F,                             20,  9 ; 88
	map_const SAFARI_ZONE_FUCHSIA_GATE_BETA,                5,  4 ; 89
	map_const SAFARI_ZONE_BETA,                            20, 18 ; 90
	map_const VICTORY_ROAD,                                20, 27 ; 91
	map_const VICTORY_ROAD_2F,                             20, 27 ; 91

	newgroup                                                      ;  4

	map_const ECRUTEAK_TIN_TOWER_ENTRANCE,                 10,  9 ;  1
	map_const WISE_TRIOS_ROOM,                              4,  4 ;  2
	map_const ECRUTEAK_POKECENTER_1F,                       8,  4 ;  3
	map_const ECRUTEAK_BLISSEY_SPEECH_HOUSE,                  5,  4 ;  4
	map_const ECRUTEAK_MART,                                8,  4 ;  6
	map_const ECRUTEAK_ITEMFINDER_HOUSE,                    5,  4 ;  8
	map_const ECRUTEAK_CITY,                               20, 18 ;  9
	map_const ROUTE_7,                                     10, 27 ;  1
	map_const ROUTE_8,                                     25,  9 ;  1
	map_const TEKU_PORT_PASSAGE,						   10,  9 ;
	map_const GOLDENROD_GYM,                               10,  9 ;  3
	map_const OLIVINE_LIGHTHOUSE_1F,                        8,  4 ; 42
	map_const OLIVINE_LIGHTHOUSE_2F,                        8,  4 ; 43
	map_const VIOLET_KYLES_HOUSE,                           5,  4 ; 11

	newgroup                                                      ;  5

	map_const BLACKTHORN_DRAGON_SPEECH_HOUSE,               4,  4 ;  3
	map_const BLACKTHORN_EMYS_HOUSE,                        5,  4 ;  4
	map_const BLACKTHORN_MART,                              8,  4 ;  5
	map_const BLACKTHORN_POKECENTER_1F,                     8,  4 ;  6
	map_const MOVE_DELETERS_HOUSE,                          5,  4 ;  7
	map_const ROUTE_45,                                    10, 45 ;  8
	map_const ROUTE_46,                                    10, 18 ;  9
	map_const BLACKTHORN_CITY,                             20, 18 ; 10
	map_const ROUTE_40,                                    25,  9 ;  1
	map_const ROUTE_32,                                    10, 27 ;  1
	map_const ROUTE_27_SANDSTORM_HOUSE,                     5,  4 ; 12
	map_const MAHOGANY_GYM,                                 5,  9 ;  2
	map_const BLUEFOREST_HOUSE_1,							5,  4 ;
	map_const ROUTE_29_ROUTE_46_GATE,                       5,  4 ; 13
	
	newgroup                                                      ;  6

	map_const CINNABAR_POKECENTER_1F,                       8,  4 ;  1
	map_const CINNABAR_POKECENTER_2F_BETA,                  8,  4 ;  2
	map_const ROUTE_19_FUCHSIA_GATE,                        5,  4 ;  3
	map_const SEAFOAM_GYM,                                  5,  4 ;  4
	map_const CINNABAR_ISLAND,                             10,  9 ;  8
	map_const ROUTE_41,                                    10, 27 ;  2
	map_const LAVENDER_MART,                                8,  4 ; 10
	map_const LAVENDER_SPEECH_HOUSE,                        5,  4 ;  8
	map_const LAVENDER_NAME_RATER,                          5,  4 ;  9

	newgroup                                                      ;  7

	map_const CERULEAN_GYM_BADGE_SPEECH_HOUSE,              4,  4 ;  1
	map_const CERULEAN_POLICE_STATION,                      5,  4 ;  2
	map_const CERULEAN_POKECENTER_1F,                       8,  4 ;  4
	map_const CERULEAN_POKECENTER_2F_BETA,                  8,  4 ;  5
	map_const CERULEAN_GYM,                                 5,  8 ;  6
	map_const ROUTE_10_POKECENTER_2F_BETA,                  8,  4 ;  9
	map_const POWER_PLANT,                                 10,  9 ; 10
	map_const ROUTE_25,                                    10, 27 ; 16
	map_const CERULEAN_CITY,                               10, 18 ; 17
	map_const EASTWARD_SUMMIT,							   10,  9 ;asdf
	map_const BLACKTHORN_GYM_1F,                            5,  4 ;  1
	map_const BLACKTHORN_GYM_2F,                           20,  9 ;  2
	map_const ROUTE_20,                                    30,  9 ;  6
	map_const VERMILION_MAGNET_TRAIN_SPEECH_HOUSE,          5,  4 ;  8

	newgroup                                                      ;  8

	map_const AZALEA_POKECENTER_1F,                         8,  4 ;  1
	map_const CHARCOAL_KILN,                                4,  4 ;  2
	map_const AZALEA_MART,                                  8,  4 ;  3
	map_const ROUTE_35,                                    10, 27 ;  2
	map_const AZALEA_TOWN,                                 10,  9 ;  7
	map_const ROUTE_33,                                    50,  9 ;  6
	map_const ROUTE_30,                                    10, 18 ;  1
	map_const NEW_ECRUTEAK_GATE_SOUTH,						5,  4 ; 19
	map_const ECRUTEAK_GYM,                                10,  5 ;  7
	map_const CHERRYGROVE_GYM_SPEECH_HOUSE,                 4,  4 ;  6
	map_const CHERRYGROVE_EVOLUTION_SPEECH_HOUSE,           5,  4 ;  8
	map_const ROUTE_2_GATE,                                 5,  4 ; 12
	map_const ROUTE_30_BERRY_HOUSE,                         5,  4 ;  9

	newgroup                                                      ;  9

	map_const LAKE_OF_RAGE_HIDDEN_POWER_HOUSE,              4,  4 ;  1
	map_const LAKE_OF_RAGE_MAGIKARP_HOUSE,                  4,  4 ;  2
	map_const ROUTE_43_MAHOGANY_GATE,                       5,  4 ;  3
	map_const ROUTE_43_GATE,                                5,  4 ;  4
	map_const LAKE_OF_RAGE,                                20, 18 ;  6
	map_const ROUTE_37,                                    25, 18 ;  4


	newgroup                                                      ; 10

	map_const ROUTE_36,                                    30,  9 ;  3
	map_const OLD_CITY,                                 20, 18 ;  5
	map_const VIOLET_MART,                                  8,  4 ;  6
	map_const VIOLET_GYM,                                   5,  8 ;  7
	map_const EARLS_POKEMON_ACADEMY,                        4,  8 ;  8
	map_const VIOLET_NICKNAME_SPEECH_HOUSE,                 4,  4 ;  9
	map_const VIOLET_POKECENTER_1F,                         8,  4 ; 10
	map_const ROUTE_32_RUINS_OF_ALPH_GATE,                  5,  4 ; 12
	map_const ROUTE_35_GOLDENROD_GATE,                      5,  4 ; 14
	map_const ROUTE_35_NATIONAL_PARK_GATE,                  4,  4 ; 15
	map_const ROUTE_36_RUINS_OF_ALPH_GATE,                  5,  4 ; 16
	map_const NEW_VIOLET_GATE_NORTH,                        5,  4 ; 18
	map_const NEW_VIOLET_GATE_NORTH_2F,                     4,  3 ; 18
	map_const KURTS_HOUSE,                                  8,  4 ;  4
	map_const BILLS_HOUSE,                                  8,  4 ; 11
	map_const BILLS_FAMILYS_HOUSE,                          4,  4 ;  6
	map_const GOLDENROD_FLOWER_SHOP,                        4,  4 ;  8 ;n64 house
	map_const DRAGONS_DEN_B1F,                             20, 18 ; 81

	newgroup                                                      ; 11

	map_const GOLDENROD_CITY,                              20, 18 ;  2
	map_const GOLDENROD_BIKE_SHOP,                          4,  4 ;  4
	map_const GOLDENROD_HAPPINESS_RATER,                    5,  4 ;  5
	map_const GOLDENROD_PP_SPEECH_HOUSE,                    5,  4 ;  9
	map_const GOLDENROD_NAME_RATER,                         5,  4 ; 10
	map_const GOLDENROD_DEPT_STORE_1F,                      8,  4 ; 11
	map_const GOLDENROD_DEPT_STORE_2F,                      8,  4 ; 12
	map_const GOLDENROD_DEPT_STORE_3F,                      8,  4 ; 13
	map_const GOLDENROD_DEPT_STORE_4F,                      8,  4 ; 14
	map_const GOLDENROD_DEPT_STORE_5F,                      8,  4 ; 15
	map_const GOLDENROD_DEPT_STORE_6F,                      8,  4 ; 16
	map_const GOLDENROD_DEPT_STORE_ELEVATOR,                2,  2 ; 17
	map_const GOLDENROD_DEPT_STORE_ROOF,                    8,  4 ; 18
	map_const GOLDENROD_POKECENTER_1F,                      8,  4 ; 20
	map_const ILEX_FOREST_AZALEA_GATE,                      5,  4 ; 22
	map_const ROUTE_34_ILEX_FOREST_GATE,                    5,  4 ; 23
	map_const TEST_GARDEN,								   10,  9 ; 25
	map_const GOLDENROD_UNDERGROUND,                       15, 18 ; 53
	map_const RADIO_TOWER_1F,                               4,  4 ; 17
	map_const RADIO_TOWER_2F,                               4,  4 ; 18
	map_const RADIO_TOWER_3F,                               4,  4 ; 19
	map_const RADIO_TOWER_4F,                               4,  4 ; 20
	map_const RADIO_TOWER_5F,                               4,  4 ; 21
	map_const RADIO_TOWER_6F,                               4,  4 ; 21
	map_const AZALEA_GYM,                                   5,  9 ;  5
	map_const OLIVINE_PORT_PASSAGE,                        10,  9 ;  8

	newgroup                                                      ; 12

	map_const ROUTE_11,                                    20,  9 ;  2
	map_const VERMILION_CITY,                              20,  9 ;  3
	map_const VERMILION_FISHING_SPEECH_HOUSE,               5,  4 ;  4
	map_const VERMILION_POKECENTER_1F,                      8,  4 ;  5
	map_const VERMILION_POKECENTER_2F_BETA,                 8,  4 ;  6
	map_const POKEMON_FAN_CLUB,                             5,  4 ;  7
	map_const VERMILION_MART,                               8,  4 ;  9
	map_const VERMILION_DIGLETTS_CAVE_SPEECH_HOUSE,         5,  4 ; 10
	map_const VERMILION_GYM,                               10,  9 ; 11
	map_const ROUTE_6_SAFFRON_GATE,                         5,  4 ; 12
	map_const ROUTE_6_UNDERGROUND_PATH_ENTRANCE,            4,  4 ; 13
	map_const ROUTE_10_NORTH,                              30,  9 ; 14
	map_const ROUTE_12_SUPER_ROD_HOUSE,                     5,  4 ; 14

	newgroup                                                      ; 13

	map_const ROUTE_1,                                     10, 18 ;  1
	map_const PALLET_TOWN,                                 10,  9 ;  2
	map_const LAVENDER_POKECENTER_1F,                       8,  4 ;  5
	map_const SUGAR_MART,									8,  4 ; 
	map_const SUGAR_HOUSE_2,      				            4,  4 ;  6
	map_const SUGAR_HOUSE_1,      				            5,  4 ;  6
	map_const ROUTE_21,                                    10, 27 ;  7

	newgroup                                                      ; 14

	map_const PEWTER_CITY,                                 20, 18 ;  2
	map_const PEWTER_NIDORAN_SPEECH_HOUSE,                  4,  4 ;  3
	map_const PEWTER_GYM,                                   5,  4 ;  4
	map_const PEWTER_POKECENTER_1F,                         8,  4 ;  6
	map_const PEWTER_POKECENTER_2F_BETA,                    8,  4 ;  7
	map_const PEWTER_SNOOZE_SPEECH_HOUSE,                   5,  4 ;  8
	map_const CERULEAN_MART,                                8,  4 ;  7
	map_const ROUTE_12,                                    10, 18 ;  2
	map_const ROUTE_19,                                    30,  9 ;  5
	map_const ROUTE_24,                                    10,  9 ; 15

	newgroup                                                      ; 15

	map_const OLIVINE_PORT,                                10, 18 ;  1
	map_const TEKU_PORT,								   10,  9 ;
	map_const VERMILION_PORT,                              10, 18 ;  2
	map_const FAST_SHIP_1F,                                16,  9 ;  3
	map_const FAST_SHIP_CABINS_NNW_NNE_NE,                  4, 16 ;  4
	map_const FAST_SHIP_CABINS_SW_SSW_NW,                   4, 16 ;  5
	map_const FAST_SHIP_CABINS_SE_SSE_CAPTAINS_CABIN,       5, 17 ;  6
	map_const FAST_SHIP_B1F,                               16,  8 ;  7
	map_const VERMILION_PORT_PASSAGE,                      10,  9 ;  9
	map_const MOUNT_MOON_GIFT_SHOP,                         4,  4 ; 11
	map_const TIN_TOWER_ROOF,                              10,  9 ; 12

	newgroup                                                      ; 16

	map_const ROUTE_23,                                    10,  9 ;  1
	map_const INDIGO_PLATEAU_POKECENTER_1F,                 9,  7 ;  2
	map_const WILLS_ROOM,                                   5,  9 ;  3
	map_const KOGAS_ROOM,                                   5,  9 ;  4
	map_const BRUNOS_ROOM,                                  5,  9 ;  5
	map_const KARENS_ROOM,                                  5,  9 ;  6
	map_const LANCES_ROOM,                                  5, 12 ;  7
	map_const HALL_OF_FAME,                                 5,  7 ;  8

	newgroup                                                      ; 17

	map_const ROUTE_13,                                    30,  9 ;  1
	map_const ROUTE_15,                                    20,  9 ;  3
	map_const ROUTE_18,                                    10,  9 ;  4
	map_const FUCHSIA_CITY,                                20, 18 ;  5
	map_const FUCHSIA_MART,                                 8,  4 ;  6
	map_const SAFARI_ZONE_MAIN_OFFICE,                      8,  4 ;  7
	map_const FUCHSIA_GYM,                                  5,  9 ;  8
	map_const BILLS_BROTHERS_HOUSE,                         5,  4 ;  9
	map_const FUCHSIA_POKECENTER_1F,                        8,  4 ; 10
	map_const FUCHSIA_POKECENTER_2F_BETA,                   8,  4 ; 11
	map_const SAFARI_ZONE_WARDENS_HOME,                    10,  4 ; 12
	map_const SAFARI_ZONE_WARDENS_HOME_2F,                 10,  4 ; 12
	map_const ROUTE_34,                                    10, 27 ;  1
	map_const CIANWOOD_GYM,                                12, 12 ;  5
	map_const STAND_POKE,									4,  4 ; derp
	map_const ROUTE_36_NATIONAL_PARK_GATE,                  5,  4 ; 17

	newgroup                                                      ; 18

	map_const LAVENDER_TOWN,                               10,  9 ;  4
	map_const LAVENDER_POKECENTER_2F_BETA,                  8,  4 ;  6
	map_const MR_FUJIS_HOUSE,                               5,  4 ;  7
	map_const SOUL_HOUSE,                                   5,  4 ; 11
	map_const ROUTE_8_SAFFRON_GATE,                         5,  4 ; 13

	newgroup                                                      ; 19

	map_const ROUTE_28,                                    20,  9 ;  1
	map_const SILVER_CAVE_OUTSIDE,                         20, 18 ;  2
	map_const SILVER_CAVE_POKECENTER_1F,                    8,  4 ;  3
	map_const ROUTE_28_STEEL_WING_HOUSE,                    4,  4 ;  4

	newgroup                                                      ; 20

	map_const POKECENTER_2F,                                8,  4 ;  1
	map_const TRADE_CENTER,                                 5,  4 ;  2
	map_const COLOSSEUM,                                    5,  4 ;  3
	map_const TIME_CAPSULE,                                 5,  4 ;  4
	map_const MOBILE_TRADE_ROOM,                            5,  4 ;  5
	map_const MOBILE_BATTLE_ROOM,                           5,  4 ;  6

	newgroup                                                      ; 21

	map_const ROUTE_17,                                    10, 45 ;  3
	map_const CELADON_CITY,                                30, 27 ;  4
	map_const CELADON_DEPT_STORE_1F,                        8,  4 ;  5
	map_const CELADON_DEPT_STORE_2F,                        8,  4 ;  6
	map_const CELADON_DEPT_STORE_3F,                        8,  4 ;  7
	map_const CELADON_DEPT_STORE_4F,                        8,  4 ;  8
	map_const CELADON_DEPT_STORE_5F,                        8,  4 ;  9
	map_const CELADON_DEPT_STORE_6F,                        8,  4 ; 10
	map_const CELADON_DEPT_STORE_ELEVATOR,                  2,  2 ; 11
	map_const CELADON_MANSION_1F,                           4,  6 ; 12
	map_const CELADON_MANSION_2F,                           4,  6 ; 13
	map_const CELADON_MANSION_3F,                           4,  6 ; 14
	map_const CELADON_MANSION_ROOF,                         4,  6 ; 15
	map_const CELADON_MANSION_ROOF_HOUSE,                   4,  4 ; 16
	map_const CELADON_POKECENTER_1F,                        8,  4 ; 17
	map_const CELADON_POKECENTER_2F_BETA,                   8,  4 ; 18
	map_const CELADON_GAME_CORNER,                         10,  7 ; 19
	map_const CELADON_GAME_CORNER_PRIZE_ROOM,               5,  4 ; 20
	map_const CELADON_GYM,                                  5,  9 ; 21
	map_const CELADON_CAFE,                                 6,  4 ; 22
	map_const ROUTE_16_GATE,                                5,  4 ; 24
	map_const ROUTE_17_ROUTE_18_GATE,                       5,  4 ; 26
	map_const ROUTE_9,                                     20,  9 ; 13
	map_const SILPH_CO_1F,                                 12,  8 ; 10
	map_const GOLDENROD_MAGNET_TRAIN_STATION,               8,  4 ;  7
	map_const OAKS_LAB,                                     5,  6 ;  6
	map_const BLUES_HOUSE,                                  5,  4 ;  5
	map_const REDS_HOUSE_1F,                                4,  4 ;  3
	map_const REDS_HOUSE_2F,                                4,  4 ;  4
	map_const KANTO_POKECENTER_1F,                          8,  4 ; 17
	map_const KANTO_MART,                                   8,  4 ;  5
	map_const KANTO_BATTLE_CLUB_1F, 						5,  4 ; asdf
	map_const KANTO_BATTLE_CLUB_B1F,					   10,  9 ; asda
	map_const KANTO_HOUSE_1,								5,  4 ;
	map_const KANTO_HOUSE_2,								5,  4 ;
	map_const KANTO_HOUSE_3,								5,  4 ;
	map_const KANTO_HOUSE_4,								5,  4 ;
	map_const DANCE_THEATRE,                               10,  8 ;  5
	map_const DRAGON_SHRINE,                                5,  5 ; 82

	newgroup                                                      ; 22

	map_const CIANWOOD_CITY,                               21, 19 ;  3
	map_const MANIAS_HOUSE,                                 4,  4 ;  4
	map_const CIANWOOD_POKECENTER_1F,                       8,  4 ;  6
	map_const CIANWOOD_PHOTO_STUDIO,                        5,  4 ;  8
	map_const POKE_SEERS_HOUSE,                             5,  4 ; 10
	map_const BATTLE_TOWER_1F,                              8,  5 ; 11
	map_const BATTLE_TOWER_BATTLE_ROOM,                     4,  4 ; 12
	map_const BATTLE_TOWER_ELEVATOR,                        2,  2 ; 13
	map_const BATTLE_TOWER_HALLWAY,                        11,  2 ; 14
	map_const ROUTE_40_BATTLE_TOWER_GATE,                   5,  4 ; 15
	map_const BATTLE_TOWER_OUTSIDE,                        10, 14 ; 16
	map_const ROUTE_5,                                     10, 18 ;  1
	map_const ROUTE_5_SAFFRON_GATE,                         5,  4 ; 14
	map_const PEWTER_MART,                                  8,  4 ;  5
	map_const ROUTE_15_FUCHSIA_GATE,                        5,  4 ; 13
	map_const VIRIDIAN_GYM,                                20, 18 ;  4

	newgroup                                                      ; 23

	map_const ROUTE_22,                                    20,  9 ;  2
	map_const VIRIDIAN_CITY,                               20, 18 ;  3
	map_const VIRIDIAN_NICKNAME_SPEECH_HOUSE,               4,  4 ;  5
	map_const TRAINER_HOUSE_1F,                             5,  7 ;  6
	map_const TRAINER_HOUSE_B1F,                            5,  8 ;  7
	map_const VIRIDIAN_POKECENTER_2F_BETA,                  8,  4 ; 10
	map_const ROUTE_2_NUGGET_HOUSE,                         4,  4 ; 11
	map_const VICTORY_ROAD_GATE,                           10,  9 ; 13

	newgroup                                                      ; 24

	map_const ROUTE_26,                                    10, 54 ;  1
	map_const ROUTE_27,                                    30,  9 ;  2
	map_const ROUTE_29,                                    26, 19 ;  3
	map_const SILENT_TOWN,                                 10,  9 ;  4
	map_const ELM_ENTRANCE,									4,  8 ; new
	map_const ELMS_LAB,                                     5,  6 ;  5
	map_const PLAYERS_HOUSE_1F,                             5,  4 ;  6
	map_const PLAYERS_HOUSE_2F,                             4,  3 ;  7
	map_const PLAYERS_NEIGHBORS_HOUSE,                      4,  4 ;  8
	map_const ELMS_HOUSE,                                   5,  4 ;  9
	map_const ROUTE_26_HEAL_HOUSE,                          4,  4 ; 10
	map_const DAY_OF_WEEK_SIBLINGS_HOUSE,                   4,  4 ; 11
	map_const VIRIDIAN_POKECENTER_1F,                       8,  4 ;  9
	map_const ROUTE_31_VIOLET_GATE,                         5,  4 ; 11
	map_const ROUTE_31_VIOLET_GATE_2F,						4,  3 ; new gate floor
	map_const ROUTE_14,                                    10,  5 ;  2

	newgroup                                                      ; 25

	map_const SAFFRON_CITY,                                20, 18 ;  2
	map_const SAFFRON_GYM,                                 10,  9 ;  4
	map_const SAFFRON_MART,                                 8,  4 ;  5
	map_const SAFFRON_POKECENTER_1F,                        8,  4 ;  6
	map_const SAFFRON_POKECENTER_2F_BETA,                   8,  4 ;  7
	map_const MR_PSYCHICS_HOUSE,                            5,  4 ;  8
	map_const SAFFRON_MAGNET_TRAIN_STATION,                10,  9 ;  9
	map_const COPYCATS_HOUSE_1F,                            4,  4 ; 11
	map_const COPYCATS_HOUSE_2F,                            5,  3 ; 12
	map_const ROUTE_5_UNDERGROUND_PATH_ENTRANCE,            4,  4 ; 13
	map_const ROUTE_10_SOUTH,                              20,  9 ;  3
	map_const CERULEAN_TRADE_SPEECH_HOUSE,                  5,  4 ;  3

	newgroup                                                      ; 26

	map_const CHERRYGROVE_MART,                             8,  4 ;  4
	map_const CHERRYGROVE_POKECENTER_1F,                    8,  4 ;  5
	map_const GUIDE_GENTS_HOUSE,                            4,  4 ;  7
	map_const MR_POKEMONS_HOUSE,                            4,  4 ; 10
	map_const CHERRYGROVE_CITY,                            10, 13 ;  3
	map_const MOUNT_MOON_SQUARE,                           10,  9 ; 10
	map_const CIANWOOD_BLISSEY_SPEECH_HOUSE,                  5,  4 ;  9
	map_const CIANWOOD_PHARMACY,                            5,  4 ;  7
	map_const ROUTE_16_FUCHSIA_SPEECH_HOUSE,                8,  4 ; 23
