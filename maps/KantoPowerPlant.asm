	const_def 2
	const PLANT_SURGE
	const PP_VOLTORB1
	const PP_VOLTORB2
	const PP_VOLTORB3
	const PP_VOLTORB4
	const PP_VOLTORB5
	const PP_VOLTORB6
	const PP_VOLTORB7
	const PP_VOLTORB8
	const PP_ITEM1
	const PP_ITEM2
	const PP_ITEM3
	const PP_ITEM4

KantoPowerPlant_MapScripts:
	db 0 ; scene scripts

	db 0 ; callbacks

SurgeScript:
	faceplayer
	checkevent EVENT_WON_SURGE_BATTLE
	iftrue Surge_afterbattle
	opentext
	writetext Surge_beforebattletext
	waitbutton
	closetext
	winlosstext Surge_beatentext, 0
	loadtrainer LT_SURGE, LT_SURGE1
	startbattle
	reloadmapafterbattle
	setevent EVENT_WON_SURGE_BATTLE
	;fallthrough
	
Surge_afterbattle:
	checkevent EVENT_TOOK_THE_PICHU
	iftrue Surge_afterpichu
	opentext
	writetext SurgeTakeThisPichuText
	waitbutton
	checkcode VAR_PARTYCOUNT
	ifequal PARTY_LENGTH, .PartyFullSurge
	writetext SurgePlayerReceivedPichuText
	playsound SFX_CAUGHT_MON
	waitsfx
	givepoke PICHU, 15
	special GivePichu
	setevent EVENT_TOOK_THE_PICHU
	writetext SurgeExplainPichuMetronomeText
	waitbutton
	closetext
	end
	
.PartyFullSurge:
	writetext SurgePartyFullText
	waitbutton
	closetext
	end
	
Surge_afterpichu:
	opentext
	writetext SurgeFinalText
	waitbutton
	closetext
	end
	
Surge_beforebattletext:
	text "SURGE: Hey, you"
	line "little tyke!"
	
	para "What would make"
	line "a kid like you"
	cont "want to come out"
	cont "to this abandoned"
	cont "dump?"
	
	para "This area is where"
	line "I come to train"
	cont "my powerful"
	cont "ELECTRIC #MON!"
	
	para "If you came here"
	line "looking for a"
	cont "challenge, then"
	cont "you've got one!"

	para "I'll zap you just"
	line "like I did my"
	cont "enemies in war!"
	done
	
	
Surge_beatentext:
	text "SURGE: Arrrgh!"
	line "You are strong!"
	
	para "You're no normal"
	line "kid, that's for"
	cont "sure!"
	done
	
SurgeTakeThisPichuText:
	text "So what gives?"
	
	para "There's nothing"
	line "to be found in"
	cont "this old place"
	cont "besides the"
	cont "VOLTORB!"
	
	para "…"
	
	para "The gym challenge"
	line "is what you're"
	cont "here for?"
	
	para "Hah! Sorry kid"
	line "but I'm off duty"
	cont "since the LEAGUE"
	cont "expanded to the"
	cont "whole nation!"
	
	para "I might not have"
	line "a THUNDERBADGE to"
	cont "give, but maybe"
	cont "you'd be a good"
	cont "trainer for"
	cont "this PICHU that"
	cont "I hatched!"
	
	para "I'm no good with"
	line "kids! So take"
	cont "good care of it!"
	done

SurgeExplainPichuMetronomeText:
	text "That PICHU knows"
	line "a special move!"
	
	para "EGG hatched"
	line "#MON often do!"
	done


SurgePlayerReceivedPichuText:
	text "<PLAYER> received"
	line "PICHU!"
	done
	
SurgePartyFullText:
	text "Might want to go"
	line "make room in your"
	cont "party first!"
	done

SurgeFinalText:
	text "Good luck with"
	line "the INDIGO GYM!"
	
	para "You're gonna need"
	line "it!"
	done

;----------------------------------------------------------------------------------------

Voltorb1:
	faceplayer
	opentext
	writetext VoltorbText
	cry VOLTORB
	pause 15
	closetext
	setevent EVENT_PP_VOLTORB1
	loadwildmon VOLTORB, 40
	startbattle
	disappear PP_VOLTORB1
	reloadmapafterbattle
	end
	
Voltorb2:
	faceplayer
	opentext
	writetext VoltorbText
	cry VOLTORB
	pause 15
	closetext
	setevent EVENT_PP_VOLTORB2
	loadwildmon VOLTORB, 40
	startbattle
	disappear PP_VOLTORB2
	reloadmapafterbattle
	end
	
	
