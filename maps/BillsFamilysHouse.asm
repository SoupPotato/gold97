	const_def 2 ; object constants
	const BILLSFAMILYSHOUSE_BILL
	const BILLSFAMILYSHOUSE_POKEFAN_F
	const BILLSFAMILYSHOUSE_TWIN

BillsFamilysHouse_MapScripts:
	db 0 ; scene scripts

	db 0 ; callbacks

BillScript:
	faceplayer
	opentext
	checkevent EVENT_GOT_HM01_CUT
	iftrue .GotCut
	writetext BillTakeThisCutText
	waitbutton
	verbosegiveitem HM_CUT
	setevent EVENT_GOT_HM01_CUT
	setevent EVENT_ROUTE36_GARDENER
	clearevent EVENT_ROUTE36_GARDENER_CHOPPED
	writetext BillGoodLuckText
	waitbutton
	closetext
	end

.GotCut:
	writetext BillAdventuresGoingWellText
	waitbutton
	closetext
	end

BillsMomScript:
	faceplayer
	opentext
	checkevent EVENT_MET_BILL
	iffalse .HaventMetBill
	writetext BillsMomText
	waitbutton
	closetext
	end

.HaventMetBill:
	writetext BillsMomText
	waitbutton
	closetext
	end

BillsSisterScript:
	faceplayer
	opentext
	checkcellnum PHONE_BILL
	iftrue .GotBillsNumber
	writetext BillsSisterUsefulNumberText
	askforphonenumber PHONE_BILL
	ifequal PHONE_CONTACTS_FULL, .NoRoom
	ifequal PHONE_CONTACT_REFUSED, .Refused
	waitsfx
	addcellnum PHONE_BILL
	writetext RecordedBillsNumberText
	playsound SFX_REGISTER_PHONE_NUMBER
	waitsfx
	buttonsound
.GotBillsNumber:
	writetext BillsSisterStorageSystemText
	waitbutton
	closetext
	end

.Refused:
	writetext BillsSisterRefusedNumberText
	waitbutton
	closetext
	end

.NoRoom:
	writetext BillsSisterPhoneFullText
	buttonsound
	jump .Refused

BillsHouseBookshelf1:
	jumpstd picturebookshelf

BillsHouseBookshelf2:
	jumpstd magazinebookshelf

BillsHouseRadio:
	jumpstd radio2

BillTakeThisCutText:
	text "BILL: Hello!"
	line "Well, now allow"
	para "me to introduce"
	line "myself!"
	para "I'm BILL! I made"
	line "the PC system that"
	para "trainers use to"
	line "store #MON in!"
	para "I hope you find it"
	line "useful."
	para "If you're planning"
	line "on traveling"
	para "around, though,"
	line "I have something"
	para "else that you may"
	line "find useful."
	done

BillGoodLuckText:
	text "CUT allows your"
	line "#MON to chop"
	cont "away small trees!"
	para "It may prove"
	line "indespensible!"
	para "And remember,"
	line "unlike a TM, an HM"
	para "can be reused as"
	line "many times as you"
	cont "want to!"
	para "Well, good luck on"
	line "your pursuits as"
	cont "a trainer!"
	para "I'll be around!"
	done

BillAdventuresGoingWellText:
	text "BILL: Hi, <PLAY_G>!"
	line "I hope your"
	para "adventures are"
	line "going well!"
	done

BillsMomText:
	text "My husband was"
	line "once known as a"

	para "#MANIAC."
	line "BILL must have"

	para "taken after his"
	line "father."
	done

BillsSisterUsefulNumberText:
	text "Are you a trainer?"

	para "I've got a useful"
	line "phone number for"
	cont "you."
	done

RecordedBillsNumberText:
	text "<PLAYER> recorded"
	line "BILL's number."
	done

BillsSisterRefusedNumberText:
	text "My brother made"
	line "the PC #MON"
	cont "storage system."

	para "I was going to"
	line "give you BILL's"
	cont "number…"
	done

BillsSisterPhoneFullText:
	text "You can't record"
	line "any more numbers."
	done

BillsSisterStorageSystemText:
	text "My big brother"
	line "BILL made the PC"

	para "#MON storage"
	line "system."
	done

BillsFamilysHouse_MapEvents:
	db 0, 0 ; filler

	db 2 ; warp events
	warp_event  3,  7, PAGOTA_CITY, 14
	warp_event  4,  7, PAGOTA_CITY, 14

	db 0 ; coord events

	db 3 ; bg events
	bg_event  2,  1, BGEVENT_READ, BillsHouseBookshelf2
	bg_event  3,  1, BGEVENT_READ, BillsHouseBookshelf1
	bg_event  6,  1, BGEVENT_READ, BillsHouseRadio

	db 3 ; object events
	object_event  5,  4, SPRITE_BILL, SPRITEMOVEDATA_STANDING_LEFT, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, BillScript, EVENT_MET_BILL
	object_event  2,  3, SPRITE_POKEFAN_F, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, BillsMomScript, -1
	object_event  7,  4, SPRITE_TWIN, SPRITEMOVEDATA_WANDER, 1, 1, -1, -1, PAL_NPC_GREEN, OBJECTTYPE_SCRIPT, 0, BillsSisterScript, -1
