; See data/maps/scenes.asm for which maps have scene variables.
; Each scene_script and coord_event is associated with a current scene ID.

; Scene variables default to 0.
SCENE_DEFAULT  EQU 0
; Often a map will have a one-time default event for scene 0, and switch to a
; do-nothing scene 1 when the event finishes.
SCENE_FINISHED EQU 1

; wPokecenter2FSceneID
	const_def 1
	const SCENE_POKECENTER2F_LEAVE_TRADE_CENTER       ; 1
	const SCENE_POKECENTER2F_LEAVE_COLOSSEUM          ; 2
	const SCENE_POKECENTER2F_LEAVE_TIME_CAPSULE       ; 3
	const SCENE_POKECENTER2F_LEAVE_MOBILE_TRADE_ROOM  ; 4
	const SCENE_POKECENTER2F_LEAVE_MOBILE_BATTLE_ROOM ; 5

; wPowerPlantSceneID
	const_def
	const SCENE_POWERPLANT_NOTHING               ; 0
	const SCENE_POWERPLANT_GUARD_GETS_PHONE_CALL ; 1

; wCeruleanGymSceneID
	const_def
	const SCENE_CERULEANGYM_NOTHING        ; 0
	const SCENE_CERULEANGYM_GRUNT_RUNS_OUT ; 1

; wRoute25SceneID
	const_def
	const SCENE_ROUTE25_NOTHING     ; 0
	const SCENE_ROUTE25_MISTYS_DATE ; 1

; wLancesRoomSceneID
	const_def 1
	const SCENE_LANCESROOM_APPROACH_LANCE ; 1
	
; wNewBarkSceneID
	const_def 1
	const SCENE_TEACHER_STOPS
	const SCENE_NEW_BARK_NOTHING

; wElmEntranceSceneID
	const_def 1
	const SCENE_HEAD_TO_THE_BACK
	const SCENE_ELM_ENTRANCE_NOTHING
	const SCENE_ELM_ENTRANCE_BATTLE
	const SCENE_ELM_ENTRANCE_DAISY

; wElmsLabSceneID
	const_def 1
	const SCENE_ELMSLAB_CANT_LEAVE            ; 1
	const SCENE_ELMSLAB_NOTHING               ; 2
	const SCENE_ELMSLAB_MEET_OFFICER          ; 3
	const SCENE_ELMSLAB_UNUSED                ; 4
	const SCENE_ELMSLAB_AIDE_GIVES_POTION     ; 5
	const SCENE_ELMSLAB_AIDE_GIVES_POKE_BALLS ; 6

; wRoute29SceneID
	const_def
	const SCENE_ROUTE29_NOTHING        ; 0
	const SCENE_ROUTE29_CATCH_TUTORIAL ; 1

; wCherrygroveCitySceneID
	const_def
	const SCENE_CHERRYGROVECITY_NOTHING    ; 0
	const SCENE_CHERRYGROVECITY_MEET_RIVAL ; 1

; wRoute32SceneID
	const_def 1
	const SCENE_ROUTE32_OFFER_SLOWPOKETAIL ; 1
	const SCENE_ROUTE32_NOTHING            ; 2

; wRoute35NationalParkGateSceneID
	const_def
	const SCENE_ROUTE35NATIONALPARKGATE_NOTHING             ; 0
	const SCENE_ROUTE35NATIONALPARKGATE_UNUSED              ; 1
	const SCENE_ROUTE35NATIONALPARKGATE_LEAVE_CONTEST_EARLY ; 2

; wRoute36SceneID
	const_def
	const SCENE_ROUTE36_NOTHING ; 0
	const SCENE_ROUTE36_SILVER ; 1

; wRoute36NationalParkGateSceneID
	const_def
	const SCENE_ROUTE36NATIONALPARKGATE_NOTHING             ; 0
	const SCENE_ROUTE36NATIONALPARKGATE_UNUSED              ; 1
	const SCENE_ROUTE36NATIONALPARKGATE_LEAVE_CONTEST_EARLY ; 2

; wAzaleaTownSceneID
	const_def
	const SCENE_AZALEATOWN_NOTHING              ; 0
	const SCENE_AZALEATOWN_RIVAL_BATTLE         ; 1
	const SCENE_AZALEATOWN_KURT_RETURNS_GS_BALL ; 2

; wRoute42SceneID
	const_def
	const SCENE_ROUTE42_NOTHING ; 0
	const SCENE_ROUTE42_SUICUNE ; 1

; wCianwoodCitySceneID
	const_def
	const SCENE_CIANWOODCITY_NOTHING            ; 0
	const SCENE_CIANWOODCITY_SUICUNE_AND_EUSINE ; 1

; wBurnedTower1FSceneID
	const_def 1
	const SCENE_BURNEDTOWER1F_RIVAL_BATTLE ; 1
	const SCENE_BURNEDTOWER1F_NOTHING      ; 2

; wRadioTower5FSceneID
	const_def 1
	const SCENE_RADIOTOWER5F_ROCKET_BOSS ; 1
	const SCENE_RADIOTOWER5F_NOTHING     ; 2

; wRuinsOfAlphOutsideSceneID
	const_def
	const SCENE_RUINSOFALPHOUTSIDE_NOTHING       ; 0
	const SCENE_RUINSOFALPHOUTSIDE_GET_UNOWN_DEX ; 1

; wRuinsOfAlphResearchCenterSceneID
	const_def
	const SCENE_RUINSOFALPHRESEARCHCENTER_NOTHING       ; 0
	const SCENE_RUINSOFALPHRESEARCHCENTER_GET_UNOWN_DEX ; 1

