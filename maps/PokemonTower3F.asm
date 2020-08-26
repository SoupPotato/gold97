	const_def 2
	const TOWER3MED1
	const TOWER3MED2
	const TOWER3MED3
	const TOWER3MED4
	const TOWER3PANGSHI
	const TOWER3TRAINERSAGE
	const TOWER3ITEMBALL

PokemonTower3F_MapScripts:
	db 0 ; scene scripts

	db 0 ; callbacks

GengarTombScript:
	checkflag EVENT_BEAT_TOWER_GENGAR
	iftrue defeatedGengar
	opentext
	writetext GengarAttackingText
	cry GENGAR
	pause 15
	closetext
	loadwildmon GENGAR, 50
	startbattle
	if_equal $1, DidntBeatGengar
	if_equal $2, DidntBeatGengar
	setflag EVENT_BEAT_TOWER_GENGAR
	reloadmapafterbattle
	end
	
DidntBeatGengar:
	reloadmapafterbattle
	end
	
defeatedGengar:
	opentext
	writetext GengarTombAfterText
	waitbutton
	closetext
	end

GengarAttackingText:
	text "Something is"
	line "emanating from"
	cont "inside the old"
	cont "mausoleum…"
	
	para "GARAH!"
	done

GengarTombAfterText:
	text "The mausoleum"
	line "has gone quiet…"
	done

;----------------------------------------------------------------------------------------------------

Tower3Medium1:
	checkflag EVENT_BEAT_TOWER_GENGAR
	iftrue Tower3Medium1After
	jumptextfaceplayer Tower3Medium1WearyText
	
Tower3Medium1After:
	jumptextfaceplayer Tower3Medium1AfterText
	
Tower3Medium1WearyText:
	text "The spirit…"
	line "It's too strong…"
	done
	
Tower3Medium1AfterText:
	text "Thank you for"
	line "freeing us!"
	done

Tower3Medium2:
	checkflag EVENT_BEAT_TOWER_GENGAR
	iftrue Tower3Medium2After
	jumptextfaceplayer Tower3Medium2WearyText
	
Tower3Medium2After:
	jumptextfaceplayer Tower3Medium2AfterText
	
Tower3Medium2WearyText:
	text "We can't contain"
	line "this force for"
	cont "much longer…"
	done
	
Tower3Medium2AfterText:
	text "The spirits are"
	line "at rest again…"
	done

Tower3Medium3:
	checkflag EVENT_BEAT_TOWER_GENGAR
	iftrue Tower3Medium3After
	jumptextfaceplayer Tower3Medium3WearyText
	
Tower3Medium3After:
	jumptextfaceplayer Tower3Medium3AfterText
	
Tower3Medium3WearyText:
	text "If we stop, the"
	line "spirit could"
	cont "get loose and"
	cont "attack the town!"
	done
	
Tower3Medium3AfterText:
	text "We owe you much"
	line "gratitude, child!"
	done

Tower3Medium4:
	checkflag EVENT_BEAT_TOWER_GENGAR
	iftrue Tower3Medium4After
	jumptextfaceplayer Tower3Medium4WearyText
	
Tower3Medium4After:
	jumptextfaceplayer Tower3Medium4AfterText
	
Tower3Medium4WearyText:
	text "Hurrgh… I'm being"
	line "overwhelmed with"
	cont "supernatural ki!"
	done
	
Tower3Medium4AfterText:
	text "The spirits of"
	line "#MON TOWER"
	cont "rest easy thanks"
	cont "to your help…"
	done


Tower3Pangshi:
	checkflag EVENT_BEAT_TOWER_GENGAR
	iftrue Tower3PangshiAfter
	faceplayer
	opentext
	writetext Tower3PangshiWearyText
	writebyte PANGSHI
	special PlaySlowCry
	waitbutton
	closetext
	end
	
Tower3PangshiAfter:
	faceplayer
	opentext
	writetext Tower3PangshiAfterText
	cry PANGSHI
	waitbutton
	closetext
	end
	
Tower3PangshiWearyText:
	text "PANGSHI: Shii…"
	
	para "It's looking"
	line "weary…"
	done
	
Tower3PangshiAfterText:
	text "PANGSHI: Shii!"
	
	para "It's looking"
	line "stiff but happy!"
	done


TrainerSageWang:
	trainer SAGE, WANG, EVENT_BEAT_SAGE_WANG, SageWangSeenText, SageWangBeatenText, 0, .Script

.Script:
	endifjustbattled
	opentext
	writetext SageWangAfterBattleText
	waitbutton
	closetext
	end


SageWangSeenText:
	text "There's paranormal"
	line "activity in here!"
	
	para "Please leave at"
	line "once!"
	done

SageWangBeatenText:
	text "Strong…"
	done

SageWangAfterBattleText:
	text "Perhaps you are"
	line "strong enough to"
	cont "help us contain"
	cont "the spirit!"
	
	para "Please! Go help!"
	done


Tower3Itemball:
	itemball ESCAPE_ROPE


PokemonTower3F_MapEvents:
	db 0, 0 ; filler

	db 1 ; warp events
	warp_event  3,  9, POKEMON_TOWER_2F, 2

	db 0 ; coord events

	db 2 ; bg events
	bg_event 10,  7, BGEVENT_READ, GengarTombScript
	bg_event 11,  7, BGEVENT_READ, GengarTombScript

	db 7 ; object events
	object_event  8, 11, SPRITE_GRANNY, SPRITEMOVEDATA_SPINRANDOM_FAST, 0, 0, -1, -1, PAL_NPC_BROWN, OBJECTTYPE_SCRIPT, 0, Tower3Medium1, -1
	object_event  8,  9, SPRITE_GRANNY, SPRITEMOVEDATA_SPINRANDOM_FAST, 0, 0, -1, -1, PAL_NPC_BROWN, OBJECTTYPE_SCRIPT, 0, Tower3Medium2, -1
	object_event 13,  9, SPRITE_GRANNY, SPRITEMOVEDATA_SPINRANDOM_FAST, 0, 0, -1, -1, PAL_NPC_BROWN, OBJECTTYPE_SCRIPT, 0, Tower3Medium3, -1
	object_event 13, 11, SPRITE_GRANNY, SPRITEMOVEDATA_SPINRANDOM_FAST, 0, 0, -1, -1, PAL_NPC_BROWN, OBJECTTYPE_SCRIPT, 0, Tower3Medium4, -1
	object_event 11, 10, SPRITE_MONSTER, SPRITEMOVEDATA_SPINRANDOM_FAST, 0, 0, -1, -1, PAL_NPC_BLUE, OBJECTTYPE_SCRIPT, 0, Tower3Pangshi, -1
	object_event  5,  7, SPRITE_SAGE, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, PAL_NPC_BLUE, OBJECTTYPE_TRAINER, 3, TrainerSageWang, EVENT_BEAT_SAGE_WANG
	object_event 12,  2, SPRITE_POKE_BALL, SPRITEMOVEDATA_STILL, 0, 0, -1, -1, 0, OBJECTTYPE_ITEMBALL, 0, Tower3Itemball, EVENT_TOWER3_ITEMBALL
	