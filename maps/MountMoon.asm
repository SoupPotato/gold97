MountMoon_MapScripts:
	db 0 ; scene scripts

	db 0 ; callbacks


MountMoon_MapEvents:
	db 0, 0 ; filler

	db 8 ; warp events
	warp_event  2,  3, KANTO_REGION, 22 ; route 3 exit
	warp_event 14, 15, KANTO_REGION, 23 ; route 4 exit
	warp_event 13,  3, MOUNT_MOON, 7
	warp_event 15, 11, MOUNT_MOON, 8
	warp_event 24,  5, MOUNT_MOON_SQUARE, 1
	warp_event 24, 15, MOUNT_MOON_SQUARE, 2
	warp_event 25,  3, MOUNT_MOON, 3
	warp_event 25, 13, MOUNT_MOON, 4

	db 0 ; coord events

	db 0 ; bg events

	db 0 ; object events
