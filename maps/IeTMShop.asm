	const_def 2 
	const IETMSHOP_CLERK1
	const IETMSHOP_CLERK2
	const IETMSHOP_NPC1
	const IETMSHOP_NPC2
	const IETMSHOP_NPC3

IeTMShop_MapScripts:
	db 0 ; scene scripts

	db 0 ; callbacks

IeMartClerkScript:
	opentext
	pokemart MARTTYPE_STANDARD, MART_VERMILION
	closetext
	end

IeTMClerkScript:
	opentext
	pokemart MARTTYPE_STANDARD, MART_IE_TM_SHOP
	closetext
	end

IeShopNPC1Script:
	jumptextfaceplayer IeShopNPC1Text

IeShopNPC1Text:
	text "The TMs sold here"
	line "are the most"
	cont "popular for use"
	cont "at the BATTLE"
	cont "TOWER!"
	
	para "Any trainer worth"
	line "their salt should"
	cont "know how to use"
	cont "these moves!"
	done

IeShopNPC2Script:
	jumptextfaceplayer IeShopNPC2Text
	
IeShopNPC2Text:
	text "REST and SLEEP"
	line "TALK are a common"
	cont "pair of moves to"
	cont "carry on a"
	cont "#MON that you"
	cont "want to keep"
	cont "both healthy and"
	cont "attacking."
	done
	
	
IeShopNPC3Script:
	jumptextfaceplayer IeShopNPC3Text

IeShopNPC3Text:
	text "CURSE is a very"
	line "pecuiliar move"
	cont "that's great for"
	cont "slow #MON."
	
	para "They won't have"
	line "anything but a"
	cont "net gain from"
	cont "using it!"
	done



IeTMShop_MapEvents:
	db 0, 0 ; filler

	db 2 ; warp events
	warp_event  7, 11, IE_TOWN, 2
	warp_event  8, 11, IE_TOWN, 3

	db 0 ; coord events

	db 0 ; bg events

	db 5 ; object events
	object_event  6,  1, SPRITE_CLERK, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, IeMartClerkScript, -1
	object_event  9,  1, SPRITE_CLERK, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, IeTMClerkScript, -1
	object_event 14,  2, SPRITE_COOLTRAINER_M, SPRITEMOVEDATA_WALK_LEFT_RIGHT, 0, 1, -1, -1, PAL_NPC_RED, OBJECTTYPE_SCRIPT, 0, IeShopNPC1Script, -1
	object_event  4,  6, SPRITE_COOLTRAINER_F, SPRITEMOVEDATA_WALK_UP_DOWN, 0, 1, -1, -1, PAL_NPC_RED, OBJECTTYPE_SCRIPT, 0, IeShopNPC2Script, -1
	object_event 10,  8, SPRITE_SUPER_NERD, SPRITEMOVEDATA_WALK_UP_DOWN, 0, 1, -1, -1, PAL_NPC_BLUE, OBJECTTYPE_SCRIPT, 0, IeShopNPC3Script, -1
