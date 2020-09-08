	const_def 2 ; object constants
	const KIKAIPC_NURSE
	const KPC_BLACKBELT1
	const KPC_BLACKBELT2

KikaiPokecenter1F_MapScripts:
	db 0 ; scene scripts

	db 0 ; callbacks

KikaiPokecenter1FNurseScript:
	jumpstd pokecenternurse
	
KikaiPokecenter1FBB1Script:
	jumptextfaceplayer KKPCBBText1

KikaiPokecenter1FBB2Script:
	jumptextfaceplayer KKPCBBText2


KKPCBBText1:
	text "I've been in this"
	line "#MON CENTER"
	cont "12 times in the"
	cont "last week!"
	done

KKPCBBText2:
	text "This place makes"
	line "me wish people"
	cont "could be healed"
	cont "so easily."
	
	para "If they could,"
	line "I would be able"
	cont "to train much"
	cont "harder!"
	done

KikaiPokecenter1F_MapEvents:
	db 0, 0 ; filler

	db 3 ; warp events
	warp_event  5,  7, KIKAI_VILLAGE, 1
	warp_event  6,  7, KIKAI_VILLAGE, 1
	warp_event  0,  7, POKECENTER_2F, 1

	db 0 ; coord events

	db 0 ; bg events

	db 3 ; object events
	object_event  5,  1, SPRITE_NURSE, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, KikaiPokecenter1FNurseScript, -1
	object_event  7,  4, SPRITE_BLACK_BELT, SPRITEMOVEDATA_WALK_LEFT_RIGHT, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, KikaiPokecenter1FBB1Script, -1
	object_event  11,  6, SPRITE_BLACK_BELT, SPRITEMOVEDATA_WALK_LEFT_RIGHT, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, KikaiPokecenter1FBB2Script, -1
