; Pokémon swarms in grass

SwarmGrassWildMons:

; Nyanya swarm
	map_id ROUTE_101
	db 10 percent, 10 percent, 10 percent ; encounter rates: morn/day/nite
	; morn
	db 2, PIDGEY
	db 2, NYANYA
	db 4, PIDGEY
	db 3, NYANYA
	db 4, RATTATA
	db 4, HOPPIP
	db 4, HOPPIP
	; day
	db 2, PIDGEY
	db 2, NYANYA
	db 4, PIDGEY
	db 3, NYANYA
	db 4, RATTATA
	db 4, HOPPIP
	db 4, HOPPIP
	; nite
	db 2, HOOTHOOT
	db 2, NYANYA
	db 4, HOOTHOOT
	db 3, NYANYA
	db 4, RATTATA
	db 4, NYANYA
	db 4, RATTATA

; Paramite swarm
	map_id SILENT_HILLS
	db 10 percent, 10 percent, 10 percent ; encounter rates: morn/day/nite
	; morn
	db 4, CATERPIE
	db 4, PARAMITE
	db 5, WEEDLE
	db 5, PARAMITE
	db 4, HOPPIP
	db 5, METAPOD
	db 6, PIDGEY
	; day
	db 4, CATERPIE
	db 4, PARAMITE
	db 5, WEEDLE
	db 5, PARAMITE
	db 4, HOPPIP
	db 5, METAPOD
	db 6, KAKUNA
	; nite
	db 4, HOOTHOOT
	db 4, PARAMITE
	db 5, HOOTHOOT
	db 5, PARAMITE
	db 4, PARAMITE
	db 5, HOOTHOOT
	db 6, RATTATA

; Tangtrip swarm
	map_id ROUTE_102
	db 10 percent, 10 percent, 10 percent ; encounter rates: morn/day/nite
	; morn
	db 8, HOPPIP
	db 8, TANGTRIP
	db 8, CHIX
	db 9, TANGTRIP
	db 8, NIDORAN_M
	db 8, NIDORAN_F
	db 10, TANGTRIP
	; day
	db 8, HOPPIP
	db 8, TANGTRIP
	db 8, CHIX
	db 9, TANGTRIP
	db 8, NIDORAN_M
	db 8, NIDORAN_F
	db 10, TANGTRIP
	; nite
	; morn
	db 8, HOPPIP
	db 8, TANGTRIP
	db 8, CHIX
	db 9, TANGTRIP
	db 8, NIDORAN_M
	db 8, NIDORAN_F
	db 10, TANGTRIP
	; day
	db 8, HOPPIP
	db 8, TANGTRIP
	db 8, CHIX
	db 9, TANGTRIP
	db 8, NIDORAN_M
	db 8, NIDORAN_F
	db 10, TANGTRIP
	; nite
	db 8, DITTO
	db 8, DITTO
	db 8, DITTO
	db 9, DITTO
	db 8, DITTO
	db 8, DITTO
	db 10, DITTO

;	db 8, ODDISH
;	db 8, TANGTRIP
;	db 8, HOOTHOOT
;	db 9, TANGTRIP
;	db 8, NIDORAN_M
;	db 8, NIDORAN_F
;	db 10, GASTLY

	db -1 ; end
