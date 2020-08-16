PokemonTower2F_MapScripts:
	db 0 ; scene scripts

	db 0 ; callbacks

PokemonTower2F_MapEvents:
	db 0, 0 ; filler

	db 2 ; warp events
	warp_event 18,  9, POKEMON_TOWER_1F, 3
	warp_event  3,  9, POKEMON_TOWER_3F, 1

	db 0 ; coord events

	db 0 ; bg events

	db 0 ; object events
