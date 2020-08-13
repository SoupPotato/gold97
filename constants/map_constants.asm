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

	map_const ALLOY_POKECENTER_1F,                          8,  4 ;  1
	map_const ALLOY_GYM,                                   10,  8 ;  2
	map_const ALLOY_TIMS_HOUSE,                             5,  4 ;  3
	map_const ALLOY_CAPTAINS_HOUSE,                         5,  4 ;  4
	map_const ALLOY_PUNISHMENT_SPEECH_HOUSE,                5,  4 ;  5
	map_const ALLOY_GOOD_ROD_HOUSE,                         5,  4 ;  6
	map_const ALLOY_CAFE,                                   4,  4 ;  7
	map_const ALLOY_MART,                                   8,  4 ;  8
	map_const ROUTE_109_ROUTE_110_GATE,                     5,  4 ;  9
	map_const ROUTE_108,                                   15,  9 ; 12
	map_const ROUTE_109,                                   10, 45 ; 13
	map_const ALLOY_CITY,                                  20, 18 ; 14
	map_const ROUTE_107_ALLOY_GATE,						    5,  4 ; 15
	map_const ROUTE_107_ALLOY_GATE_2F,						4,  3 ; 15
	map_const ROUTE_106,                                   30,  9 ;  2
	map_const ROUTE_106_POKECENTER_1F,                      8,  4 ; 13
	map_const DAY_CARE,                                     5,  4 ; 24
	map_const FIGHTING_DOJO,                                5,  6 ;  3
	map_const ROUTE_109_POKECENTER_1F,                      8,  4 ;  8

	newgroup                                                      ;  2

	map_const SANSKRIT_COIN_CASE_SPEECH_HOUSE,              5,  4 ;  1
	map_const SANSKRIT_POKECENTER_1F,                       8,  4 ;  3
	map_const SANSKRIT_TOWN,                               10,  9 ;  7
	map_const ROUTE_116,                                   10, 18 ;  1
	map_const ROUTE_117,                                   30,  9 ;  1
	map_const RUINS_OF_ALPH_OUTSIDE,                       10, 18 ; 22
	map_const BOARDWALK,                                   10, 27 ;  5
	map_const ROUTE_118,                                   35,  9 ; 12
	map_const ROUTE_118_SUNPOINT_GATE,                      5,  4 ; 25
	map_const RUINS_OF_ALPH_RESEARCH_CENTER,                4,  4 ; 28
	map_const SANSKRIT_ROCKET_HOUSE,                       10,  4 ; 12
	map_const SANSKRIT_MART,                                8,  4 ;  8
	map_const BOARDWALK_GAME_CORNER,                       10,  7 ; 19

	newgroup                                                      ;  3

	map_const BRASS_TOWER_1F,                               6,  6 ;  1
	map_const BRASS_TOWER_2F,                               6,  6 ;  2
	map_const BRASS_TOWER_3F,                               6,  6 ;  3
	map_const BRASS_TOWER_4F,                               6,  6 ;  7
	map_const BRASS_TOWER_5F,                               3,  3 ;  8
	map_const NATIONAL_PARK,                               20, 27 ; 15
	map_const NATIONAL_PARK_BUG_CONTEST,                   20, 27 ; 16
	map_const RUINS_OF_ALPH_HO_OH_CHAMBER,                  4,  5 ; 23
	map_const RUINS_OF_ALPH_KABUTO_CHAMBER,                 4,  5 ; 24
	map_const RUINS_OF_ALPH_OMANYTE_CHAMBER,                4,  5 ; 25
	map_const RUINS_OF_ALPH_AERODACTYL_CHAMBER,             4,  5 ; 26
	map_const RUINS_OF_ALPH_INNER_CHAMBER,                 10, 14 ; 27
	map_const BOULDER_MINES_1F,                            28, 11 ; 37
	map_const BOULDER_MINES_B1F,                           22, 11 ; 38
	map_const BOULDER_MINES_B5F,                           12, 11 ; 39
	map_const SLOWPOKE_WELL_B1F,                            9,  9 ; 40
	map_const SLOWPOKE_WELL_B2F,                           10,  9 ; 41
	map_const ENDON_CAVE_B1F,                              30,  9 ; 44
	map_const TEAM_ROCKET_BASE_B2F_OFFICE,                 15,  9 ; 49
	map_const TEAM_ROCKET_BASE_B1F,                        15, 15 ; 50
	map_const TEAM_ROCKET_BASE_B2F,                        15, 15 ; 51
	map_const JADE_FOREST,                                 25, 32 ; 52
	map_const CROWN_PASS,                                  10, 18 ; 86
	map_const CHARRED_SUMMIT_CAVE,                         20, 18 ; 57
	map_const JOULE_CAVE,                                  30, 18 ; 58
	map_const JOULE_CAVE_ZAPDOS_ROOM,                       7,  7 ; 58
	map_const ICED_CAVERN_1F,                              20, 18 ; 59
	map_const ICED_CAVERN_B1F,                             20, 18 ; 60
	map_const DEEPWATER_PASSAGE_B2F,                       10, 36 ; 61
	map_const MAGMA_SHAFT_B1F,                             20,  9 ; 62
	map_const MAGMA_SHAFT_B2F,                             20, 18 ; 63
	map_const MAGMA_SHAFT_1F,                              11,  9 ; 64
	map_const DEEPWATER_PASSAGE_B1F,                       10,  9 ; 65
	map_const DEEPWATER_PASSAGE_B3F,					   20, 18 ; idk
	map_const WHIRL_ISLAND_B2F_CAVE,                        5,  9 ; 66
	map_const WHIRL_ISLAND_1F,                             10,  9 ; 67
	map_const WHIRL_ISLAND_B1F,                            20, 18 ; 71
	map_const WHIRL_ISLAND_B2F,                            20, 18 ; 72
	map_const WHIRL_ISLAND_LUGIA_CHAMBER,                  10,  9 ; 73
	map_const AMPARE_CAVERN_B1F,                           20, 18 ; 78
	map_const AMPARE_CAVERN_1F,                            15, 18 ; 79
	map_const DEEPWATER_PASSAGE_1F,                         5, 18 ; 80
	map_const ENDON_CAVE_1F,                               30,  9 ; 84
	map_const BOULDER_MINES_B4F,                           17, 11 ; 85
	map_const BOULDER_MINES_B2F,                           22, 11 ; 87
	map_const BOULDER_MINES_B3F,                           20,  9 ; 88
	map_const NANJO_FOREST,                                20, 18 ; 90
	map_const VICTORY_ROAD,                                20, 27 ; 91
	map_const VICTORY_ROAD_2F,                             20, 27 ; 91

	newgroup                                                      ;  4

	map_const TEKNOS_POKECENTER_1F,                         8,  4 ;  3
	map_const TEKNOS_OLD_ROD_HOUSE,                         5,  4 ;  4
	map_const TEKNOS_MART,                                  8,  4 ;  6
	map_const TEKNOS_GRAMPS_ITEMFINDER_HOUSE,               5,  4 ;  8
	map_const TEKNOS_CITY,                                 20, 18 ;  9
	map_const ROUTE_119,                                   10, 27 ;  1
	map_const ROUTE_120,                                   25,  9 ;  1
	map_const TEKNOS_PORT_PASSAGE,						   10,  9 ;
	map_const TEKNOS_GYM,                                  10,  9 ;  3
	map_const TEKNOS_AQUARIUM_1F,                           8,  4 ; 42
	map_const TEKNOS_AQUARIUM_2F,                           8,  4 ; 43
	map_const TEKNOS_KYLES_HOUSE,                           5,  4 ; 11

	newgroup                                                      ;  5

	map_const BLUE_FOREST_SPEECH_HOUSE,                     4,  4 ;  3
	map_const BLUE_FOREST_EMYS_HOUSE,                       5,  4 ;  4
	map_const BLUE_FOREST_MART,                             8,  4 ;  5
	map_const BLUE_FOREST_POKECENTER_1F,                    8,  4 ;  6
	map_const MOVE_DELETERS_HOUSE,                          5,  4 ;  7
	map_const BLUE_FOREST,                                 20, 18 ; 10
	map_const ROUTE_110,                                   25,  9 ;  1
	map_const ROUTE_112,                                   10, 27 ;  1
	map_const ROUTE_110_SANDSTORM_HOUSE,                    5,  4 ; 12
	map_const BLUE_FOREST_GYM,                              5,  9 ;  2
	map_const BLUE_FOREST_NIGHTMARE_HOUSE,					5,  4 ;
	map_const ROUTE_111_BLUE_FOREST_GATE,                   5,  4 ; 13
	
	newgroup                                                      ;  6

	map_const FROSTPOINT_POKECENTER_1F,                     8,  4 ;  1
	map_const RYUKYU_CITY_MERIDIAN_PATH_GATE,               5,  4 ;  3
	map_const FROSTPOINT_TOWN,                             10,  9 ;  8
	map_const ROUTE_111,                                   10, 27 ;  2
	map_const FROSTPOINT_MART,                              8,  4 ; 10
	map_const PRYCES_FAMILY_HOUSE,                          5,  4 ;  8
	map_const FROSTPOINT_NAME_RATER,                        5,  4 ;  9

	newgroup                                                      ;  7

	map_const NAGO_IMPOSTER_HOUSE,                          5,  4 ;  2
	map_const NAGO_POKECENTER_1F,                           8,  4 ;  4
	map_const JADE_FOREST_SNORLAX_ROOM,                     5,  8 ;  6
	map_const MERIDIAN_PATH,                               10, 27 ; 16
	map_const NAGO_VILLAGE,                                10, 18 ; 17
	map_const CHARRED_SUMMIT,							   11, 25 ;asdf
	map_const RESEARCH_FACILITY_BACK_ROOM,                  5,  4 ;  1
	map_const RESEARCH_FACILITY_ENTRANCE,                  20,  9 ;  2
	map_const ISEN_STRAIT,                                 30,  9 ;  6
	map_const NAGO_CHARMANDER_HOUSE,                        5,  4 ;  8

	newgroup                                                      ;  8

	map_const BIRDON_POKECENTER_1F,                         8,  4 ;  1
	map_const BIRDON_CAFE,                                  4,  4 ;  2
	map_const BIRDON_MART,                                  8,  4 ;  3
	map_const ROUTE_103,                                   10, 27 ;  2
	map_const BIRDON_TOWN,                                 10,  9 ;  7
	map_const ROUTE_104,                                   50,  9 ;  6
	map_const ROUTE_105,                                   10, 18 ;  1
	map_const ROUTE_105_ROUTE_106_GATE,						5,  4 ; 19
	map_const BIRDON_GYM,                                  10,  5 ;  7
	map_const BIRDON_ELDERS_HOUSE,                          4,  4 ;  6
	map_const BIRDON_SPEECH_HOUSE,                          5,  4 ;  8
	map_const ROUTE_116_GATE,                               5,  4 ; 12
	map_const ROUTE_104_GARDENERS_HOUSE,                    5,  4 ;  9

	newgroup                                                      ;  9

	map_const BOARDWALK_TEKNOS_GATE,                        5,  4 ;  3
	map_const BOARDWALK_SANSKRIT_GATE,                      5,  4 ;  4
	map_const SILENT_HILLS,                                25, 18 ;  4

	newgroup                                                      ; 10

	map_const ROUTE_102,                                   30,  9 ;  3
	map_const PAGOTA_CITY,                                 20, 18 ;  5
	map_const PAGOTA_MART,                                  8,  4 ;  6
	map_const PAGOTA_GYM,                                   5,  8 ;  7
	map_const PAGOTA_TRAINER_SCHOOL,                        4,  8 ;  8
	map_const PAGOTA_NICKNAME_SPEECH_HOUSE,                 4,  4 ;  9
	map_const PAGOTA_POKECENTER_1F,                         8,  4 ; 10
	map_const ROUTE_103_WESTPORT_GATE,                      5,  4 ; 14
	map_const ROUTE_112_STAND_CITY_GATE,                    5,  4 ; 16
	map_const ROUTE_102_WESTPORT_GATE,                      5,  4 ; 18
	map_const ROUTE_102_WESTPORT_GATE_2F,                   4,  3 ; 18
	map_const KURTS_HOUSE,                                  8,  4 ;  4
	map_const EARLS_ART_HOUSE,                              8,  4 ; 11
	map_const BILLS_FAMILYS_HOUSE,                          4,  4 ;  6
	map_const ROUTE_102_N64_HOUSE,                          4,  4 ;  8 ;n64 house
	map_const DRAGONS_MAW,                                 20, 18 ; 81

	newgroup                                                      ; 11

	map_const WESTPORT_CITY,                               20, 18 ;  2
	map_const WESTPORT_BIKE_SHOP,                           4,  4 ;  4
	map_const WESTPORT_HAPPINESS_RATER,                     5,  4 ;  5
	map_const WESTPORT_PP_SPEECH_HOUSE,                     5,  4 ;  9
	map_const WESTPORT_NAME_RATER,                          5,  4 ; 10
	map_const WESTPORT_DEPT_STORE_1F,                       8,  4 ; 11
	map_const WESTPORT_DEPT_STORE_2F,                       8,  4 ; 12
	map_const WESTPORT_DEPT_STORE_3F,                       8,  4 ; 13
	map_const WESTPORT_DEPT_STORE_4F,                       8,  4 ; 14
	map_const WESTPORT_DEPT_STORE_5F,                       8,  4 ; 15
	map_const WESTPORT_DEPT_STORE_6F,                       8,  4 ; 16
	map_const WESTPORT_DEPT_STORE_ELEVATOR,                 2,  2 ; 17
	map_const WESTPORT_DEPT_STORE_ROOF,                     8,  4 ; 18
	map_const WESTPORT_POKECENTER_1F,                       8,  4 ; 20
	map_const ROUTE_115_KANTO_GATE,                         5,  4 ; 22
	map_const ROUTE_113_ROUTE_114_GATE,                     5,  4 ; 23
	map_const WESTPORT_UNDERGROUND,                        15, 18 ; 53
	map_const RADIO_TOWER_1F,                               4,  4 ; 17
	map_const RADIO_TOWER_2F,                               4,  4 ; 18
	map_const RADIO_TOWER_3F,                               4,  4 ; 19
	map_const RADIO_TOWER_4F,                               4,  4 ; 20
	map_const RADIO_TOWER_5F,                               4,  4 ; 21
	map_const RADIO_TOWER_6F,                               4,  4 ; 21
	map_const WESTPORT_GYM,                                 5,  9 ;  5
	map_const WESTPORT_PORT_PASSAGE,                       10,  9 ;  8

	newgroup                                                      ; 12

	map_const AMAMI_TOWN,                                  20,  9 ;  3
	map_const AMAMI_FISHING_SPEECH_HOUSE,                   5,  4 ;  4
	map_const AMAMI_POKECENTER_1F,                          8,  4 ;  5
	map_const AMAMI_MART,                                   8,  4 ;  9
	map_const NAGO_SPEECH_HOUSE,                            5,  4 ; 10
	map_const AMAMI_SWIMMING_POOL,                         10,  9 ; 11
	map_const RYUKYU_URASOE_GATE,                           5,  4 ; 12
	map_const SEASIDE_PATH,                                30,  9 ; 14
	map_const URASOE_TRAIL_SUPER_ROD_HOUSE,                 5,  4 ; 14

	newgroup                                                      ; 13

	map_const KOBAN_ISLAND,                                10,  9 ;  2
	map_const KOBAN_POKECENTER_1F,                          8,  4 ;  5
	map_const KOBAN_MART,									8,  4 ; 
	map_const KOBAN_FISHER_HOUSE,      				        4,  4 ;  6
	map_const KOBAN_CLAIRS_HOUSE,      				        5,  4 ;  6
	map_const ROUTE_107,                                   10, 27 ;  7

	newgroup                                                      ; 14

	map_const YORON_CITY,                                  20, 18 ;  2
	map_const YORON_PARTS_SHOP,                             4,  4 ;  3
	map_const YORON_SOCIAL_HOUSE,                           5,  4 ;  4
	map_const YORON_POKECENTER_1F,                          8,  4 ;  6
	map_const YORON_SNOOZE_SPEECH_HOUSE,                    5,  4 ;  8
	map_const NAGO_MART,                                    8,  4 ;  7
	map_const URASOE_TRAIL,                                10, 18 ;  2
	map_const KERAMA_STRAIT,                               30,  9 ;  5
	map_const YORON_POINT,                                 10,  9 ; 15

	newgroup                                                      ; 15

	map_const WESTPORT_PORT,                               10, 18 ;  1
	map_const TEKNOS_PORT,								   10,  9 ;
	map_const AMAMI_PORT,                                  10, 18 ;  2
	map_const FAST_SHIP_1F,                                16,  9 ;  3
	map_const FAST_SHIP_CABINS_NNW_NNE_NE,                  4, 16 ;  4
	map_const FAST_SHIP_CABINS_SW_SSW_NW,                   4, 16 ;  5
	map_const FAST_SHIP_CABINS_SE_SSE_CAPTAINS_CABIN,       5, 17 ;  6
	map_const FAST_SHIP_B1F,                               16,  8 ;  7
	map_const AMAMI_PORT_PASSAGE,                          10,  9 ;  9
	map_const BRASS_TOWER_ROOF,                            10,  9 ; 12

	newgroup                                                      ; 16

	map_const NIHON_LEAGUE,                                10,  9 ;  1
	map_const NIHON_LEAGUE_POKECENTER_1F,                   9,  7 ;  2
	map_const LORELEIS_ROOM,                                5,  9 ;  3
	map_const KOGAS_ROOM,                                   5,  9 ;  4
	map_const AGATHAS_ROOM,                                 5,  9 ;  5
	map_const GIOVANNIS_ROOM,                               5,  9 ;  6
	map_const LANCES_ROOM,                                  5, 12 ;  7
	map_const HALL_OF_FAME,                                 5,  7 ;  8

	newgroup                                                      ; 17

	map_const STAND_CITY,                                  20, 18 ;  5
	map_const STAND_MART,                                   8,  4 ;  6
	map_const STAND_ZOO_MAIN_OFFICE,                        8,  4 ;  7
	map_const BILLS_BROTHERS_HOUSE,                         5,  4 ;  9
	map_const STAND_POKECENTER_1F,                          8,  4 ; 10
	map_const STAND_ROCKET_HOUSE_1F,                       10,  4 ; 12
	map_const STAND_ROCKET_HOUSE_2F,                       10,  4 ; 12
	map_const ROUTE_113,                                   10, 27 ;  1
	map_const STAND_GYM,                                   12, 12 ;  5
	map_const STAND_ZOO_INFIRMARY,						    4,  4 ; derp
	map_const NATIONAL_PARK_STAND_GATE,                     5,  4 ; 17

	newgroup                                                      ; 18

	map_const URASOE_PARK_URASOE_TRAIL_GATE,                5,  4 ; 13

	newgroup                                                      ; 20

	map_const POKECENTER_2F,                                8,  4 ;  1
	map_const TRADE_CENTER,                                 5,  4 ;  2
	map_const COLOSSEUM,                                    5,  4 ;  3
	map_const TIME_CAPSULE,                                 5,  4 ;  4
	map_const MOBILE_TRADE_ROOM,                            5,  4 ;  5
	map_const MOBILE_BATTLE_ROOM,                           5,  4 ;  6

	newgroup                                                      ; 21

	map_const KANTO_REGION,                                30, 30 ;  4
	map_const KANTO_DEPT_STORE_1F,                          8,  4 ;  5
	map_const KANTO_DEPT_STORE_2F,                          8,  4 ;  6
	map_const KANTO_DEPT_STORE_3F,                          8,  4 ;  7
	map_const KANTO_DEPT_STORE_4F,                          8,  4 ;  8
	map_const KANTO_DEPT_STORE_5F,                          8,  4 ;  9
	map_const KANTO_DEPT_STORE_6F,                          8,  4 ; 10
	map_const KANTO_DEPT_STORE_ELEVATOR,                    2,  2 ; 11
	map_const KANTO_CELADON_MANSION_1F,                     4,  6 ; 12
	map_const KANTO_CELADON_MANSION_2F,                     4,  6 ; 13
	map_const KANTO_CELADON_MANSION_3F,                     4,  6 ; 14
	map_const KANTO_CELADON_MANSION_ROOF,                   4,  6 ; 15
	map_const KANTO_CELADON_MANSION_ROOF_HOUSE,             4,  4 ; 16
	map_const KANTO_POKECENTER_1F,                          8,  4 ; 17
	map_const KANTO_GAME_CORNER,                           10,  7 ; 19
	map_const KANTO_GAME_CORNER_PRIZE_ROOM,                 5,  4 ; 20
	map_const KANTO_GYM,                                    5,  9 ; 21
	map_const KANTO_LEFTOVERS_HOUSE,                        6,  4 ; 22
	map_const ISEN_STRAIT_SEASIDE_PATH_GATE,                5,  4 ; 26
	map_const ROUTE_114,                                   20,  9 ; 13
	map_const SILPH_CO_1F,                                 12,  8 ; 10
	map_const KANTO_HOTEL,                                  8,  4 ;  7
	map_const OAKS_KANTO_LAB,                               5,  6 ;  6
	map_const BLUES_HOUSE,                                  5,  4 ;  5
	map_const REDS_HOUSE_1F,                                4,  4 ;  3
	map_const REDS_HOUSE_2F,                                4,  4 ;  4
	map_const KANTO_POKECENTER_WEST_1F,                     8,  4 ; 17
	map_const KANTO_MART,                                   8,  4 ;  5
	map_const KANTO_BATTLE_CLUB_1F, 					    5,  4 ; asdf
	map_const KANTO_BATTLE_CLUB_B1F,					   10,  9 ; asda
	map_const KANTO_HOUSE_1,							    5,  4 ;
	map_const KANTO_HOUSE_2,							    5,  4 ;
	map_const KANTO_HOUSE_3,							    5,  4 ;
	map_const KANTO_HOUSE_4,							    5,  4 ;
	map_const KANTO_FOSSIL_LAB,                            10,  8 ;  5
	map_const KANTO_CAFE,                                   5,  5 ; 82
	map_const DIGLETTS_CAVE,                               10, 18 ; newly added kanto maps start here
	map_const ROCK_TUNNEL_1F,                              15, 18 ; 87
	map_const ROCK_TUNNEL_B1F,                             15, 18 ; 88
	map_const MOUNT_MOON,                                  15,  9 ; 85
	map_const MOUNT_MOON_SQUARE,                           15,  9 ; 10
	map_const MOUNT_MOON_GIFT_SHOP,                         4,  4 ; 11
	map_const KANTO_VICTORY_ROAD,                                10, 36 ; 91
	map_const SAFARI_ZONE_FUCHSIA_GATE_BETA,                5,  4 ; 89
	map_const SAFARI_ZONE_BETA,                            10, 18 ; 90
	map_const KANTO_POWER_PLANT,                           20, 18


	newgroup                                                      ; 22

	map_const SUNPOINT_CITY,                               21, 19 ;  3
	map_const SUNPOINT_POKECENTER_1F,                       8,  4 ;  6
	map_const SUNPOINT_PHOTO_STUDIO,                        5,  4 ;  8
	map_const POKE_SEERS_HOUSE,                             5,  4 ; 10
	map_const BATTLE_TOWER_1F,                              8,  5 ; 11
	map_const BATTLE_TOWER_BATTLE_ROOM,                     4,  4 ; 12
	map_const BATTLE_TOWER_ELEVATOR,                        2,  2 ; 13
	map_const BATTLE_TOWER_HALLWAY,                        11,  2 ; 14
	map_const BATTLE_TOWER_OUTSIDE,                        10, 14 ; 16
	map_const SUNPOINT_DOCKS,                              10, 18 ;  1
	map_const SUNPOINT_DOCKS_SUNPOINT_GATE,                 5,  4 ; 14
	map_const YORON_MART,                                   8,  4 ;  5
	map_const ROUTE_119_SUNPOINT_GATE,                      5,  4 ; 13
	map_const ROCKET_SHIP_BASE,                            20, 18 ;  4

	newgroup                                                      ; 23

	map_const VICTORY_ROAD_GATE,                           10,  9 ; 13

	newgroup                                                      ; 24

	map_const ROUTE_115,                                   30,  9 ;  2
	map_const ROUTE_101,                                   26, 19 ;  3
	map_const SILENT_TOWN,                                 10, 13 ;  4
	map_const OAKS_LAB_ENTRANCE,							4,  8 ; new
	map_const OAKS_LAB,                                     5,  6 ;  5
	map_const PLAYERS_HOUSE_1F,                             5,  4 ;  6
	map_const PLAYERS_HOUSE_2F,                             4,  3 ;  7
	map_const SILENT_HOUSE,                                 5,  4 ;  9
	map_const SILENT_POKECENTER_1F,                         8,  4 ;  9
	map_const ROUTE_101_PAGOTA_GATE,                        5,  4 ; 11
	map_const ROUTE_101_PAGOTA_GATE_2F,						4,  3 ; new gate floor

	newgroup                                                      ; 25

	map_const RYUKYU_CITY,                                 20, 18 ;  2
	map_const RYUKYU_FAKE_GYM,                             10,  9 ;  4
	map_const RYUKYU_MART,                                  8,  4 ;  5
	map_const RYUKYU_POKECENTER_1F,                         8,  4 ;  6
	map_const MR_PSYCHICS_HOUSE,                            5,  4 ;  8
	map_const RYUKYU_ABORETUM,                             10,  9 ;  9
	map_const URASOE_PARK,                                 20,  9 ;  3
	map_const RYUKYU_TRADE_SPEECH_HOUSE,                    5,  4 ;  3

	newgroup                                                      ; 26

	map_const CROWN_MART,                                   8,  4 ;  4
	map_const CROWN_POKECENTER_1F,                          8,  4 ;  5
	map_const CROWN_CITY,                                  10, 13 ;  3
	map_const VICTORY_ROAD_OUTSIDE,                        10,  9 ; 10
	map_const CROWN_CITY_SCOPE_LENS_HOUSE,                  5,  4 ;  9
	map_const CROWN_CITY_SPEECH_HOUSE,                      5,  4 ;  7
	map_const CROWN_CITY_TRAINER_HOUSE,                     8,  4 ; 23
