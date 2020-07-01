	const_def 2 ; object constants
	const OLIVINECAFE_SAILOR1
	const OLIVINECAFE_FISHING_GURU
	const OLIVINECAFE_SAILOR2
	const OLIVINECAFE_CLERK

OlivineCafe_MapScripts:
	db 0 ; scene scripts

	db 0 ; callbacks

OlivineCafeStrengthSailorScript:
	faceplayer
	opentext
	checkevent EVENT_GOT_HM02_FLY
	iftrue .GotStrength
	writetext OlivineCafeStrengthSailorText
	buttonsound
	verbosegiveitem HM_FLY
	setevent EVENT_GOT_HM02_FLY
.GotStrength:
	writetext OlivineCafeStrengthSailorText_GotStrength
	waitbutton
	closetext
	end
	
OlivineCafeClerkScript:
	jumptextfaceplayer OlivineCafeClerkText

OlivineCafeFishingGuruScript:
	jumptextfaceplayer OlivineCafeFishingGuruText

OlivineCafeSailorScript:
	jumptextfaceplayer OlivineCafeSailorText

OlivineCafeStrengthSailorText:
	text "Hah! Sailing is"
	line "such an outdated"
	cont "way to travel!"
	para "Walking is too!"
	para "Why not have your"
	line "#MON FLY you"
	cont "everywhere?"
	done

OlivineCafeStrengthSailorText_GotStrength:
	text "Ships still have"
	line "to set sail since"
	para "FLYING #MON"
	line "can't carry cargo."
	done

OlivineCafeFishingGuruText:
	text "NUTYPE CAFE's"
	line "menu is chock full"

	para "of hearty fare for"
	line "hungry people!"
	done

OlivineCafeSailorText:
	text "Whenever I roll"
	line "into this town, I"

	para "always visit the"
	line "NUTYPE CAFE."

	para "Everything here is"
	line "delicious!"
	done
	
OlivineCafeClerkText
	text "Welcome to NUTYPE"
	line "CAFE!"
	para "We have food to"
	line "satisfy every"
	cont "appetite!"
	done

OlivineCafe_MapEvents:
	db 0, 0 ; filler

	db 2 ; warp events
	warp_event  2,  7, OLIVINE_CITY, 7
	warp_event  3,  7, OLIVINE_CITY, 7

	db 0 ; coord events

	db 0 ; bg events

	db 4 ; object events
	object_event  6,  3, SPRITE_SAILOR, SPRITEMOVEDATA_STANDING_UP, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, OlivineCafeStrengthSailorScript, -1
	object_event  3,  1, SPRITE_TEACHER, SPRITEMOVEDATA_WALK_LEFT_RIGHT, 1, 1, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, OlivineCafeFishingGuruScript, -1
	object_event  5,  6, SPRITE_JANINE, SPRITEMOVEDATA_STANDING_RIGHT, 1, 1, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, OlivineCafeSailorScript, -1
	object_event  1,  1, SPRITE_CLERK, SPRITEMOVEDATA_STANDING_DOWN, 1, 1, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, OlivineCafeClerkScript, -1
