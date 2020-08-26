	const_def 2
	const TOWER1RECEPTIONIST
	const TOWER1WOMAN
	const TOWER1BALDMAN
	const TOWER1GIRL
	const TOWER1MEDIUM

PokemonTower1F_MapScripts:
	db 0 ; scene scripts

	db 0 ; callbacks

Tower1Receptionist:
	checkevent EVENT_BEAT_TOWER_GENGAR
	iftrue Tower1ReceptionistAfter
	jumptextfaceplayer Tower1ReceptionistScaredText
	
Tower1ReceptionistAfter:
	jumptextfaceplayer Tower1ReceptionistAfterText
	
Tower1ReceptionistScaredText:
	text "There's currently"
	line "a disturbance in"
	cont "the TOWER, please"
	cont "avoid the upper"
	cont "floors."
	done
	
Tower1ReceptionistAfterText:
	text "#MON TOWER was"
	line "erected in the"
	cont "memory of #MON"
	cont "that had died."
	done

Tower1Teacher:
	checkevent EVENT_BEAT_TOWER_GENGAR
	iftrue Tower1TeacherAfter
	jumptextfaceplayer Tower1TeacherScaredText
	
Tower1TeacherAfter:
	jumptextfaceplayer Tower1TeacherAfterText
	
Tower1TeacherScaredText:
	text "I came to pray"
	line "for my departed"
	cont "#MON, but the"
	cont "upper floors"
	cont "are under attack."
	
	para "Please do"
	line "something!"
	done
	
Tower1TeacherAfterText:
	text "Now I can pray"
	line "in peace, thank"
	cont "you."
	done


Tower1Pokefan:
	checkevent EVENT_BEAT_TOWER_GENGAR
	iftrue Tower1PokefanAfter
	jumptextfaceplayer Tower1PokefanScaredText
	
Tower1PokefanAfter:
	jumptextfaceplayer Tower1PokefanAfterText
	
Tower1PokefanScaredText:
	text "W-what's going"
	line "on here? Is it"
	cont "really safe to"
	cont "come in?"
	done
	
Tower1PokefanAfterText:
	text "Whew! What a"
	line "relief, now"
	cont "I can pay my"
	cont "proper respects."
	done


Tower1Lass:
	checkevent EVENT_BEAT_TOWER_GENGAR
	iftrue Tower1LassAfter
	jumptextfaceplayer Tower1LassScaredText
	
Tower1LassAfter:
	jumptextfaceplayer Tower1LassAfterText
	
Tower1LassScaredText:
	text "Aiyee! I want"
	line "to leave but"
	cont "I'm so frozen"
	cont "stiff that I"
	cont "can't!"
	done
	
Tower1LassAfterText:
	text "Thank you so"
	line "much for getting"
	cont "rid of that"
	cont "poltergeist!"
	done


Tower1Medium:
	checkevent EVENT_BEAT_TOWER_GENGAR
	iftrue Tower1MediumAfter
	jumptextfaceplayer Tower1MediumScaredText
	
Tower1MediumAfter:
	jumptextfaceplayer Tower1MediumAfterText
	
Tower1MediumScaredText:
	text "I am a MEDIUM!"
	line "There are spirits"
	cont "up to mischief"
	cont "once again!"
	done
	
Tower1MediumAfterText:
	text "The spirits have"
	line "calmed down!"
	done

PokemonTower1F_MapEvents:
	db 0, 0 ; filler

	db 3 ; warp events
	warp_event 10, 17, KANTO_REGION, 41
	warp_event 11, 17, KANTO_REGION, 41
	warp_event 18,  9, POKEMON_TOWER_2F, 1

	db 0 ; coord events

	db 0 ; bg events

	db 5 ; object events
	object_event 14, 14, SPRITE_LINK_RECEPTIONIST, SPRITEMOVEDATA_STANDING_LEFT, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, Tower1Receptionist, -1
	object_event 12,  4, SPRITE_TEACHER, SPRITEMOVEDATA_WANDER, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, Tower1Teacher, -1
	object_event  5,  8, SPRITE_POKEFAN_M, SPRITEMOVEDATA_WANDER, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, Tower1Pokefan, -1
	object_event  8, 13, SPRITE_LASS, SPRITEMOVEDATA_WANDER, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, Tower1Lass, -1
	object_event 18,  8, SPRITE_GRANNY, SPRITEMOVEDATA_STANDING_LEFT, 0, 0, -1, -1, PAL_NPC_BROWN, OBJECTTYPE_SCRIPT, 0, Tower1Medium, -1
