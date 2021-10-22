	const_def 2 ; object constants
	const RYUKYUTHEATRE_KIMONO_GIRL1
	const RYUKYUTHEATRE_KIMONO_GIRL2
	const RYUKYUTHEATRE_KIMONO_GIRL3
	const RYUKYUTHEATRE_KIMONO_GIRL4
	const RYUKYUTHEATRE_KIMONO_GIRL5
	const RYUKYUTHEATRE_KIMONO_GIRL6
	const RYUKYUTHEATRE_GENTLEMAN
	const RYUKYUTHEATRE_RHYDON
	const RYUKYUTHEATRE_COOLTRAINER_M
	const RYUKYUTHEATRE_GRANNY
	const RYUKYUTHEATRE_JANINE
	const RYUKYUTHEATRE_POKEFAN_M
	const RYUKYUTHEATRE_POKEFAN_F
	const RYUKYUTHEATRE_SUPER_NERD

RyukyuTheatre_MapScripts:
	db 0 ; scene scripts

	db 0 ; callbacks

TrainerKimonoGirlNaoko:
	trainer KIMONO_GIRL, NAOKO, EVENT_BEAT_KIMONO_GIRL_NAOKO, KimonoGirlNaokoSeenText, KimonoGirlNaokoBeatenText, 0, .Script

.Script:
	endifjustbattled
	opentext
	writetext KimonoGirlNaokoAfterBattleText
	waitbutton
	closetext
	end

TrainerKimonoGirlSayo:
	trainer KIMONO_GIRL, SAYO, EVENT_BEAT_KIMONO_GIRL_SAYO, KimonoGirlSayoSeenText, KimonoGirlSayoBeatenText, 0, .Script

.Script:
	endifjustbattled
	opentext
	writetext KimonoGirlSayoAfterBattleText
	waitbutton
	closetext
	end

TrainerKimonoGirlZuki:
	trainer KIMONO_GIRL, ZUKI, EVENT_BEAT_KIMONO_GIRL_ZUKI, KimonoGirlZukiSeenText, KimonoGirlZukiBeatenText, 0, .Script

.Script:
	endifjustbattled
	opentext
	writetext KimonoGirlZukiAfterBattleText
	waitbutton
	closetext
	end

TrainerKimonoGirlKuni:
	trainer KIMONO_GIRL, KUNI, EVENT_BEAT_KIMONO_GIRL_KUNI, KimonoGirlKuniSeenText, KimonoGirlKuniBeatenText, 0, .Script

.Script:
	endifjustbattled
	opentext
	writetext KimonoGirlKuniAfterBattleText
	waitbutton
	closetext
	end

TrainerKimonoGirlKyoko:
	trainer KIMONO_GIRL, KYOKO, EVENT_BEAT_KIMONO_GIRL_KYOKO, KimonoGirlKyokoSeenText, KimonoGirlKyokoBeatenText, 0, .Script

.Script:
	endifjustbattled
	opentext
	writetext KimonoGirlKyokoAfterBattleText
	waitbutton
	closetext
	end

TrainerKimonoGirlMiki:
	trainer KIMONO_GIRL, MIKI, EVENT_BEAT_KIMONO_GIRL_MIKI, KimonoGirlMikiSeenText, KimonoGirlMikiBeatenText, 0, .Script

.Script:
	endifjustbattled
	opentext
	writetext KimonoGirlMikiAfterBattleText
	waitbutton
	closetext
	end

