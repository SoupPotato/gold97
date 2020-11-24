	const_def 2
	const IEHOUSENPC1
	const IEHOUSENPC2

IeHouse1_MapScripts:
	db 0 ; scene scripts

	db 0 ; callbacks

Ie1NPC1Script:
	jumptextfaceplayer Ie1NPC1Text
	
Ie1NPC2Script:
	jumptextfaceplayer Ie1NPC2Text
	
Ie1NPC1Text:
	text "When I was young"
	line "the CASTLE"
	cont "MOUNTAIN was"
	cont "the pride of our"
	cont "whole town."
	
	para "Now it's fallen"
	line "into ruin."
	cont "Truly it is a"
	cont "shame…"
	done
	
Ie1NPC2Text:
	text "The CASTLE was"
	line "an important"
	cont "historical land-"
	cont "mark and was"
	cont "treated as such."
	
	para "That changed when"
	line "something fierce"
	cont "moved into the"
	cont "cavern beneath"
	cont "the castle."
	
	para "Allegedly a GREEN"
	line "DRAGON appeared"
	cont "as a result of"
	cont "the curse of a"
	cont "sad woman who"
	cont "perished there."
	done



IeHouse1_MapEvents:
	db 0, 0 ; filler

	db 2 ; warp events
	warp_event  4,  7, IE_TOWN, 4
	warp_event  5,  7, IE_TOWN, 4

	db 0 ; coord events

	db 0 ; bg events

	db 2 ; object events
	object_event  4,  3, SPRITE_GRANNY, SPRITEMOVEDATA_STANDING_RIGHT, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, Ie1NPC1Script, -1
	object_event  7,  4, SPRITE_POKEFAN_M, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, Ie1NPC2Script, -1
