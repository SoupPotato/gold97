	const_def 2 ; object constants
	const MOUNTMORTAR1FINSIDE_BOULDER
	const MOUNTMORTAR1FINSIDE_POKE_BALL1
	const MOUNTMORTAR1FINSIDE_POKE_BALL2
	const MOUNTMORTAR1FINSIDE_POKE_BALL3
	const MOUNTMORTAR1FINSIDE_POKE_BALL4
	const MOUNTMORTAR1FINSIDE_POKE_BALL5
	const MOUNTMORTAR1FINSIDE_SUPER_NERD1
	const MOUNTMORTAR1FINSIDE_SUPER_NERD2
	const MOUNTMORTAR1FINSIDE_POKE_BALL6
	const MOUNTMORTAR1FINSIDE_POKE_BALL7
	const MOUNTMORTAR1FINSIDE_POKEFAN

JouleCave_MapScripts:
	db 0 ; scene scripts

	db 0 ; callbacks

TrainerPokemaniacMiller:
	trainer POKEMANIAC, MILLER, EVENT_BEAT_POKEMANIAC_MILLER, PokemaniacMillerSeenText, PokemaniacMillerBeatenText, 0, .Script

.Script:
	endifjustbattled
	opentext
	writetext PokemaniacMillerAfterBattleText
	waitbutton
	closetext
	end

TrainerSupernerdMarkus:
	trainer SUPER_NERD, MARKUS, EVENT_BEAT_SUPER_NERD_MARKUS, SupernerdMarkusSeenText, SupernerdMarkusBeatenText, 0, .Script

.Script:
	endifjustbattled
	opentext
	writetext SupernerdMarkusAfterBattleText
	waitbutton
	closetext
	end
	

TrainerHikerErik:
	trainer HIKER, ERIK, EVENT_BEAT_HIKER_ERIK, HikerErikSeenText, HikerErikBeatenText, 0, .Script

.Script:
	endifjustbattled
	opentext
	writetext HikerErikAfterBattleText
	waitbutton
	closetext
	end

MountMortar1FBoulder:
	jumpstd strengthboulder

JouleCaveEscapeRope:
	itemball ESCAPE_ROPE

JouleCaveMaxRevive:
	itemball MAX_REVIVE

JouleCaveHyperPotion:
	itemball HYPER_POTION

JouleCaveMaxPotion:
	itemball MAX_POTION

JouleCaveNugget:
	itemball NUGGET

JouleCaveIron:
	itemball IRON

JouleCaveUltraBall:
	itemball ULTRA_BALL

JouleCaveHiddenMaxRepel:
	hiddenitem MAX_REPEL, EVENT_MOUNT_MORTAR_1F_INSIDE_HIDDEN_MAX_REPEL
	
HikerErikSeenText:
	text "Be prepared for"
	line "anything!"

	para "Let me see if your"
	line "#MON have been"
	cont "raised properly!"
	done

HikerErikBeatenText:
	text "Oh, I lost that!"
	done

HikerErikAfterBattleText:
	text "I'll train here"
	line "until I get"
	cont "stronger!"
	done

PokemaniacMillerSeenText:
	text "I'm not losing"
	line "to you!"
	done

PokemaniacMillerBeatenText:
	text "I lost to some"
	line "kid…?"
	done

PokemaniacMillerAfterBattleText:
	text "I heard that a"
	line "rare bird some-"
	para "times roosts in"
	line "this mountain."
	para "I haven't been"
	line "able to find it,"
	cont "though."
	done

SupernerdMarkusSeenText:
	text "Hey! Woah!"
	done

SupernerdMarkusBeatenText:
	text "You startled me…"
	done

SupernerdMarkusAfterBattleText:
	text "I came to explore"
	line "MT.MONWAL, but"
	para "I haven't found"
	line "anything cool."
	done

JouleCave_MapEvents:
	db 0, 0 ; filler

	db 2 ; warp events
	warp_event  4, 33, SEASIDE_PATH, 2
	warp_event 35, 15, JOULE_CAVE_ZAPDOS_ROOM, 1

	db 0 ; coord events

	db 1 ; bg events
	bg_event 28, 19, BGEVENT_ITEM, JouleCaveHiddenMaxRepel

	db 11 ; object events
	object_event 11, 31, SPRITE_BOULDER, SPRITEMOVEDATA_STRENGTH_BOULDER, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, MountMortar1FBoulder, -1
	object_event 24, 26, SPRITE_POKE_BALL, SPRITEMOVEDATA_STILL, 0, 0, -1, -1, 0, OBJECTTYPE_ITEMBALL, 0, JouleCaveEscapeRope, EVENT_MOUNT_MORTAR_1F_INSIDE_ESCAPE_ROPE
	object_event 26,  2, SPRITE_POKE_BALL, SPRITEMOVEDATA_STILL, 0, 0, -1, -1, 0, OBJECTTYPE_ITEMBALL, 0, JouleCaveMaxRevive, EVENT_MOUNT_MORTAR_1F_INSIDE_MAX_REVIVE
	object_event 16, 19, SPRITE_POKE_BALL, SPRITEMOVEDATA_STILL, 0, 0, -1, -1, 0, OBJECTTYPE_ITEMBALL, 0, JouleCaveHyperPotion, EVENT_MOUNT_MORTAR_1F_INSIDE_HYPER_POTION
	object_event 27, 21, SPRITE_POKE_BALL, SPRITEMOVEDATA_STILL, 0, 0, -1, -1, 0, OBJECTTYPE_ITEMBALL, 0, JouleCaveMaxPotion, EVENT_MOUNT_MORTAR_1F_INSIDE_MAX_POTION
	object_event 46,  3, SPRITE_POKE_BALL, SPRITEMOVEDATA_STILL, 0, 0, -1, -1, 0, OBJECTTYPE_ITEMBALL, 0, JouleCaveNugget, EVENT_MOUNT_MORTAR_1F_INSIDE_NUGGET
	object_event 13,  8, SPRITE_SUPER_NERD, SPRITEMOVEDATA_STANDING_LEFT, 0, 0, -1, -1, PAL_NPC_BLUE, OBJECTTYPE_TRAINER, 3, TrainerPokemaniacMiller, -1
	object_event 47, 10, SPRITE_SUPER_NERD, SPRITEMOVEDATA_SPINRANDOM_FAST, 0, 0, -1, -1, PAL_NPC_BROWN, OBJECTTYPE_TRAINER, 3, TrainerSupernerdMarkus, -1
	object_event 24, 33, SPRITE_POKE_BALL, SPRITEMOVEDATA_STILL, 0, 0, -1, -1, 0, OBJECTTYPE_ITEMBALL, 0, JouleCaveIron, EVENT_MOUNT_MORTAR_1F_INSIDE_IRON
	object_event  4,  8, SPRITE_POKE_BALL, SPRITEMOVEDATA_STILL, 0, 0, -1, -1, 0, OBJECTTYPE_ITEMBALL, 0, JouleCaveUltraBall, EVENT_MOUNT_MORTAR_1F_INSIDE_ULTRA_BALL
	object_event 25, 16, SPRITE_POKEFAN_M, SPRITEMOVEDATA_STANDING_RIGHT, 0, 0, -1, -1, PAL_NPC_BROWN, OBJECTTYPE_TRAINER, 3, TrainerHikerErik, -1
