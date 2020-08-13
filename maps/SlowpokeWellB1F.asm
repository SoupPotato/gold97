	const_def 2 ; object constants
	const SLOWPOKE_WELL_B1F_SILVER


SlowpokeWellB1F_MapScripts:
	db 2 ; scene scripts
	scene_script .SceneSlowpoke1Rival ; SCENE_DEFAULT
	scene_script .SceneSlowpoke1Nothing ;

	db 0 ; callbacks

.SceneSlowpoke1Rival:
	showemote EMOTE_SHOCK, SLOWPOKE_WELL_B1F_SILVER, 15
	special FadeOutMusic
	pause 15
	turnobject SLOWPOKE_WELL_B1F_SILVER, DOWN
	pause 15
	applymovement PLAYER, WellPlayerWalksToSilver
	applymovement SLOWPOKE_WELL_B1F_SILVER, WellSilverWalksToPlayer
	playmusic MUSIC_RIVAL_ENCOUNTER
	opentext
	writetext BurnedTowerSilver_BeforeText
	waitbutton
	closetext
	checkevent EVENT_GOT_CRUIZE_FROM_ELM
	iftrue .cruise
	checkevent EVENT_GOT_CHIKORITA_FROM_ELM
	iftrue .CHIKORITA
	winlosstext BurnedTowerSilver_WinText, BurnedTowerSilver_LossText
	;setlasttalked SLOWPOKE_WELL_B1F_SILVER
	loadtrainer RIVAL1, RIVAL1_3_CRUIZE
	startbattle
	dontrestartmapmusic
	reloadmapafterbattle
	jump .returnfrombattle

.cruise
	winlosstext BurnedTowerSilver_WinText, BurnedTowerSilver_LossText
	;setlasttalked SLOWPOKE_WELL_B1F_SILVER
	loadtrainer RIVAL1, RIVAL1_3_CHIKORITA
	startbattle
	dontrestartmapmusic
	reloadmapafterbattle
	jump .returnfrombattle

.CHIKORITA
	winlosstext BurnedTowerSilver_WinText, BurnedTowerSilver_LossText
	;setlasttalked SLOWPOKE_WELL_B1F_SILVER
	loadtrainer RIVAL1, RIVAL1_3_FLAMBEAR
	startbattle
	dontrestartmapmusic
	reloadmapafterbattle
	jump .returnfrombattle

.returnfrombattle
	playmusic MUSIC_RIVAL_AFTER
	opentext
	writetext BurnedTowerSilver_AfterText1
	waitbutton
	closetext
	applymovement SLOWPOKE_WELL_B1F_SILVER, WellSilverWalksToRoom2
	playsound SFX_EXIT_BUILDING
	disappear SLOWPOKE_WELL_B1F_SILVER
	setscene SCENE_SLOWPOKE1_NOTHING
	setevent EVENT_GOT_SQUIRTBOTTLE
	setevent EVENT_EXPLODING_TRAP_21
	special HealParty
	special FadeOutMusic
	waitsfx
	playmapmusic
	pause 15
	end
	


.SceneSlowpoke1Nothing
	end
	
WellPlayerWalksToSilver:
	step UP
	step UP
	step_end
	
WellSilverWalksToPlayer:
	step RIGHT
	turn_head DOWN
	step_end
	
WellSilverWalksToRoom2:
	step UP
	step UP
	step UP
	step_end

SlowpokeWellB1FSilverScript:
	end
;<……>
BurnedTowerSilver_BeforeText:
	text "<PLAY_G>!"
	para "PROF.OAK and BLUE"
	line "are waiting for"
	para "us deeper in the"
	line "well."
	para "But I wanted to"
	line "wait here, cause"
	para "I knew you'd be"
	line "showing up soon!"
	para "My team is so"
	line "much stronger than"
	para "it was last time"
	line "I saw you."
	para "Here! Let me show"
	line "you!"
	done

BurnedTowerSilver_WinText:
	text "Huh."

	para "I've raised my"
	line "team to be the"
	para "strongest, but"
	line "still I lose…"
	done
BurnedTowerSilver_AfterText1:
	text "Ah, whatever."
	para "I just gotta make"
	line "them even stronger"
	cont "than they are now!"
	para "Anyways, we should"
	line "probably go on"
	para "ahead to meet up"
	line "with the others!"
	done

BurnedTowerSilver_LossText:
	text "Yeah!"
	para "I'm the best!"
	done

BurnedTowerSilver_AfterText2:
	text "Humph!"

	para "What are you doing"
	line "falling into a"

	para "hole? Some genius"
	line "you are!"

	para "Serves you right!"
	done
	
Text_RivalGreets:
	text "yo"
	done


SlowpokeWellB1F_MapEvents:
	db 0, 0 ; filler

	db 2 ; warp events
	warp_event  9, 11, BIRDON_TOWN, 6
	warp_event  9,  1, SLOWPOKE_WELL_B2F, 1

	db 0 ; coord events

	db 0 ; bg events

	db 1 ; object events
	object_event  8,  8, SPRITE_SILVER, SPRITEMOVEDATA_STANDING_LEFT, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, SlowpokeWellB1FSilverScript, EVENT_GOT_SQUIRTBOTTLE

