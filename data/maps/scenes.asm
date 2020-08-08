scene_var: MACRO
; map, variable
	map_id \1
	dw \2
ENDM

MapScenes::
	scene_var POKECENTER_2F,                               wPokecenter2FSceneID
	scene_var TRADE_CENTER,                                wTradeCenterSceneID
	scene_var COLOSSEUM,                                   wColosseumSceneID
	scene_var TIME_CAPSULE,                                wTimeCapsuleSceneID
	scene_var MERIDIAN_PATH,                               wRoute25SceneID
	scene_var VICTORY_ROAD_GATE,                           wVictoryRoadGateSceneID
	scene_var ISEN_STRAIT_SEASIDE_PATH_GATE,               wRoute17Route18GateSceneID
	scene_var NIHON_LEAGUE_POKECENTER_1F,                  wIndigoPlateauPokecenter1FSceneID
	scene_var LORELEIS_ROOM,                               wWillsRoomSceneID
	scene_var KOGAS_ROOM,                                  wKogasRoomSceneID
	scene_var AGATHAS_ROOM,                                wBrunosRoomSceneID
	scene_var GIOVANNIS_ROOM,                              wKarensRoomSceneID
	scene_var LANCES_ROOM,                                 wLancesRoomSceneID
	scene_var HALL_OF_FAME,                                wHallOfFameSceneID
	scene_var SILENT_TOWN,                                 wSilentTownSceneID
	scene_var OAKS_LAB_ENTRANCE,						   wElmEntranceSceneID
	scene_var OAKS_LAB,                                    wElmsLabSceneID
	scene_var PLAYERS_HOUSE_1F,                            wPlayersHouse1FSceneID
	scene_var ROUTE_101,                                   wRoute29SceneID
	scene_var ROUTE_112,                                   wRoute32SceneID
	scene_var ROUTE_102,                                   wRoute36SceneID
	scene_var NATIONAL_PARK_STAND_GATE,                    wRoute36NationalParkGateSceneID
	scene_var BIRDON_TOWN,                                 wAzaleaTownSceneID
	scene_var WESTPORT_POKECENTER_1F,                      wGoldenrodPokecenter1FSceneID
	scene_var ALLOY_CITY,                                  wOlivineCitySceneID
	scene_var TEKNOS_POKECENTER_1F,                        wEcruteakPokecenter1FSceneID
	scene_var SANSKRIT_TOWN,                               wMahoganyTownSceneID
	scene_var BATTLE_TOWER_1F,                             wBattleTower1FSceneID
	scene_var BATTLE_TOWER_BATTLE_ROOM,                    wBattleTowerBattleRoomSceneID
	scene_var BATTLE_TOWER_ELEVATOR,                       wBattleTowerElevatorSceneID
	scene_var BATTLE_TOWER_HALLWAY,                        wBattleTowerHallwaySceneID
	scene_var BATTLE_TOWER_OUTSIDE,                        wBattleTowerOutsideSceneID ; unused
	scene_var BOULDER_MINES_B4F,                           wMountMoonSceneID
	scene_var BRASS_TOWER_3F,                              wSproutTower3FSceneID
	scene_var RADIO_TOWER_5F,                              wRadioTower5FSceneID
	scene_var RUINS_OF_ALPH_OUTSIDE,                       wRuinsOfAlphOutsideSceneID
	scene_var RUINS_OF_ALPH_RESEARCH_CENTER,               wRuinsOfAlphResearchCenterSceneID
	scene_var RUINS_OF_ALPH_HO_OH_CHAMBER,                 wRuinsOfAlphHoOhChamberSceneID
	scene_var RUINS_OF_ALPH_KABUTO_CHAMBER,                wRuinsOfAlphKabutoChamberSceneID
	scene_var RUINS_OF_ALPH_OMANYTE_CHAMBER,               wRuinsOfAlphOmanyteChamberSceneID
	scene_var RUINS_OF_ALPH_AERODACTYL_CHAMBER,            wRuinsOfAlphAerodactylChamberSceneID
	scene_var RUINS_OF_ALPH_INNER_CHAMBER,                 wRuinsOfAlphInnerChamberSceneID
	scene_var TEAM_ROCKET_BASE_B2F_OFFICE,                 wTeamRocketBaseB1FSceneID
	scene_var TEAM_ROCKET_BASE_B1F,                        wTeamRocketBaseB2FSceneID
	scene_var TEAM_ROCKET_BASE_B2F,                        wTeamRocketBaseB3FSceneID
	scene_var VICTORY_ROAD,                                wVictoryRoadSceneID
	scene_var WESTPORT_PORT,                               wOlivinePortSceneID
	scene_var AMAMI_PORT,                                  wVermilionPortSceneID
	scene_var FAST_SHIP_1F,                                wFastShip1FSceneID
	scene_var FAST_SHIP_B1F,                               wFastShipB1FSceneID
	scene_var MOBILE_TRADE_ROOM,                           wMobileTradeRoomSceneID
	scene_var MOBILE_BATTLE_ROOM,                          wMobileBattleRoomSceneID
	scene_var KURTS_HOUSE,								   wKurtsHouseSceneID
	scene_var TEKNOS_PORT,								   wTekuPortSceneID
	scene_var SLOWPOKE_WELL_B1F,						   wSlowpokeWellB1FSceneID
	scene_var SLOWPOKE_WELL_B2F,						   wSlowpokeWellB2FSceneID
	scene_var ROUTE_103,								   wRoute35SceneID
	scene_var ROCKET_SHIP_BASE,							   wViridianGymSceneID
	scene_var ROUTE_104,							       wRoute33SceneID
	scene_var ROUTE_112_STAND_CITY_GATE,				   wRoute36RuinsOfAlphGateSceneID
	scene_var STAND_CITY,								   wFuchsiaCitySceneID
	scene_var STAND_ROCKET_HOUSE_1F,					   wSafariZoneWardensHomeSceneID
	scene_var STAND_ROCKET_HOUSE_2F,			    	   wSafariZoneWardensHome2FSceneID
	scene_var RADIO_TOWER_6F,							   wRadioTower6FSceneID
	scene_var WESTPORT_CITY,							   wGoldenrodCitySceneID
	scene_var BRASS_TOWER_5F,							   wTinTower5FSceneID
	scene_var KANTO_GYM,								   wCeladonGymSceneID
	scene_var KANTO_BATTLE_CLUB_B1F,					   wKantoBattleClubB1FSceneID
	scene_var KANTO_BATTLE_CLUB_1F,						   wKantoBattleClub1FSceneID
	scene_var CROWN_PASS,							       wUndergroundPathSceneID
	scene_var ROUTE_120,								   wRoute8SceneID
	scene_var TEKNOS_CITY,							       wEcruteakCitySceneID
	scene_var TEKNOS_AQUARIUM_1F,					       wOlivineLighthouse1FID
	scene_var TEKNOS_AQUARIUM_2F,					       wOlivineLighthouse2FID
	db -1
