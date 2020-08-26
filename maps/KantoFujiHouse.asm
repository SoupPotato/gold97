	const_def 2
	const MRFUJISHOUSE_SUPER_NERD
	const MRFUJISHOUSE_LASS
	const MRFUJISHOUSE_PSYDUCK
	const MRFUJISHOUSE_NIDORINO
	const MRFUJISHOUSE_PIDGEY
	const MRFUJI_HIMSELF

KantoFujiHouse_MapScripts:
	db 0 ; scene scripts

	db 0 ; callbacks


MrFujisHouseSuperNerdScript:
	jumptextfaceplayer MrFujisHouseSuperNerdText

MrFujisHouseLassScript:
	jumptextfaceplayer MrFujisHouseLassText

MrFujisPsyduck:
	opentext
	writetext MrFujisPsyduckText
	cry PSYDUCK
	waitbutton
	closetext
	end

MrFujisNidorino:
	opentext
	writetext MrFujisNidorinoText
	cry NIDORINO
	waitbutton
	closetext
	end

MrFujisPidgey:
	opentext
	writetext MrFujisPidgeyText
	cry PIDGEY
	waitbutton
	closetext
	end


MrFujisHouseSuperNerdText:
	text "This is really"
	line "MR.FUJI's house."

	para "He's really kind!"

	para "He looks after"
	line "abandoned and"
	cont "orphaned #MON!"
	done

MrFujisHouseLassText:
	text "Some cold-hearted"
	line "people stop caring"
	cont "for their #MON."

	para "Grandpa takes in"
	line "the poor homeless"

	para "#MON and takes"
	line "care of them."
	done

MrFujisPsyduckText:
	text "PSYDUCK: Gu-guwa?"
	done

MrFujisNidorinoText:
	text "NIDORINO: Gyun!"
	done

MrFujisPidgeyText:
	text "PIDGEY: Pijji!"
	done

MrFuji:
	checkevent EVENT_GOT_CLEANSE_TAG
	iftrue MrFujiFinal
	checkevent EVENT_BEAT_TOWER_GENGAR
	iftrue MrFujiAfter
	jumptextfaceplayer MrFujiEventText
	
MrFujiAfter:
	faceplayer
	opentext
	writetext MrFujiAfterText
	waitbutton
	verbosegiveitem CLEANSE_TAG
	iffalse .NoRoom
	setevent EVENT_GOT_CLEANSE_TAG
	writetext FujiCleanseTagText
	waitbutton
.NoRoom:
	closetext
	end
	
MrFujiFinal:
	jumptextfaceplayer FujiFinalText
	
MrFujiEventText:
	text "MR.FUJI: Welcome."

	para "Hmm… You appear to"
	line "be raising your"

	para "#MON in a kind"
	line "and loving manner."
	
	para "The strongest of"
	line "#MON trainers"
	cont "are those that are"
	cont "kind of heart and"
	cont "warm of soul."
	
	para "I have a favor"
	line "to ask of you…"
	
	para "There's something"
	line "going on inside"
	cont "#MON TOWER."
	
	para "I can trust you"
	line "to investigate."
	
	para "Come see me when"
	line "it's resolved."
	done
	
MrFujiAfterText:
	text "Ah! So the source"
	line "of the haunting"
	cont "was an ornery"
	cont "GENGAR?"
	
	para "It may not seem"
	line "so, but that is"
	cont "a relief to hear."
	
	para "Last time #MON"
	line "TOWER saw such a"
	cont "disturbance was"
	cont "when it was"
	cont "attacked by TEAM"
	cont "ROCKET."
	
	para "The damage they"
	line "caused was"
	cont "irreparable…"
	
	para "So, I'm glad to"
	line "hear it was just"
	cont "the misgivings"
	cont "of a GHOST"
	cont "#MON and not"
	cont "anything more."
	
	para "As promised, a"
	line "token of my"
	cont "thanks."
	done

FujiCleanseTagText:
	text "This is a CLEANSE"
	line "TAG, it will"
	cont "keep away wild"
	cont "#MON when"
	cont "held by one of"
	cont "yours."
	done

FujiFinalText:
	text "MR.FUJI: Please"
	line "continue treating"
	cont "your #MON"
	cont "with kindness."
	
	para "Always…"
	done

KantoFujiHouse_MapEvents:
	db 0, 0 ; filler

	db 2 ; warp events
	warp_event 4, 7, KANTO_REGION, 43
	warp_event 5, 7, KANTO_REGION, 43

	db 0 ; coord events

	db 0 ; bg events

	db 6 ; object events
	object_event  7,  3, SPRITE_SUPER_NERD, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, PAL_NPC_GREEN, OBJECTTYPE_SCRIPT, 0, MrFujisHouseSuperNerdScript, -1
	object_event  1,  4, SPRITE_LASS, SPRITEMOVEDATA_WANDER, 1, 1, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, MrFujisHouseLassScript, -1
	object_event  7,  4, SPRITE_RHYDON, SPRITEMOVEDATA_POKEMON, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, MrFujisPsyduck, -1
	object_event  5,  5, SPRITE_GROWLITHE, SPRITEMOVEDATA_POKEMON, 0, 0, -1, -1, PAL_NPC_BLUE, OBJECTTYPE_SCRIPT, 0, MrFujisNidorino, -1
	object_event  1,  3, SPRITE_MOLTRES, SPRITEMOVEDATA_POKEMON, 0, 0, -1, -1, PAL_NPC_BROWN, OBJECTTYPE_SCRIPT, 0, MrFujisPidgey, -1
	object_event  4,  2, SPRITE_GRAMPS, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, PAL_NPC_BLUE, OBJECTTYPE_SCRIPT, 0, MrFuji, -1
	