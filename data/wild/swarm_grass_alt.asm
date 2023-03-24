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

; Chix swarm
	map_id ROUTE_102
	db 10 percent, 10 percent, 10 percent ; encounter rates: morn/day/nite
	; morn
	db 8, HOPPIP
	db 8, CHIX
	db 8, CHIX
	db 9, CHIX
	db 8, NIDORAN_M
	db 8, NIDORAN_F
	db 8, TANGTRIP
	; day
	db 8, HOPPIP
	db 8, CHIX
	db 8, CHIX
	db 9, CHIX
	db 8, NIDORAN_M
	db 8, NIDORAN_F
	db 8, TANGTRIP
	; nite
	db 8, ODDISH
	db 8, CHIX
	db 8, HOOTHOOT
	db 9, CHIX
	db 8, NIDORAN_M
	db 8, NIDORAN_F
	db 8, GASTLY

; Houndour swarm
	map_id ROUTE_103
	db 10 percent, 10 percent, 10 percent ; encounter rates: morn/day/nite
	; morn
	db 14, SPEAROW
	db 14, HOUNDOUR
	db 12, GRIMBY
	db 12, HOUNDOUR
	db 13, SANDSHREW
	db 12, ABRA
	db 12, ABRA
	; day
	db 14, SPEAROW
	db 14, HOUNDOUR
	db 12, GRIMBY
	db 12, HOUNDOUR
	db 13, SANDSHREW
	db 12, ABRA
	db 12, ABRA
	; nite
	db 14, ABRA
	db 14, HOUNDOUR
	db 12, GRIMBY
	db 12, HOUNDOUR
	db 14, DROWZEE
	db 12, HOOTHOOT
	db 12, HOOTHOOT

; Rinring swarm
	map_id ROUTE_120
	db 10 percent, 10 percent, 10 percent ; encounter rates: morn/day/nite
	; morn
	db 12, RINRING
	db 13, BELLSPROUT
	db 13, KOTORA
	db 14, PETICORN
	db 12, PHANPY
	db 14, EXEGGCUTE
	db 14, KOTORA
	; day
	db 12, RINRING
	db 13, BELLSPROUT
	db 13, RINRING
	db 14, PETICORN
	db 12, PHANPY
	db 14, EXEGGCUTE
	db 14, KOTORA
	; nite
	db 12, RINRING
	db 13, RINRING
	db 13, RINRING
	db 14, BELLSPROUT
	db 12, ZUBAT
	db 14, EXEGGCUTE
	db 14, KOTORA

; Onix swarm
	map_id BOULDER_MINES_1F
	db 6 percent, 6 percent, 6 percent ; encounter rates: morn/day/nite
	; morn
	db 12, ONIX
	db 12, SANDSHREW
	db 12, ONIX
	db 14, KOFFING
	db 13, MACHOP
	db 12, ZUBAT
	db 14, GEODUDE
	; day
	db 12, ONIX
	db 12, SANDSHREW
	db 12, ONIX
	db 14, KOFFING
	db 13, MACHOP
	db 12, ZUBAT
	db 14, GEODUDE
	; nite
	db 12, ONIX
	db 12, SANDSHREW
	db 12, ONIX
	db 14, KOFFING
	db 13, MACHOP
	db 12, ZUBAT
	db 14, GEODUDE

; Voltorb swarm
	map_id ROUTE_119
	db 10 percent, 10 percent, 10 percent ; encounter rates: morn/day/nite
	; morn
	db 18, VOLTORB
	db 19, BELLSPROUT
	db 17, VOLTORB
	db 18, WEEPINBELL
	db 19, SKIPLOOM
	db 20, FEAROW
	db 22, EKANS
	; day
	db 18, VOLTORB
	db 19, BELLSPROUT
	db 17, VOLTORB
	db 18, WEEPINBELL
	db 19, SKIPLOOM
	db 20, FEAROW
	db 22, EKANS
	; nite
	db 18, VOLTORB
	db 19, BELLSPROUT
	db 17, VOLTORB
	db 18, WEEPINBELL
	db 19, CLEFAIRY
	db 20, MEOWTH
	db 22, EKANS

	db -1 ; end
