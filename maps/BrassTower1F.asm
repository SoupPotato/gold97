	const_def 2 ; object constants
	const SPROUTTOWER1F_SAGE1
	const SPROUTTOWER1F_SAGE2
	const SPROUTTOWER1F_SAGE3
	const SPROUTTOWER1F_SAGE4
	const SPROUTTOWER1F_POKE_BALL

BrassTower1F_MapScripts:
	db 0 ; scene scripts

	db 0 ; callbacks


TrainerSageChow:
	trainer SAGE, CHOW, EVENT_BEAT_SAGE_CHOW, SageChowSeenText, SageChowBeatenText, 0, .Script

.Script:
	endifjustbattled
	opentext
	writetext SageChowAfterBattleText
	waitbutton
	closetext
	end

BrassTower1FParlyzHeal:
	itemball PARLYZ_HEAL

BrassTower1FStatue:
	jumptext BrassTower1FStatueText
	
	
BrassTower1FSign:
	setevent EVENT_READ_5F1F_SIGN
	jumptext BrassTower1FSignText
	

SageChowSeenText:
	text "We stand guard in"
	line "this tower."

	para "Here, we express"
	line "our gratitude to"
	cont "honor all #MON."
	done

SageChowBeatenText:
	text "Th-Thank you!"
	done

SageChowAfterBattleText:
	text "All living beings"
	line "coexist through"
	cont "cooperation."

	para "We must always be"
	line "thankful for this."
	done
	
TrainerSageNico:
	trainer SAGE, NICO, EVENT_BEAT_SAGE_NICO, SageNicoSeenText, SageNicoBeatenText, 0, .Script

.Script:
	endifjustbattled
	opentext
	writetext SageNicoAfterBattleText
	waitbutton
	closetext
	end


SageNicoSeenText:
	text "The BRASS TOWER"
	line "was built many"
	cont "centuries ago."
	para "It is our honor"
	line "to keep sacred"
	cont "this place."
	done


SageNicoBeatenText:
	text "Perhaps you"
	line "understand."
	done

SageNicoAfterBattleText:
	text "We hope that this"
	line "tower will"
	para "continue to stand"
	line "as long as it has"
	cont "already stood."
	done

TrainerSageJin:
	trainer SAGE, JIN, EVENT_BEAT_SAGE_JIN, SageJinSeenText, SageJinBeatenText, 0, .Script

.Script:
	endifjustbattled
	opentext
	writetext SageJinAfterBattleText
	waitbutton
	closetext
	end


SageJinSeenText:
	text "All #MON have"
	line "a lesson to teach"
	cont "us."
	para "It is our"
	line "responsibility to"
	para "take the time to"
	line "stop and listen."
	
	done

SageJinBeatenText:
	text "Do you hear?"
	done

SageJinAfterBattleText:
	text "#MON teach much"
	line "to humans."
	para "More than most"
	line "people realize."
	done
	
TrainerSageTroy:
	trainer SAGE, TROY, EVENT_BEAT_SAGE_TROY, SageTroySeenText, SageTroyBeatenText, 0, .Script

.Script:
	endifjustbattled
	opentext
	writetext SageTroyAfterBattleText
	waitbutton
	closetext
	end


SageTroySeenText:
	text "Why was this tower"
	line "built?"
	para "No one knows."
	para "But it once served"
	line "as a nest for"
	cont "a bird of legends."
	done

SageTroyBeatenText:
	text "Be sure to honor"
	line "this place."
	done

SageTroyAfterBattleText:
	text "Be deliberate with"
	line "each step as you"
	cont "climb the tower."
	done

BrassTower1FStatueText:
	text "A #MON statue…"

	para "It looks very"
	line "distinguished."
	done
	
BrassTower1FSignText:
	text "This is the"
	line "BRASS TOWER."
	para "An ancient"
	line "monument that's"
	para "dedicated to the"
	line "#MON that"
	para "enrich the lives"
	line "of humans."
	para "Carefully read"
	line "the information"
	para "by each statue"
	line "above to"
	para "understand what"
	line "it teaches."
	done

BrassTower1F_MapEvents:
	db 0, 0 ; filler

	db 3 ; warp events
	warp_event  5, 11, PAGOTA_CITY, 7
	warp_event  6, 11, PAGOTA_CITY, 11
	warp_event  0,  1, BRASS_TOWER_2F, 1


	db 0 ; coord events

	db 1 ; bg events
	bg_event  4,  1, BGEVENT_READ, BrassTower1FSign
	

	db 5 ; object events
	object_event  0,  2, SPRITE_SAGE, SPRITEMOVEDATA_STANDING_RIGHT, 0, 0, -1, -1, PAL_NPC_BLUE, OBJECTTYPE_TRAINER, 3, TrainerSageChow, EVENT_OLD_CITY_EARL
	object_event  2, 11, SPRITE_SAGE, SPRITEMOVEDATA_STANDING_UP, 0, 0, -1, -1, PAL_NPC_BLUE, OBJECTTYPE_TRAINER, 2, TrainerSageNico, EVENT_OLD_CITY_EARL
	object_event  7,  1, SPRITE_SAGE, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, PAL_NPC_BLUE, OBJECTTYPE_TRAINER, 1, TrainerSageJin, EVENT_OLD_CITY_EARL
	object_event 11,  7, SPRITE_SAGE, SPRITEMOVEDATA_STANDING_LEFT, 0, 0, -1, -1, PAL_NPC_BLUE, OBJECTTYPE_TRAINER, 2, TrainerSageTroy, EVENT_OLD_CITY_EARL
	object_event  0,  5, SPRITE_POKE_BALL, SPRITEMOVEDATA_STILL, 0, 0, -1, -1, 0, OBJECTTYPE_ITEMBALL, 0, BrassTower1FParlyzHeal, EVENT_SPROUT_TOWER1F_PARLYZ_HEAL