; wRuinsOfAlphInnerChamberSceneID
	const_def
	const SCENE_RUINSOFALPHINNERCHAMBER_NOTHING          ; 0
	const SCENE_RUINSOFALPHINNERCHAMBER_STRANGE_PRESENCE ; 1

; wMahoganyMart1FSceneID
	const_def
	const SCENE_MAHOGANYMART1F_NOTHING               ; 0
	const SCENE_MAHOGANYMART1F_LANCE_UNCOVERS_STAIRS ; 1

; wTeamRocketBaseB1FSceneID	
	const_def 2
	const SCENE_TEAMROCKETBASEB1F_NOTHING
	const SCENE_EXECUTIVE

; wTeamRocketBaseB2FSceneID
	const_def 1
	const SCENE_TEAMROCKETBASEB2F_ROCKET_BOSS ; 1
	const SCENE_TEAMROCKETBASEB2F_ELECTRODES  ; 2
	const SCENE_TEAMROCKETBASEB2F_NOTHING     ; 3

; wTeamRocketBaseB3FSceneID
	const_def 1
	const SCENE_TEAMROCKETBASEB3F_RIVAL_ENCOUNTER ; 1
	const SCENE_TEAMROCKETBASEB3F_ROCKET_BOSS     ; 2
	const SCENE_TEAMROCKETBASEB3F_NOTHING         ; 3

; wDragonsDenB1FSceneID
	const_def
	const SCENE_DRAGONSDENB1F_NOTHING        ; 0
	const SCENE_DRAGONSDENB1F_CLAIR_GIVES_TM ; 1

; wOlivinePortSceneID
	const_def 1
	const SCENE_OLIVINEPORT_LEAVE_SHIP ; 1

; wVermilionPortSceneID
	const_def 1
	const SCENE_VERMILIONPORT_LEAVE_SHIP ; 1

; wFastShip1FSceneID
	const_def 1
	const SCENE_FASTSHIP1F_ENTER_SHIP   ; 1
	const SCENE_FASTSHIP1F_MEET_GRANDPA ; 2
	
; wKurtsHouseSceneID
	const_def 1
	const SCENE_KURTS_HOUSE_NOTHING
	
; wTekuPortSceneID
	const_def 1
	const SCENE_TEKU_PORT_NOTHING
	
; wSlowpokeWellB1FSceneID
	const_def 1
	const SCENE_SLOWPOKE1_NOTHING
	
; wSlowpokeWellB2FSceneID
	const_def 1
	const SCENE_SLOWPOKE2_NOTHING
	
;wRoute35SceneID
	const_def 1
	const SCENE_ROUTE_35_NOTHING
	
;wViridianGymSceneID
	const_def 1
	const SCENE_VIRIDIAN_GYM_IMPOSTER
	
;wRoute33SceneID
	const_def 1
	const SCENE_ROUTE33_NOTHING
	
;wRoute36RuinsOfAlphSceneID
	const_def 1
	const SCENE_ROUTE_36_RUINS_OF_ALPH_GATE_NOTHING
	
;wFuchsiaCitySceneID
	const_def 1
	const SCENE_FUCHSIA_CITY_IMPOSTER
	
;wSafariZoneWardensHomeSceneID
	const_def 1
	const SCENE_SAFARI_ZONE_WARDENS_HOME_NOTHING
	const SCENE_SAFARI_ZONE_WARDENS_HOME_BASE_UNCOVERED

;wSafariZoneWardensHome2FSceneID
	const_def 1
	const SCENE_SAFARI_ZONE_WARDENS_HOME_2F_NOTHING
	
;wRadioTower6FSceneID
	const_def 1
	const SCENE_RADIOTOWER6F_NOTHING
	
;wGoldenrodCitySceneID
	const_def 1
	const SCENE_GOLDENROD_CITY_RIVAL
	
;wOldCitySceneID
	const_def 1
	const SCENE_KURTS_HOUSE_LOCKED

;wTinTower5FSceneID
	const_def 1
	const SCENE_HO_OH_EVENT
	
;wCeladonGymSceneID
	const_def 1
	const SCENE_RED_IS_HERE
	
;wKantoBattleClubB1FSceneID
	const_def 1
	const SCENE_BATTLE_CLUB_BATTLE

;wKantoBattleClub1FSceneID
	const_def 1
	const SCENE_BATTLE_CLUB_1F_NOTHING
	
;wUndergroundPathSceneID
	const_def 1
	const SCENE_UNDERGROUND_NOTHING
	
;wSaffronGymSceneID
	const_def 1
	const SCENE_SAFFRON_GYM_TRAINER_2
	const SCENE_SAFFRON_GYM_NOTHING
	
;wRoute8SceneID
	const_def 1
	const SCENE_ROUTE8_NOTHING
	const SCENE_ROUTE8_GIRL_AND_GRAMPS
	
;wEcruteakCitySceneID
	const_def 1
	const SCENE_ECRUTEAK_NOTHING
	const SCENE_ECRUTEAK_ROCKET_TAKEOVER
	
;wOlivineLighthouse1FID
	const_def 1
	const SCENE_AQUARIUM_ROCKET_TAKEOVER_1F_NOTHING
	const SCENE_AQUARIUM_ROCKET_TAKEOVER_1F
	
;wOlivineLighthouse2FID
	const_def 1
	const SCENE_AQUARIUM_ROCKET_TAKEOVER_2F_NOTHING
	const SCENE_AQUARIUM_ROCKET_TAKEOVER_2F
