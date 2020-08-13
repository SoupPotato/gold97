BugContestantPointers:
; there are NUM_BUG_CONTESTANTS + 1 entries
	dw BugContestant_BugCatcherDon ; this reverts back to the player
	dw BugContestant_BugCatcherDon
	dw BugContestant_BugCatcherEd
	dw BugContestant_CooltrainerMNick
	dw BugContestant_PokefanMWilliam
	dw BugContestant_BugCatcherBenny
	dw BugContestant_CamperBarry
	dw BugContestant_PicnickerCindy
	dw BugContestant_BugCatcherJosh
	dw BugContestant_YoungsterSamuel
	dw BugContestant_SchoolboyDanny

; contestant format:
;   db class, id
;   dbw 1st-place mon, score
;   dbw 2nd-place mon, score
;   dbw 3rd-place mon, score

BugContestant_BugCatcherDon:
	db BUG_CATCHER, DON
	dbw BEEDRILL,  300
	dbw VENONAT,   285
	dbw PARAS,     226

BugContestant_BugCatcherEd:
	db BUG_CATCHER, ED
	dbw VENOMOTH,  286
	dbw PARASECT,  251
	dbw ARIADOS,   237

BugContestant_CooltrainerMNick:
	db COOLTRAINERM, NICK
	dbw SCYTHER,    357
	dbw BEEDRILL,   349
	dbw PINSIR,     368

BugContestant_PokefanMWilliam:
	db POKEFANM, WILLIAM
	dbw PINSIR,     332
	dbw BUTTERFREE, 324
	dbw VENONAT,    321

BugContestant_BugCatcherBenny:
	db BUG_CATCHER, BUG_CATCHER_BENNY
	dbw BUTTERFREE, 318
	dbw PARAS,      295
	dbw VENONAT,    285

BugContestant_CamperBarry:
	db CAMPER, BARRY
	dbw PINSIR,     366
	dbw VENONAT,    329
	dbw PARAS,      314

BugContestant_PicnickerCindy:
	db PICNICKER, CINDY
	dbw ARIADOS, 	341
	dbw TRIPSTAR,     301
	dbw VENONAT,    264

BugContestant_BugCatcherJosh:
	db BUG_CATCHER, JOSH
	dbw SCYTHER,    326
	dbw BUTTERFREE, 292
	dbw BEEDRILL,   282

BugContestant_YoungsterSamuel:
	db YOUNGSTER, SAMUEL
	dbw ARIADOS,    270
	dbw BEEDRILL,   282
	dbw VENONAT,    251

BugContestant_SchoolboyDanny:
	db SCHOOLBOY, DANNY
	dbw BEEDRILL,   267
	dbw PARAS,      254
	dbw VENONAT,    259
