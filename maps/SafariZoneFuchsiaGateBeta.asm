	const_def 2 
	const GATESAFARIMAN
	
SafariZoneFuchsiaGateBeta_MapScripts:
	db 0 ; scene scripts

	db 0 ; callbacks


SafariGateMan:
	jumptextfaceplayer SafariGateManText
	
SafariGateManText:
	text "Welcome to the"
	line "SAFARI ZONE!"
	
	para "Catch as much"
	line "as you please!"
	done


SafariZoneFuchsiaGateBeta_MapEvents:
	db 0, 0 ; filler

	db 4 ; warp events
	warp_event  4,  0, SAFARI_ZONE_BETA, 1
	warp_event  5,  0, SAFARI_ZONE_BETA, 2
	warp_event  4,  7, KANTO_REGION, 35
	warp_event  5,  7, KANTO_REGION, 35

	db 0 ; coord events

	db 0 ; bg events

	db 1 ; object events
	object_event  0,  4, SPRITE_OFFICER, SPRITEMOVEDATA_STANDING_RIGHT, 0, 0, -1, -1, PAL_NPC_BLUE, OBJECTTYPE_SCRIPT, 0, SafariGateMan, -1