RyukyuTheaterCoinsGuy:
	faceplayer
	opentext
	writetext CoinsGuyNeverLeftAScratchText
	waitbutton
	checkevent EVENT_GOT_COINS_FROM_GENTLEMAN
	iftrue CoinsGuyAlreadyGaveCoins
	checkevent EVENT_BEAT_KIMONO_GIRL_NAOKO
	iffalse .KimonoGirlsUndefeated
	checkevent EVENT_BEAT_KIMONO_GIRL_SAYO
	iffalse .KimonoGirlsUndefeated
	checkevent EVENT_BEAT_KIMONO_GIRL_ZUKI
	iffalse .KimonoGirlsUndefeated
	checkevent EVENT_BEAT_KIMONO_GIRL_KUNI
	iffalse .KimonoGirlsUndefeated
	checkevent EVENT_BEAT_KIMONO_GIRL_MIKI
	iffalse .KimonoGirlsUndefeated
	checkevent EVENT_BEAT_KIMONO_GIRL_KYOKO
	iffalse .KimonoGirlsUndefeated
	jump .GetCoins

.KimonoGirlsUndefeated:
	writetext CoinsGuyLadGiftText
	waitbutton
	closetext
	setevent EVENT_TALKED_TO_COINS_GUY
	end

.GetCoins:
	checkevent EVENT_TALKED_TO_COINS_GUY
	iftrue .ContinueGetCoins
	writetext CoinsGuyLadGiftText
	waitbutton
.ContinueGetCoins
	writetext CoinsGuyLikeADanceText
	buttonsound
	checkitem COIN_CASE
	iffalse .NoCoinCase
	checkcoins MAX_COINS - 1
	ifequal HAVE_MORE, .FullCoinCase
	stringtotext .coinname, MEM_BUFFER_1
	scall .GiveCoins
	givecoins 10000
	setevent EVENT_GOT_COINS_FROM_GENTLEMAN
	writetext CoinsGuyGotCoins
	waitbutton
	closetext
	end

.GiveCoins:
	jumpstd receiveitem
	end

.coinname
	db "COIN@"

.NoCoinCase:
	writetext CoinsGuyNoCoinCaseText
	waitbutton
	closetext
	end

.FullCoinCase:
	writetext CoinsGuyFullCoinCaseText
	waitbutton
	closetext
	end


CoinsGuyAlreadyGaveCoins:
	writetext CoinsGuyElegantKimonoGirlsText
	waitbutton
	closetext
	end

RyukyuTheaterRhydon:
	faceplayer
	opentext
	writetext RhydonText
	cry RHYDON
	waitbutton
	closetext
	end
	
RyukyuTheatreJanineScript:
	jumptextfaceplayer RyukyuTheatreJanineText

RyukyuTheatreCooltrainerMScript:
	jumptextfaceplayer RyukyuTheatreCooltrainerMText

RyukyuTheatreGrannyScript:
	jumptextfaceplayer RyukyuTheatreGrannyText

RyukyuTheatreFancyPanel:
	jumptext RyukyuTheatreFancyPanelText
	
RyukyuTheatrePokefanMScript:
	jumptextfaceplayer RyukyuTheatrePokefanMText
	
RyukyuTheatrePokefanFScript:
	jumptextfaceplayer RyukyuTheatrePokefanFText
	
RyukyuTheatreSuperNerdScript:
	jumptextfaceplayer RyukyuTheatreSuperNerdText
	
RyukyuTheatreSuperNerdText:
	text "This show is"
	line "great!"
	done

RyukyuTheatrePokefanMText:
	text "My wife loves to"
	line "stay at the RYUKYU"
	cont "HOTEL!"
	done
	
RyukyuTheatrePokefanFText:
	text "What a lovely"
	line "vacation this has"
	cont "been!"
	done
	
RyukyuTheatreJanineText:
	text "Nothing beats"
	line "dinner and a show"
	para "when I visit"
	line "RYUKYU CITY!"
	done
	
CoinsGuyNoCoinCaseText:
	text "Oh, what's this?"
	para "You have no COIN"
	line "CASE!"
	done
	
CoinsGuyFullCoinCaseText:
	text "Well, lad. Looks"
	line "like your case is"
	cont "already full!"
	done
	
CoinsGuyGotCoins:
	text "Go get yourself"
	line "something nice"
	para "from any of the"
	line "GAME CORNERS all"
	cont "around NIHON!"
	done