Voltorb3:
	faceplayer
	opentext
	writetext VoltorbText
	cry VOLTORB
	pause 15
	closetext
	setevent EVENT_PP_VOLTORB3
	loadwildmon VOLTORB, 40
	startbattle
	disappear PP_VOLTORB3
	reloadmapafterbattle
	end
	
	
Voltorb4:
	faceplayer
	opentext
	writetext VoltorbText
	cry ELECTRODE
	pause 15
	closetext
	setevent EVENT_PP_VOLTORB4
	loadwildmon ELECTRODE, 43
	startbattle
	disappear PP_VOLTORB4
	reloadmapafterbattle
	end
	
	
Voltorb5:
	faceplayer
	opentext
	writetext VoltorbText
	cry VOLTORB
	pause 15
	closetext
	setevent EVENT_PP_VOLTORB5
	loadwildmon VOLTORB, 40
	startbattle
	disappear PP_VOLTORB5
	reloadmapafterbattle
	end
	
	
Voltorb6:
	faceplayer
	opentext
	writetext VoltorbText
	cry VOLTORB
	pause 15
	closetext
	setevent EVENT_PP_VOLTORB6
	loadwildmon VOLTORB, 40
	startbattle
	disappear PP_VOLTORB6
	reloadmapafterbattle
	end
	
	
Voltorb7:
	faceplayer
	opentext
	writetext VoltorbText
	cry ELECTRODE
	pause 15
	closetext
	setevent EVENT_PP_VOLTORB7
	loadwildmon ELECTRODE, 43
	startbattle
	disappear PP_VOLTORB7
	reloadmapafterbattle
	end
	
	
Voltorb8:
	faceplayer
	opentext
	writetext VoltorbText
	cry VOLTORB
	pause 15
	closetext
	setevent EVENT_PP_VOLTORB8
	loadwildmon VOLTORB, 40
	startbattle
	disappear PP_VOLTORB8
	reloadmapafterbattle
	end
	
	
VoltorbText:
	text "Bzzzt!"
	done

PPItem1:
	itemball CARBOS
	
PPItem2:
	itemball HP_UP
	
PPItem3:
	itemball RARE_CANDY
	
PPItem4:
	itemball TM_THUNDERPUNCH


KantoPowerPlant_MapEvents:
	db 0, 0 ; filler

	db 3 ; warp events
	warp_event  4, 35, KANTO_REGION, 36
	warp_event  0, 10, KANTO_REGION, 36
	warp_event  5, 35, KANTO_REGION, 36

	db 0 ; coord events

	db 0 ; bg events

	db 13 ; object events
	object_event  4,  8, SPRITE_SURGE_NEW, SPRITEMOVEDATA_SPINRANDOM_SLOW, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, SurgeScript, -1
	object_event  9, 18, SPRITE_POKE_BALL, SPRITEMOVEDATA_STILL, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, Voltorb1, -1
	object_event 34, 19, SPRITE_POKE_BALL, SPRITEMOVEDATA_STILL, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, Voltorb2, -1
	object_event 17, 24, SPRITE_POKE_BALL, SPRITEMOVEDATA_STILL, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, Voltorb3, -1
	object_event 32,  5, SPRITE_POKE_BALL, SPRITEMOVEDATA_STILL, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, Voltorb4, -1
	object_event 18, 31, SPRITE_POKE_BALL, SPRITEMOVEDATA_STILL, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, Voltorb5, -1
	object_event 25, 28, SPRITE_POKE_BALL, SPRITEMOVEDATA_STILL, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, Voltorb6, -1
	object_event 21, 19, SPRITE_POKE_BALL, SPRITEMOVEDATA_STILL, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, Voltorb7, -1
	object_event 36, 31, SPRITE_POKE_BALL, SPRITEMOVEDATA_STILL, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, Voltorb8, -1
	object_event  7, 27, SPRITE_POKE_BALL, SPRITEMOVEDATA_STILL, 0, 0, -1, -1, 0, OBJECTTYPE_ITEMBALL, 0, PPItem1, EVENT_PP_ITEM1
	object_event 27, 15, SPRITE_POKE_BALL, SPRITEMOVEDATA_STILL, 0, 0, -1, -1, 0, OBJECTTYPE_ITEMBALL, 0, PPItem2, EVENT_PP_ITEM2
	object_event 34,  3, SPRITE_POKE_BALL, SPRITEMOVEDATA_STILL, 0, 0, -1, -1, 0, OBJECTTYPE_ITEMBALL, 0, PPItem3, EVENT_PP_ITEM3
	object_event 26,  32, SPRITE_POKE_BALL, SPRITEMOVEDATA_STILL, 0, 0, -1, -1, 0, OBJECTTYPE_ITEMBALL, 0, PPItem4, EVENT_PP_ITEM4
	