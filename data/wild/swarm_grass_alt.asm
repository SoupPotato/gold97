; Pokémon swarms in grass

SwarmGrassWildMonsAlt:

; Hoppip swarm
	map_id ROUTE_101
	db 10 percent, 10 percent, 10 percent ; encounter rates: morn/day/nite
	; morn
	db 2, HOPPIP
	db 2, RATTATA
	db 4, PIDGEY
	db 3, HOPPIP
	db 4, RATTATA
	db 4, HOPPIP
	db 4, PIDGEY
	; day
	db 2, HOPPIP
	db 2, RATTATA
	db 4, PIDGEY
	db 3, HOPPIP
	db 4, RATTATA
	db 4, HOPPIP
	db 4, PIDGEY
	; nite
	db 2, HOPPIP
	db 2, RATTATA
	db 4, HOOTHOOT
	db 3, HOPPIP
	db 4, RATTATA
	db 4, HOOTHOOT
	db 4, HOOTHOOT

; Kurstraw swarm
	map_id BRASS_TOWER_2F
	db 2 percent, 2 percent, 2 percent ; encounter rates: morn/day/nite
	; morn
	db 5, RATTATA
	db 6, KURSTRAW
	db 7, RATTATA
	db 5, KURSTRAW
	db 8, KURSTRAW
	db 7, RATTATA
	db 7, RATTATA
	; day
	db 5, RATTATA
	db 6, KURSTRAW
	db 7, RATTATA
	db 5, KURSTRAW
	db 8, KURSTRAW
	db 7, RATTATA
	db 7, RATTATA
	; nite
	db 5, GASTLY
	db 6, KURSTRAW
	db 7, GASTLY
	db 5, KURSTRAW
	db 8, KURSTRAW
	db 7, RATTATA
	db 7, RATTATA

	db -1 ; end
