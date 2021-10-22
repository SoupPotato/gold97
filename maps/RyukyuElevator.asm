RyukyuElevator_MapScripts:
	db 0 ; scene scripts

	db 0 ; callbacks
	

RyukyuElevatorScript:
	opentext
	elevator RyukyuElevatorData
	closetext
	iffalse .Done
	pause 5
	playsound SFX_ELEVATOR
	earthquake 60
	waitsfx
.Done:
	end

RyukyuElevatorData:
	db 5 ; floors
	elevfloor FLOOR_1F,  9, RYUKYU_HOTEL
	elevfloor FLOOR_2F,  1, RYUKYU_HOTEL_2F
	elevfloor FLOOR_3F,  1, RYUKYU_HOTEL_3F
	elevfloor FLOOR_4F,  1, RYUKYU_HOTEL_4F
	elevfloor FLOOR_5F,  1, RYUKYU_HOTEL_5F
	db -1 ; end

RyukyuElevator_MapEvents:
	db 0, 0 ; filler

	db 2 ; warp events
	warp_event  1,  3, RYUKYU_HOTEL, -1
	warp_event  2,  3, RYUKYU_HOTEL, -1


	db 0 ; coord events

	db 1 ; bg events
	bg_event  3,  0, BGEVENT_READ, RyukyuElevatorScript

	db 0 ; object events