KimonoGirlNaokoSeenText:
	text "You have lovely"
	line "#MON. May I see"
	cont "them in battle?"
	done

KimonoGirlNaokoBeatenText:
	text "Oh, you are very"
	line "strong."
	done

KimonoGirlNaokoAfterBattleText:
	text "I enjoyed that"
	line "bout. I would like"
	cont "to see you again."
	done

KimonoGirlSayoSeenText:
	text "I always dance"
	line "with my #MON."

	para "Of course, I also"
	line "train them."
	done

KimonoGirlSayoBeatenText:
	text "Oh, so close!"
	line "I almost had you."
	done

KimonoGirlSayoAfterBattleText:
	text "Rhythm is impor-"
	line "tant for both"

	para "dancing and #-"
	line "MON."
	done

KimonoGirlKyokoSeenText:
	text "Dancing is a"
	line "great stress-"
	cont "reliever."
	done

KimonoGirlKyokoBeatenText:
	text "I believe I have"
	line "been defeated."
	done

KimonoGirlKyokoAfterBattleText:
	text "We learn a new"
	line "dance each month."
	done

KimonoGirlZukiSeenText:
	text "Isn't my barrette"
	line "pretty?"

	para "Oh. A #MON"
	line "battle?"
	done

KimonoGirlZukiBeatenText:
	text "I don't have any"
	line "#MON left…"
	done

KimonoGirlZukiAfterBattleText:
	text "I put a different"
	line "flower in my bar-"
	cont "rette every month."
	done

KimonoGirlKuniSeenText:
	text "Oh, you're a cute"
	line "trainer. Would you"
	cont "like to battle?"
	done

KimonoGirlKuniBeatenText:
	text "You're stronger"
	line "than you look."
	done

KimonoGirlKuniAfterBattleText:
	text "I trained a lot,"
	line "so I thought I was"

	para "a capable trainer."
	line "I guess I'm not."
	done

KimonoGirlMikiSeenText:
	text "Do you like my"
	line "dancing? I'm good"
	cont "at #MON too."
	done

KimonoGirlMikiBeatenText:
	text "Ooh, you're good"
	line "at #MON too."
	done

KimonoGirlMikiAfterBattleText:
	text "I can keep dancing"
	line "because there are"

	para "people who enjoy"
	line "what I do."

	para "My #MON keep my"
	line "spirits up too."
	done

CoinsGuyNeverLeftAScratchText:
	text "Not only are the"
	line "KIMONO GIRLS great"

	para "dancers, they're"
	line "also skilled at"
	cont "#MON."

	para "I always challenge"
	line "them, but I've"

	para "never even left a"
	line "scratch…"
	done

CoinsGuyLadGiftText:
	text "Lad! I've had a"
	line "bout of good luck"
	para "at the games of"
	line "chance upstairs!"
	para "If you can show me"
	line "that you can"
	para "defeat all of the"
	line "KIMONO GIRLS, I'll"
	para "fill your COIN"
	line "CASE to the brim!"
	done

CoinsGuyLikeADanceText:
	text "The way you bat-"
	line "tled, it was like"
	cont "watching a dance."

	para "It was a rare"
	line "treat to see!"

	para "Here, lad, as I"
	line "promised!"
	done

CoinsGuyElegantKimonoGirlsText:
	text "I wish my #MON"
	line "were as elegant as"
	cont "the KIMONO GIRLS…"
	done

RhydonText:
	text "RHYDON: Gugooh"
	line "gugogooh!"
	done

RyukyuTheatreCooltrainerMText:
	text "The KIMONO GIRLS'"
	line "dances are so"
	cont "mesmerizing…"
	done

RyukyuTheatreGrannyText:
	text "The KIMONO GIRLS"
	line "are so beautiful…"

	para "But they have to"
	line "go through rigor-"
	cont "ous training."

	para "And they have to"
	line "learn to follow"

	para "customs before ap-"
	line "pearing in public."

	para "But if you love"
	line "something, any-"
	cont "thing is possible."
	done

