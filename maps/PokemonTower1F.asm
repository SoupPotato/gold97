PokemonTower1F_MapScripts:
	db 0 ; scene scripts

	db 0 ; callbacks

PokemonTower1F_MapEvents:
	db 0, 0 ; filler

	db 3 ; warp events
	warp_event 10, 17, KANTO_REGION, 41
	warp_event 11, 17, KANTO_REGION, 41
	warp_event 18,  9, POKEMON_TOWER_2F, 1

	db 0 ; coord events

	db 0 ; bg events

	db 0 ; object events