RyukyuTheatreFancyPanelText:
	text "It's a fancy panel"
	line "that's decorated"
	cont "with flowers."
	done

RyukyuTheatre_MapEvents:
	db 0, 0 ; filler

	db 1 ; warp events
	warp_event 19,  7, RYUKYU_RESTAURANT, 5


	db 0 ; coord events

	db 2 ; bg events
	bg_event 19,  2, BGEVENT_UP, RyukyuTheatreFancyPanel
	bg_event 19,  3, BGEVENT_UP, RyukyuTheatreFancyPanel

	db 14 ; object events
	object_event  1,  3, SPRITE_KIMONO_GIRL, SPRITEMOVEDATA_SPINCOUNTERCLOCKWISE, 0, 0, -1, -1, PAL_NPC_RED, OBJECTTYPE_TRAINER, 0, TrainerKimonoGirlNaoko, -1
	object_event  4,  2, SPRITE_KIMONO_GIRL, SPRITEMOVEDATA_SPINRANDOM_FAST, 0, 0, -1, -1, 0, OBJECTTYPE_TRAINER, 0, TrainerKimonoGirlSayo, -1
	object_event  7,  3, SPRITE_KIMONO_GIRL, SPRITEMOVEDATA_SPINRANDOM_SLOW, 0, 0, -1, -1, PAL_NPC_BROWN, OBJECTTYPE_TRAINER, 0, TrainerKimonoGirlZuki, -1
	object_event 10,  2, SPRITE_KIMONO_GIRL, SPRITEMOVEDATA_SPINRANDOM_FAST, 0, 0, -1, -1, PAL_NPC_BLUE, OBJECTTYPE_TRAINER, 0, TrainerKimonoGirlKuni, -1
	object_event 13,  3, SPRITE_KIMONO_GIRL, SPRITEMOVEDATA_SPINCLOCKWISE, 0, 0, -1, -1, 0, OBJECTTYPE_TRAINER, 0, TrainerKimonoGirlMiki, -1
	object_event 16,  2, SPRITE_KIMONO_GIRL, SPRITEMOVEDATA_SPINCOUNTERCLOCKWISE, 0, 0, -1, -1, PAL_NPC_GREEN, OBJECTTYPE_TRAINER, 0, TrainerKimonoGirlKyoko, -1
	object_event  3,  9, SPRITE_GENTLEMAN, SPRITEMOVEDATA_STANDING_UP, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, RyukyuTheaterCoinsGuy, -1
	object_event  2,  9, SPRITE_MONSTER, SPRITEMOVEDATA_STANDING_UP, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, RyukyuTheaterRhydon, -1
	object_event 11, 13, SPRITE_COOLTRAINER_M, SPRITEMOVEDATA_STANDING_UP, 0, 0, -1, -1, PAL_NPC_RED, OBJECTTYPE_SCRIPT, 0, RyukyuTheatreCooltrainerMScript, -1
	object_event  7,  9, SPRITE_GRANNY, SPRITEMOVEDATA_STANDING_UP, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, RyukyuTheatreGrannyScript, -1
	object_event 14,  9, SPRITE_BETA_GIRL, SPRITEMOVEDATA_STANDING_UP, 0, 0, -1, -1, PAL_NPC_RED, OBJECTTYPE_SCRIPT, 0, RyukyuTheatreJanineScript, -1
	object_event  6, 13, SPRITE_POKEFAN_M, SPRITEMOVEDATA_STANDING_UP, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, RyukyuTheatrePokefanMScript, -1
	object_event  7, 13, SPRITE_POKEFAN_F, SPRITEMOVEDATA_STANDING_UP, 0, 0, -1, -1, PAL_NPC_BLUE, OBJECTTYPE_SCRIPT, 0, RyukyuTheatrePokefanFScript, -1
	object_event 12, 17, SPRITE_SUPER_NERD, SPRITEMOVEDATA_STANDING_UP, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, RyukyuTheatreSuperNerdScript, -1


