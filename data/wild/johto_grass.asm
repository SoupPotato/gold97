; Johto Pokémon in grass
;30
;30
;20
;10
;5
;4
;1

JohtoGrassWildMons:

	map_id ROUTE_101
	db 10 percent, 10 percent, 10 percent ; encounter rates: morn/day/nite
	IF DEF(_GOLD)
	; morn
	db 2, PIDGEY
	db 2, RATTATA
	db 4, PIDGEY
	db 3, HOPPIP
	db 4, RATTATA
	db 4, HOPPIP
	db 4, HOPPIP
	; day
	db 2, PIDGEY
	db 2, RATTATA
	db 4, PIDGEY
	db 3, HOPPIP
	db 4, RATTATA
	db 4, HOPPIP
	db 4, HOPPIP
	; nite
	db 2, HOOTHOOT
	db 2, RATTATA
	db 4, HOOTHOOT
	db 3, RATTATA
	db 4, RATTATA
	db 4, NYANYA
	db 4, NYANYA
	
	ELIF DEF(_SILVER)
	; morn
	db 2, PIDGEY
	db 2, RATTATA
	db 4, PIDGEY
	db 3, HOPPIP
	db 4, RATTATA
	db 4, HOPPIP
	db 4, HOPPIP
	; day
	db 2, PIDGEY
	db 2, RATTATA
	db 4, PIDGEY
	db 3, HOPPIP
	db 4, RATTATA
	db 4, HOPPIP
	db 4, HOPPIP
	; nite
	db 2, HOOTHOOT
	db 2, RATTATA
	db 4, HOOTHOOT
	db 3, NYANYA
	db 4, RATTATA
	db 4, HOOTHOOT
	db 4, HOOTHOOT
	ENDC
	

	map_id SILENT_HILLS
	db 10 percent, 10 percent, 10 percent ; encounter rates: morn/day/nite
	IF DEF(_GOLD)
	; morn
	db 4, CATERPIE
	db 4, PIDGEY
	db 5, WEEDLE
	db 5, PIDGEY
	db 4, HOPPIP
	db 5, METAPOD
	db 6, LEDYBA
	; day
	db 4, CATERPIE
	db 4, RATTATA
	db 5, WEEDLE
	db 5, PIDGEY
	db 4, HOPPIP
	db 5, METAPOD
	db 6, KAKUNA
	; nite
	db 4, HOOTHOOT
	db 4, RATTATA
	db 5, HOOTHOOT
	db 5, SPINARAK
	db 4, PARAMITE
	db 5, PARAMITE
	db 6, PARAMITE
	
	ELIF DEF(_SILVER)
	; morn
	db 4, WEEDLE
	db 4, PIDGEY
	db 5, CATERPIE
	db 5, LEDYBA
	db 4, HOPPIP
	db 5, KAKUNA
	db 6, METAPOD
	; day
	db 4, WEEDLE
	db 4, RATTATA
	db 5, CATERPIE
	db 5, PIDGEY
	db 4, HOPPIP
	db 5, KAKUNA
	db 6, METAPOD
	; nite
	db 4, HOOTHOOT
	db 4, RATTATA
	db 5, HOOTHOOT
	db 5, RATTATA
	db 4, PARAMITE
	db 5, PARAMITE
	db 6, SPINARAK
	ENDC
	

	map_id BRASS_TOWER_2F
	db 2 percent, 2 percent, 2 percent ; encounter rates: morn/day/nite
	; morn
	db 5, RATTATA
	db 6, RATTATA
	db 7, RATTATA
	db 5, RATTATA
	db 8, RATTATA
	db 7, RATTATA
	db 7, RATTATA
	; day
	db 5, RATTATA
	db 6, RATTATA
	db 7, RATTATA
	db 5, RATTATA
	db 8, RATTATA
	db 7, RATTATA
	db 7, RATTATA
	; nite
	db 5, GASTLY
	db 6, GASTLY
	db 7, GASTLY
	db 5, KURSTRAW
	db 8, KURSTRAW
	db 7, RATTATA
	db 7, RATTATA
	

	map_id BRASS_TOWER_3F
	db 2 percent, 2 percent, 2 percent ; encounter rates: morn/day/nite
	; morn
	db 5, RATTATA
	db 6, RATTATA
	db 7, RATTATA
	db 6, RATTATA
	db 8, RATTATA
	db 8, RATTATA
	db 7, RATTATA
	; day
	db 5, RATTATA
	db 6, RATTATA
	db 7, RATTATA
	db 6, RATTATA
	db 8, RATTATA
	db 8, RATTATA
	db 7, RATTATA
	; nite
	db 5, GASTLY
	db 6, GASTLY
	db 7, GASTLY
	db 6, KURSTRAW
	db 8, KURSTRAW
	db 8, RATTATA
	db 7, RATTATA
	
	map_id BRASS_TOWER_4F
	db 2 percent, 2 percent, 2 percent ; encounter rates: morn/day/nite
	; morn
	db 6, RATTATA
	db 7, RATTATA
	db 8, RATTATA
	db 6, RATTATA
	db 9, RATTATA
	db 8, RATTATA
	db 8, RATTATA
	; day
	db 6, RATTATA
	db 7, RATTATA
	db 8, RATTATA
	db 6, RATTATA
	db 9, RATTATA
	db 8, RATTATA
	db 8, RATTATA
	; nite
	db 6, GASTLY
	db 7, GASTLY
	db 8, GASTLY
	db 6, KURSTRAW
	db 9, KURSTRAW
	db 8, RATTATA
	db 8, RATTATA


	map_id ROUTE_102
	db 10 percent, 10 percent, 10 percent ; encounter rates: morn/day/nite
	IF DEF(_GOLD)
	; morn
	db 8, HOPPIP
	db 8, CHIX
	db 8, NIDORAN_M
	db 9, PUDDIPUP
	db 7, NIDORAN_F
	db 8, TANGTRIP
	db 10, TRITALES
	; day
	db 8, HOPPIP
	db 8, CHIX
	db 8, NIDORAN_M
	db 9, PUDDIPUP
	db 7, NIDORAN_F
	db 8, TANGTRIP
	db 10, TRITALES
	; nite
	db 8, HOPPIP
	db 8, ODDISH
	db 8, NIDORAN_M
	db 9, HOOTHOOT
	db 7, NIDORAN_F
	db 8, GASTLY
	db 10, GASTLY
	
	ELIF DEF(_SILVER)	
	; morn
	db 8, LEDYBA
	db 8, CHIX
	db 8, NIDORAN_F
	db 9, TRITALES
	db 7, NIDORAN_M
	db 8, TANGTRIP
	db 10, PUDDIPUP
	; day
	db 8, HOPPIP
	db 8, CHIX
	db 8, NIDORAN_F
	db 9, TRITALES
	db 7, NIDORAN_M
	db 8, TANGTRIP
	db 10, PUDDIPUP
	; nite
	db 8, ODDISH
	db 8, ODDISH
	db 8, NIDORAN_F
	db 9, HOOTHOOT
	db 7, NIDORAN_M
	db 8, GASTLY
	db 10, GASTLY
	ENDC

	
	map_id ROUTE_120
	db 10 percent, 10 percent, 10 percent ; encounter rates: morn/day/nite
	IF DEF(_GOLD)
	; morn
	db 12, MAREEP
	db 13, BELLSPROUT
	db 13, KOTORA
	db 14, PETICORN
	db 12, PHANPY
	db 14, EXEGGCUTE
	db 14, EXEGGCUTE
	; day
	db 12, MAREEP
	db 13, BELLSPROUT
	db 13, KOTORA
	db 14, PETICORN
	db 12, PHANPY
	db 14, EXEGGCUTE
	db 14, EXEGGCUTE
	; nite
	db 12, EKANS
	db 13, RINRING
	db 13, KOTORA
	db 14, BELLSPROUT
	db 12, ZUBAT
	db 14, EXEGGCUTE
	db 14, EXEGGCUTE
	
	ELIF DEF(_SILVER)
	; morn
	db 12, MAREEP
	db 13, PHANPY
	db 13, KOTORA
	db 14, PETICORN
	db 12, BELLSPROUT
	db 14, EXEGGCUTE
	db 14, EXEGGCUTE
	; day
	db 12, MAREEP
	db 13, PHANPY
	db 13, KOTORA
	db 14, PETICORN
	db 12, BELLSPROUT
	db 14, EXEGGCUTE
	db 14, EXEGGCUTE
	; nite
	db 12, MAREEP
	db 13, BELLSPROUT
	db 13, KOTORA
	db 14, ZUBAT
	db 12, RINRING
	db 14, EXEGGCUTE
	db 14, EXEGGCUTE
	ENDC
	

	map_id BOULDER_MINES_1F
	db 6 percent, 6 percent, 6 percent ; encounter rates: morn/day/nite
	; morn
	db 12, GEODUDE
	db 12, SANDSHREW
	db 12, ZUBAT
	db 14, KOFFING
	db 13, MACHOP
	db 12, ONIX
	db 14, ONIX
	; day
	db 12, GEODUDE
	db 12, SANDSHREW
	db 12, ZUBAT
	db 14, KOFFING
	db 13, MACHOP
	db 12, ONIX
	db 14, ONIX
	; nite
	db 12, GEODUDE
	db 12, SANDSHREW
	db 12, ZUBAT
	db 14, KOFFING
	db 13, MACHOP
	db 12, ONIX
	db 14, ONIX

	map_id BOULDER_MINES_B1F
	db 6 percent, 6 percent, 6 percent ; encounter rates: morn/day/nite
	; morn
	db 12, GEODUDE
	db 12, SANDSHREW
	db 12, ZUBAT
	db 14, KOFFING
	db 13, MACHOP
	db 12, ONIX
	db 14, ONIX
	; day
	db 12, GEODUDE
	db 12, SANDSHREW
	db 12, ZUBAT
	db 14, KOFFING
	db 13, MACHOP
	db 12, ONIX
	db 14, ONIX
	; nite
	db 12, GEODUDE
	db 12, SANDSHREW
	db 12, ZUBAT
	db 14, KOFFING
	db 13, MACHOP
	db 12, ONIX
	db 14, ONIX
	
	map_id BOULDER_MINES_B2F
	db 4 percent, 4 percent, 4 percent ; encounter rates: morn/day/nite
	; morn
	db 12, GEODUDE
	db 12, SANDSHREW
	db 14, ZUBAT
	db 14, KOFFING
	db 12, MARILL
	db 14, ONIX
	db 14, TURBAN
	; day
	db 12, GEODUDE
	db 12, SANDSHREW
	db 14, ZUBAT
	db 14, KOFFING
	db 12, MARILL
	db 14, ONIX
	db 14, TURBAN
	; nite
	db 12, GEODUDE
	db 12, SANDSHREW
	db 14, ZUBAT
	db 14, KOFFING
	db 12, MARILL
	db 14, ONIX
	db 14, TURBAN
	
	map_id BOULDER_MINES_B3F
	db 4 percent, 4 percent, 4 percent ; encounter rates: morn/day/nite
	; morn
	db 12, GEODUDE
	db 12, SANDSHREW
	db 12, ZUBAT
	db 14, KOFFING
	db 13, MACHOP
	db 12, ONIX
	db 14, ONIX
	; day
	db 12, GEODUDE
	db 12, SANDSHREW
	db 12, ZUBAT
	db 14, KOFFING
	db 13, MACHOP
	db 12, ONIX
	db 14, ONIX
	; nite
	db 12, GEODUDE
	db 12, SANDSHREW
	db 12, ZUBAT
	db 14, KOFFING
	db 13, MACHOP
	db 12, ONIX
	db 14, ONIX
	
	map_id BOULDER_MINES_B4F
	db 4 percent, 4 percent, 4 percent ; encounter rates: morn/day/nite
	; morn
	db 12, GEODUDE
	db 12, SANDSHREW
	db 12, ZUBAT
	db 14, KOFFING
	db 13, MACHOP
	db 12, ONIX
	db 14, ONIX
	; day
	db 12, GEODUDE
	db 12, SANDSHREW
	db 12, ZUBAT
	db 14, KOFFING
	db 13, MACHOP
	db 12, ONIX
	db 14, ONIX
	; nite
	db 12, GEODUDE
	db 12, SANDSHREW
	db 12, ZUBAT
	db 14, KOFFING
	db 13, MACHOP
	db 12, ONIX
	db 14, ONIX
	
	map_id BOULDER_MINES_B5F
	db 4 percent, 4 percent, 4 percent ; encounter rates: morn/day/nite
	; morn
	db 12, GEODUDE
	db 12, SANDSHREW
	db 12, ZUBAT
	db 14, MARILL
	db 13, TURBAN
	db 12, ONIX
	db 14, ONIX
	; day
	db 12, GEODUDE
	db 12, SANDSHREW
	db 12, ZUBAT
	db 14, MARILL
	db 13, TURBAN
	db 12, ONIX
	db 14, ONIX
	; nite
	db 12, GEODUDE
	db 12, SANDSHREW
	db 12, ZUBAT
	db 14, MARILL
	db 13, TURBAN
	db 12, ONIX
	db 14, ONIX

	map_id ROUTE_103
	db 10 percent, 10 percent, 10 percent ; encounter rates: morn/day/nite
	IF DEF(_GOLD)
	; morn
	db 14, NIDORAN_F
	db 14, NIDORAN_M
	db 12, GRIMBY
	db 12, SPEAROW
	db 13, SANDSHREW
	db 12, ABRA
	db 12, ABRA
	; day
	db 14, NIDORAN_F
	db 14, NIDORAN_M
	db 12, GRIMBY
	db 12, SPEAROW
	db 13, SANDSHREW
	db 12, ABRA
	db 12, ABRA
	; nite
	db 14, ABRA
	db 14, DROWZEE
	db 12, GRIMBY
	db 12, ABRA
	db 14, HOOTHOOT
	db 12, HOUNDOUR
	db 12, HOUNDOUR
	
	ELIF DEF(_SILVER)
	; morn
	db 14, NIDORAN_M
	db 14, NIDORAN_F
	db 12, GRIMBY
	db 12, SPEAROW
	db 13, SANDSHREW
	db 12, ABRA
	db 12, ABRA
	; day
	db 14, NIDORAN_M
	db 14, NIDORAN_F
	db 12, GRIMBY
	db 12, SPEAROW
	db 13, SANDSHREW
	db 12, ABRA
	db 12, ABRA
	; nite
	db 14, ABRA
	db 14, DROWZEE
	db 12, GRIMBY
	db 12, ABRA
	db 14, HOOTHOOT
	db 12, HOUNDOUR
	db 12, HOUNDOUR
	ENDC
	
	map_id SLOWPOKE_WELL_B1F
	db 8 percent, 8 percent, 8 percent ; encounter rates: morn/day/nite
	; morn
	db 17, ZUBAT
	db 18, ZUBAT
	db 18, SLOWPOKE
	db 17, SLOWPOKE
	db 18, ZUBAT
	db 19, TURBAN
	db 20, TURBAN
	; day
	db 17, ZUBAT
	db 18, ZUBAT
	db 18, SLOWPOKE
	db 17, SLOWPOKE
	db 18, ZUBAT
	db 19, TURBAN
	db 20, TURBAN
	; nite
	db 17, ZUBAT
	db 18, ZUBAT
	db 18, SLOWPOKE
	db 17, SLOWPOKE
	db 18, ZUBAT
	db 19, TURBAN
	db 20, TURBAN

	map_id SLOWPOKE_WELL_B2F
	db 8 percent, 8 percent, 8 percent ; encounter rates: morn/day/nite
	; morn
	db 17, ZUBAT
	db 18, ZUBAT
	db 18, SLOWPOKE
	db 17, SLOWPOKE
	db 18, ZUBAT
	db 19, TURBAN
	db 20, TURBAN
	; day
	db 17, ZUBAT
	db 18, ZUBAT
	db 18, SLOWPOKE
	db 17, SLOWPOKE
	db 18, ZUBAT
	db 19, TURBAN
	db 20, TURBAN
	; nite
	db 17, ZUBAT
	db 18, ZUBAT
	db 18, SLOWPOKE
	db 17, SLOWPOKE
	db 18, ZUBAT
	db 19, TURBAN
	db 20, TURBAN
	
	map_id ROUTE_116
	db 10 percent, 10 percent, 10 percent ; encounter rates: morn/day/nite
	; morn
	IF DEF(_GOLD)
	db 16, IGGLYBUFF
	db 17, METAPOD
	db 16, CLEFFA
	db 18, SPEAROW
	db 18, CUBONE
	db 20, BUTTERFREE
	db 19, JIGGLYPUFF
	; day
	db 16, IGGLYBUFF
	db 17, METAPOD
	db 16, CLEFFA
	db 18, SPEAROW
	db 18, CUBONE
	db 20, BUTTERFREE
	db 19, JIGGLYPUFF
	; nite
	db 16, IGGLYBUFF
	db 17, PARAS
	db 16, CLEFFA
	db 18, POLIWAG
	db 18, NYANYA
	db 20, PARASECT
	db 19, JIGGLYPUFF
	
	ELIF DEF(_SILVER)
	; morn
	db 16, CLEFFA
	db 17, KAKUNA
	db 16, IGGLYBUFF
	db 18, SPEAROW
	db 18, CUBONE
	db 20, BEEDRILL
	db 19, CLEFAIRY
	; day
	db 16, CLEFFA
	db 17, KAKUNA
	db 16, IGGLYBUFF
	db 18, SPEAROW
	db 18, CUBONE
	db 20, BEEDRILL
	db 19, CLEFAIRY
	; nite
	db 16, CLEFFA
	db 17, PARAS
	db 16, IGGLYBUFF
	db 18, POLIWAG
	db 18, NYANYA
	db 20, PARASECT
	db 19, CLEFAIRY
	ENDC
	
	map_id ENDON_CAVE_1F
	db 8 percent, 8 percent, 8 percent ; encounter rates: morn/day/nite
	; morn
	db 18, ZUBAT
	db 19, DIGLETT
	db 19, MANKEY
	db 19, QUAGSIRE
	db 18, GRIMER
	db 22, GOLBAT
	db 22, GOLBAT
	; day
	db 18, ZUBAT
	db 19, DIGLETT
	db 19, MANKEY
	db 19, QUAGSIRE
	db 18, GRIMER
	db 22, GOLBAT
	db 22, GOLBAT
	; nite
	db 18, ZUBAT
	db 19, DIGLETT
	db 19, POLIWAG
	db 19, QUAGSIRE
	db 18, GRIMER
	db 22, GOLBAT
	db 22, GOLBAT
	
	map_id ENDON_CAVE_B1F
	db 8 percent, 8 percent, 8 percent ; encounter rates: morn/day/nite
	; morn
	db 18, ZUBAT
	db 19, DIGLETT
	db 19, MANKEY
	db 19, QUAGSIRE
	db 18, GRIMER
	db 22, GOLBAT
	db 22, GOLBAT
	; day
	db 18, ZUBAT
	db 19, DIGLETT
	db 19, MANKEY
	db 19, QUAGSIRE
	db 18, GRIMER
	db 22, GOLBAT
	db 22, GOLBAT
	; nite
	db 18, ZUBAT
	db 19, DIGLETT
	db 19, POLIWAG
	db 19, QUAGSIRE
	db 18, GRIMER
	db 22, GOLBAT
	db 22, GOLBAT

	map_id RUINS_OF_ALPH_INNER_CHAMBER
	db 6 percent, 6 percent, 6 percent ; encounter rates: morn/day/nite
	; morn
	db 20, UNOWN
	db 20, UNOWN
	db 20, UNOWN
	db 20, UNOWN
	db 20, UNOWN
	db 20, UNOWN
	db 20, UNOWN
	; day
	db 20, UNOWN
	db 20, UNOWN
	db 20, UNOWN
	db 20, UNOWN
	db 20, UNOWN
	db 20, UNOWN
	db 20, UNOWN
	; nite
	db 20, UNOWN
	db 20, UNOWN
	db 20, UNOWN
	db 20, UNOWN
	db 20, UNOWN
	db 20, UNOWN
	db 20, UNOWN
	
	map_id RUINS_OF_ALPH_OUTSIDE
	db 10 percent, 10 percent, 10 percent ; encounter rates: morn/day/nite
	IF DEF(_GOLD)
	; morn
	db 20, NATU
	db 21, NATU
	db 21, NATU
	db 21, SMEARGLE
	db 20, SMEARGLE
	db 22, PHANPY
	db 22, PHANPY
	; day
	db 20, NATU
	db 21, NATU
	db 21, NATU
	db 21, SMEARGLE
	db 20, SMEARGLE
	db 22, PHANPY
	db 22, PHANPY
	; nite
	db 20, HOOTHOOT
	db 21, RINRING
	db 21, RINRING
	db 21, SMEARGLE
	db 20, SMEARGLE
	db 22, HOOTHOOT
	db 22, NOCTOWL
	
	ELIF DEF(_SILVER)
	; morn
	db 20, NATU
	db 21, NATU
	db 21, NATU
	db 21, PHANPY
	db 20, PHANPY
	db 22, SMEARGLE
	db 22, SMEARGLE
	; day
	db 20, NATU
	db 21, NATU
	db 21, NATU
	db 21, PHANPY
	db 20, PHANPY
	db 22, SMEARGLE
	db 22, SMEARGLE
	; nite
	db 20, HOOTHOOT
	db 21, HOOTHOOT
	db 21, NOCTOWL
	db 21, SMEARGLE
	db 20, SMEARGLE
	db 22, RINRING
	db 22, RINRING
	ENDC

	map_id ROUTE_118
	db 10 percent, 10 percent, 10 percent ; encounter rates: morn/day/nite
	; morn
	db 23, TANGTRIP
	db 24, SPEAROW
	db 22, SPEAROW
	db 23, TANGELA
	db 24, TANGELA
	db 24, FEAROW
	db 26, FEAROW
	; day
	db 23, TANGTRIP
	db 24, SPEAROW
	db 22, SPEAROW
	db 23, TANGELA
	db 24, TANGELA
	db 24, FEAROW
	db 26, FEAROW
	; nite
	db 23, TANGTRIP
	db 24, VENONAT
	db 22, VENONAT
	db 23, TANGELA
	db 24, TANGELA
	db 24, VENOMOTH
	db 26, VENOMOTH
	
	map_id ROUTE_119
	db 10 percent, 10 percent, 10 percent ; encounter rates: morn/day/nite
	; morn
	db 18, EKANS
	db 19, VOLTORB
	db 17, BELLSPROUT
	db 18, WEEPINBELL
	db 19, SKIPLOOM
	db 20, FEAROW
	db 22, FEAROW
	; day
	db 18, EKANS
	db 19, VOLTORB
	db 17, BELLSPROUT
	db 18, WEEPINBELL
	db 19, SKIPLOOM
	db 20, FEAROW
	db 22, FEAROW
	; nite
	db 18, EKANS
	db 19, VOLTORB
	db 17, BELLSPROUT
	db 18, WEEPINBELL
	db 19, CLEFAIRY
	db 20, MEOWTH
	db 22, MEOWTH

	map_id ROUTE_104
	db 10 percent, 10 percent, 10 percent ; encounter rates: morn/day/nite
	; morn
	db 17, DODUO
	db 18, SANDSHREW
	db 16, NATU
	db 18, MAREEP
	db 16, MAREEP
	db 18, FARFETCH_D
	db 20, FARFETCH_D
	; day
	db 17, DODUO
	db 18, SANDSHREW
	db 16, NATU
	db 18, MAREEP
	db 16, MAREEP
	db 18, FARFETCH_D
	db 20, FARFETCH_D
	; nite
	db 17, MURKROW
	db 18, SANDSHREW
	db 16, NATU
	db 18, MAREEP
	db 16, MAREEP
	db 18, TWINZ
	db 20, TWINZ

	map_id ROUTE_105
	db 4 percent, 4 percent, 4 percent ; encounter rates: morn/day/nite
	IF DEF(_GOLD)
	; morn
	db 28, DODUO
	db 27, RATTATA
	db 28, NATU
	db 28, GROWLITHE
	db 26, FLAAFFY
	db 28, MAGNEMITE
	db 27, VULPIX
	; day
	db 28, DODUO
	db 27, RATTATA
	db 28, NATU
	db 28, GROWLITHE
	db 26, FLAAFFY
	db 28, MAGNEMITE
	db 27, VULPIX
	; nite
	db 28, MURKROW
	db 27, TWINZ
	db 28, NATU
	db 28, FLAAFFY
	db 26, GIRAFARIG
	db 28, MAGNEMITE
	db 27, MAGNEMITE
	
	ELIF DEF(_SILVER)
	; morn
	db 28, DODUO
	db 27, RATTATA
	db 28, NATU
	db 28, VULPIX
	db 26, FLAAFFY
	db 28, MAGNEMITE
	db 27, GROWLITHE
	; day
	db 28, DODUO
	db 27, RATTATA
	db 28, NATU
	db 28, VULPIX
	db 26, FLAAFFY
	db 28, MAGNEMITE
	db 27, GROWLITHE
	; nite
	db 28, MURKROW
	db 27, TWINZ
	db 28, NATU
	db 28, FLAAFFY
	db 26, GIRAFARIG
	db 28, MAGNEMITE
	db 27, MAGNEMITE
	ENDC
	
	map_id ROUTE_106
	db 4 percent, 4 percent, 4 percent ; encounter rates: morn/day/nite
	IF DEF(_GOLD)
	; morn
	db 27, PIDGEY
	db 28, GROWLITHE
	db 29, PIDGEOTTO
	db 28, DITTO
	db 29, LICKITUNG
	db 28, PIKACHU
	db 27, EEVEE
	; day
	db 27, PIDGEY
	db 28, GROWLITHE
	db 29, PIDGEOTTO
	db 28, DITTO
	db 29, LICKITUNG
	db 28, PIKACHU
	db 27, EEVEE
	; nite
	db 27, HOOTHOOT
	db 28, RATICATE
	db 29, NOCTOWL
	db 28, DITTO
	db 29, LICKITUNG
	db 28, PIKACHU
	db 27, EEVEE
	
	ELIF DEF(_SILVER)
	; morn
	db 27, PIDGEY
	db 28, VULPIX
	db 29, PIDGEOTTO
	db 28, DITTO
	db 29, LICKITUNG
	db 28, PIKACHU
	db 27, EEVEE
	; day
	db 27, PIDGEY
	db 28, VULPIX
	db 29, PIDGEOTTO
	db 28, DITTO
	db 29, LICKITUNG
	db 28, PIKACHU
	db 27, EEVEE
	; nite
	db 27, HOOTHOOT
	db 28, RATICATE
	db 29, NOCTOWL
	db 28, DITTO
	db 29, LICKITUNG
	db 28, PIKACHU
	db 27, EEVEE
	ENDC

	map_id JADE_FOREST
	db 4 percent, 4 percent, 4 percent ; encounter rates: morn/day/nite
	; morn
	db 27, WEEPINBELL
	db 27, PARASECT
	db 28, HOPPIP
	db 28, SKIPLOOM
	db 28, SUNFLORA
	db 30, AIPOM
	db 30, AIPOM
	; day
	db 27, WEEPINBELL
	db 27, PARASECT
	db 28, HOPPIP
	db 28, SKIPLOOM
	db 28, SUNFLORA
	db 30, AIPOM
	db 30, AIPOM
	; nite
	db 27, WEEPINBELL
	db 27, GLOOM
	db 28, HOPPIP
	db 28, SKIPLOOM
	db 28, SUNFLORA
	db 30, AIPOM
	db 30, AIPOM
	
	map_id ROUTE_108
	db 4 percent, 4 percent, 4 percent ; encounter rates: morn/day/nite
	; morn
	db 28, EKANS
	db 28, FARFETCH_D
	db 30, ARBOK
	db 29, MILTANK
	db 30, PHANPY
	db 30, PINSIR
	db 32, PINSIR
	; day
	db 28, EKANS
	db 28, FARFETCH_D
	db 30, ARBOK
	db 29, MILTANK
	db 30, PHANPY
	db 30, PINSIR
	db 32, PINSIR
	; nite
	db 28, EKANS
	db 28, GLOOM
	db 30, ARBOK
	db 29, GOLBAT
	db 30, PHANPY
	db 30, PINSIR
	db 32, PINSIR
	
	map_id ROUTE_109
	db 4 percent, 4 percent, 4 percent ; encounter rates: morn/day/nite
	; morn
	db 28, EKANS
	db 28, FARFETCH_D
	db 30, ARBOK
	db 29, PONYTA
	db 30, PHANPY
	db 30, TAUROS
	db 32, TAUROS
	; day
	db 28, EKANS
	db 28, FARFETCH_D
	db 30, ARBOK
	db 29, PONYTA
	db 30, PHANPY
	db 30, TAUROS
	db 32, TAUROS
	; nite
	db 28, EKANS
	db 28, FARFETCH_D
	db 30, ARBOK
	db 29, GOLBAT
	db 30, PHANPY
	db 30, GOLBAT
	db 32, ZUBAT
	
	map_id AMPARE_CAVERN_1F
	db 4 percent, 4 percent, 4 percent ; encounter rates: morn/day/nite
	; morn
	db 28, GEODUDE
	db 29, MAGNEMITE
	db 29, VOLTORB
	db 32, GRAVELER
	db 33, ELECTABUZZ
	db 32, ZUBAT
	db 34, ZUBAT
	; day
	db 28, GEODUDE
	db 29, MAGNEMITE
	db 29, VOLTORB
	db 32, GRAVELER
	db 33, ELECTABUZZ
	db 32, ZUBAT
	db 34, ZUBAT
	; nite
	db 28, GEODUDE
	db 29, MAGNEMITE
	db 29, VOLTORB
	db 32, GRAVELER
	db 33, ELECTABUZZ
	db 32, ZUBAT
	db 34, ZUBAT

	map_id AMPARE_CAVERN_B1F
	db 4 percent, 4 percent, 4 percent ; encounter rates: morn/day/nite
	; morn
	db 28, GEODUDE
	db 29, MAGNEMITE
	db 29, VOLTORB
	db 32, GRAVELER
	db 33, ELECTABUZZ
	db 34, ELECTRODE
	db 34, MAGNETON
	; day
	db 28, GEODUDE
	db 29, MAGNEMITE
	db 29, VOLTORB
	db 32, GRAVELER
	db 33, ELECTABUZZ
	db 34, ELECTRODE
	db 34, MAGNETON
	; nite
	db 28, GEODUDE
	db 29, MAGNEMITE
	db 29, VOLTORB
	db 32, GRAVELER
	db 33, ELECTABUZZ
	db 34, ELECTRODE
	db 34, MAGNETON

	map_id ROUTE_110
	db 10 percent, 10 percent, 10 percent ; encounter rates: morn/day/nite
	IF DEF(_GOLD)
	; morn
	db 27, SNUBBULL
	db 28, WOLFAN
	db 30, WOLFAN
	db 28, SNUBBULL
	db 32, JYNX
	db 28, DELIBIRD
	db 30, DELIBIRD
	; day
	db 27, SNUBBULL
	db 28, WOLFAN
	db 28, SNUBBULL
	db 30, WOLFAN
	db 32, JYNX
	db 28, DELIBIRD
	db 30, DELIBIRD
	; nite
	db 27, RINRING
	db 28, WOLFAN
	db 28, GOLBAT
	db 30, WOLFAN
	db 32, BELLRUN
	db 28, SNEASEL
	db 30, SNEASEL
	
	ELIF DEF(_SILVER)
	; morn
	db 27, SNUBBULL
	db 28, WOLFAN
	db 30, WOLFAN
	db 28, SNUBBULL
	db 32, JYNX
	db 28, DELIBIRD
	db 30, DELIBIRD
	; day
	db 27, SNUBBULL
	db 28, WOLFAN
	db 28, SNUBBULL
	db 30, WOLFAN
	db 32, JYNX
	db 28, DELIBIRD
	db 30, DELIBIRD
	; nite
	db 27, ZUBAT
	db 28, WOLFAN
	db 28, GOLBAT
	db 30, WOLFAN
	db 32, RINRING
	db 28, SNEASEL
	db 30, SNEASEL
	ENDC

	map_id DEEPWATER_PASSAGE_B2F
	db 4 percent, 4 percent, 4 percent ; encounter rates: morn/day/nite
	; morn
	db 30, ZUBAT
	db 32, SEEL
	db 28, WOLFAN
	db 30, WOLFAN
	db 30, JYNX
	db 31, JYNX
	db 32, DELIBIRD
	; day
	db 30, ZUBAT
	db 32, SEEL
	db 28, WOLFAN
	db 30, WOLFAN
	db 30, JYNX
	db 31, JYNX
	db 32, DELIBIRD
	; nite
	db 30, ZUBAT
	db 32, SEEL
	db 28, WOLFAN
	db 30, WOLFAN
	db 30, GOLBAT
	db 31, GOLBAT
	db 32, SNEASEL

	map_id DEEPWATER_PASSAGE_B1F
	db 4 percent, 4 percent, 4 percent ; encounter rates: morn/day/nite
	; morn
	db 30, ZUBAT
	db 32, SEEL
	db 28, WOLFAN
	db 30, WOLFAN
	db 30, DELIBIRD
	db 31, JYNX
	db 32, DELIBIRD
	; day
	db 30, ZUBAT
	db 32, SEEL
	db 28, WOLFAN
	db 30, WOLFAN
	db 30, DELIBIRD
	db 31, JYNX
	db 32, DELIBIRD
	; nite
	db 30, ZUBAT
	db 32, SEEL
	db 28, WOLFAN
	db 30, WOLFAN
	db 30, SNEASEL
	db 31, GOLBAT
	db 32, SNEASEL

	map_id DEEPWATER_PASSAGE_B3F
	db 4 percent, 4 percent, 4 percent ; encounter rates: morn/day/nite
	; morn
	db 28, WOLFAN
	db 32, SEEL
	db 28, DELIBIRD
	db 30, WOLFAN
	db 30, DELIBIRD
	db 31, JYNX
	db 32, JYNX
	; day
	db 28, WOLFAN
	db 32, SEEL
	db 28, DELIBIRD
	db 30, WOLFAN
	db 30, DELIBIRD
	db 31, JYNX
	db 32, JYNX
	; nite
	db 28, WOLFAN
	db 32, SEEL
	db 28, SNEASEL
	db 30, WOLFAN
	db 30, SNEASEL
	db 31, GOLBAT
	db 32, GOLBAT

	map_id ROUTE_112
	db 10 percent, 10 percent, 10 percent ; encounter rates: morn/day/nite
	IF DEF(_GOLD)
	; morn
	db 32, RATICATE
	db 33, NIDORINA
	db 32, WOLFAN
	db 33, NIDORINO
	db 33, PHANPY
	db 31, SKARMORY
	db 34, SKARMORY
	; day
	db 32, RATICATE
	db 33, NIDORINA
	db 32, WOLFAN
	db 33, NIDORINO
	db 33, PHANPY
	db 31, SKARMORY
	db 34, SKARMORY
	; nite
	db 32, RATICATE
	db 34, POLIWHIRL
	db 32, WOLFAN
	db 33, GOLBAT
	db 33, SKARMORY
	db 31, SNEASEL
	db 34, SNEASEL
	
	ELIF DEF(_SILVER)
	; morn
	db 32, RATICATE
	db 33, NIDORINO
	db 32, WOLFAN
	db 33, NIDORINA
	db 33, PHANPY
	db 31, SKARMORY
	db 34, SKARMORY
	; day
	db 32, PHANPY
	db 33, NIDORINO
	db 32, WOLFAN
	db 33, NIDORINA
	db 33, SKARMORY
	db 31, SKARMORY
	db 34, RATICATE
	; nite
	db 32, RATICATE
	db 34, POLIWHIRL
	db 32, WOLFAN
	db 33, SKARMORY
	db 33, GOLBAT
	db 31, SNEASEL
	db 34, SNEASEL
	ENDC

	map_id DRAGONS_MAW
	db 10 percent, 10 percent, 10 percent ; encounter rates: morn/day/nite
	; morn
	db 33, TYROGUE
	db 32, ARBOK
	db 33, PHANPY
	db 34, DONPHAN
	db 33, SMEARGLE
	db 34, GOLBAT
	db 35, GOLBAT
	; day
	db 33, TYROGUE
	db 32, ARBOK
	db 33, PHANPY
	db 34, DONPHAN
	db 33, SMEARGLE
	db 34, GOLBAT
	db 35, GOLBAT
	; nite
	db 33, TYROGUE
	db 32, ARBOK
	db 33, PHANPY
	db 34, BELLRUN
	db 33, SMEARGLE
	db 34, GOLBAT
	db 35, GOLBAT
	
	map_id NATIONAL_PARK
	db 10 percent, 10 percent, 10 percent ; encounter rates: morn/day/nite
	; morn
	db 34, SKIPLOOM
	db 34, SNUBBULL
	db 35, SUNFLORA
	db 33, TOGEPI
	db 34, SCYTHER
	db 35, CHANSEY
	db 36, CHANSEY
	; day
	db 34, SKIPLOOM
	db 34, SNUBBULL
	db 35, SUNFLORA
	db 33, TOGEPI
	db 34, SCYTHER
	db 35, CHANSEY
	db 36, CHANSEY
	; nite
	db 34, GLOOM
	db 34, CUBONE
	db 35, NOCTOWL
	db 33, BELLRUN
	db 34, SCYTHER
	db 35, CHANSEY
	db 36, CHANSEY

	map_id MAGMA_SHAFT_B1F
	db 4 percent, 4 percent, 4 percent ; encounter rates: morn/day/nite
	; morn
	db 37, KOFFING
	db 38, GRAVELER
	db 37, RHYHORN
	db 39, MAGMAR
	db 40, BOMSHEAL
	db 40, WEEZING
	db 40, MAGMAR
	; day
	db 37, KOFFING
	db 38, GRAVELER
	db 37, RHYHORN
	db 39, MAGMAR
	db 40, BOMSHEAL
	db 40, WEEZING
	db 40, MAGMAR
	; nite
	db 37, KOFFING
	db 38, GRAVELER
	db 37, RHYHORN
	db 39, MAGMAR
	db 40, BOMSHEAL
	db 40, WEEZING
	db 40, MAGMAR
	
	map_id MAGMA_SHAFT_1F
	db 4 percent, 4 percent, 4 percent ; encounter rates: morn/day/nite
	; morn
	db 37, GRIMER
	db 38, GRAVELER
	db 37, RHYHORN
	db 39, MAGMAR
	db 40, BOMSHEAL
	db 40, MUK
	db 40, MAGMAR
	; day
	db 37, GRIMER
	db 38, GRAVELER
	db 37, RHYHORN
	db 39, MAGMAR
	db 40, BOMSHEAL
	db 40, MUK
	db 40, MAGMAR
	; nite
	db 37, GRIMER
	db 38, GRAVELER
	db 37, RHYHORN
	db 39, MAGMAR
	db 40, BOMSHEAL
	db 40, MUK
	db 40, MAGMAR
	
	map_id MAGMA_SHAFT_B2F
	db 4 percent, 4 percent, 4 percent ; encounter rates: morn/day/nite
	; morn
	db 37, GRIMER
	db 38, GRAVELER
	db 37, RHYHORN
	db 39, MAGMAR
	db 40, BOMSHEAL
	db 40, MAGMAR
	db 42, STEELIX
	; day
	db 37, GRIMER
	db 38, GRAVELER
	db 37, RHYHORN
	db 39, MAGMAR
	db 40, BOMSHEAL
	db 40, MAGMAR
	db 42, STEELIX
	; nite
	db 37, GRIMER
	db 38, GRAVELER
	db 37, RHYHORN
	db 39, MAGMAR
	db 40, BOMSHEAL
	db 40, MAGMAR
	db 42, STEELIX

	map_id WHIRL_ISLAND_B1F
	db 4 percent, 4 percent, 4 percent ; encounter rates: morn/day/nite
	; morn
	db 33, KRABBY
	db 33, SLOWPOKE
	db 34, SEEL
	db 34, GOLBAT
	db 36, SLOWBRO
	db 35, KINGLER
	db 35, KINGLER
	; day
	db 33, KRABBY
	db 33, SLOWPOKE
	db 34, SEEL
	db 34, GOLBAT
	db 36, SLOWBRO
	db 35, KINGLER
	db 35, KINGLER
	; nite
	db 33, KRABBY
	db 33, SLOWPOKE
	db 34, SEEL
	db 34, GOLBAT
	db 36, SLOWBRO
	db 35, KINGLER
	db 35, KINGLER
	
	map_id WHIRL_ISLAND_B2F
	db 4 percent, 4 percent, 4 percent ; encounter rates: morn/day/nite
	; morn
	db 33, KRABBY
	db 33, SLOWPOKE
	db 34, SEEL
	db 34, GOLBAT
	db 36, SLOWBRO
	db 35, KINGLER
	db 35, KINGLER
	; day
	db 33, KRABBY
	db 33, SLOWPOKE
	db 34, SEEL
	db 34, GOLBAT
	db 36, SLOWBRO
	db 35, KINGLER
	db 35, KINGLER
	; nite
	db 33, KRABBY
	db 33, SLOWPOKE
	db 34, SEEL
	db 34, GOLBAT
	db 36, SLOWBRO
	db 35, KINGLER
	db 35, KINGLER
	
	map_id WHIRL_ISLAND_1F
	db 4 percent, 4 percent, 4 percent ; encounter rates: morn/day/nite
	; morn
	db 33, KRABBY
	db 33, SLOWPOKE
	db 34, SEEL
	db 34, GOLBAT
	db 36, SLOWBRO
	db 35, KINGLER
	db 35, KINGLER
	; day
	db 33, KRABBY
	db 33, SLOWPOKE
	db 34, SEEL
	db 34, GOLBAT
	db 36, SLOWBRO
	db 35, KINGLER
	db 35, KINGLER
	; nite
	db 33, KRABBY
	db 33, SLOWPOKE
	db 34, SEEL
	db 34, GOLBAT
	db 36, SLOWBRO
	db 35, KINGLER
	db 35, KINGLER

	map_id ROUTE_113
	db 10 percent, 10 percent, 10 percent ; encounter rates: morn/day/nite
	; morn
	db 38, FARFETCH_D
	db 39, SANDSLASH
	db 38, PONYTA
	db 41, DODRIO
	db 41, RAPIDASH
	db 40, MADAME
	db 42, MADAME
	; day
	db 38, FARFETCH_D
	db 39, SANDSLASH
	db 38, PONYTA
	db 41, DODRIO
	db 41, RAPIDASH
	db 40, MADAME
	db 42, MADAME
	; nite
	db 38, KURSTRAW
	db 39, VENOMOTH
	db 38, TWINZ
	db 41, NOCTOWL
	db 41, GIRAFARIG
	db 40, PANGSHI
	db 42, PANGSHI
	
	map_id ROUTE_114
	db 10 percent, 10 percent, 10 percent ; encounter rates: morn/day/nite
	; morn
	IF DEF(_GOLD)
	db 39, PIDGEOTTO
	db 39, RATICATE
	db 40, TANGELA
	db 40, JIGGLYPUFF
	db 43, SKARMORY
	db 41, MR__MIME
	db 42, MR__MIME
	; day
	db 39, PIDGEOTTO
	db 39, RATICATE
	db 40, TANGELA
	db 40, JIGGLYPUFF
	db 43, SKARMORY
	db 41, MR__MIME
	db 42, MR__MIME
	; nite
	db 39, NOCTOWL
	db 39, RATICATE
	db 40, GOLBAT
	db 40, JIGGLYPUFF
	db 43, SKARMORY
	db 41, MR__MIME
	db 42, MR__MIME
	
	ELIF DEF(_SILVER)
	; morn
	db 39, PIDGEOTTO
	db 39, TANGELA
	db 40, JIGGLYPUFF
	db 40, SKARMORY
	db 43, RATICATE
	db 41, MR__MIME
	db 42, MR__MIME
	; day
	db 39, PIDGEOTTO
	db 39, TANGELA
	db 40, JIGGLYPUFF
	db 40, SKARMORY
	db 43, RATICATE
	db 41, MR__MIME
	db 42, MR__MIME
	; nite
	db 39, NOCTOWL
	db 39, GOLBAT
	db 40, JIGGLYPUFF
	db 40, SKARMORY
	db 43, RATICATE
	db 41, MR__MIME
	db 42, MR__MIME
	ENDC
	
	
	map_id KANTO_REGION
	db 10 percent, 10 percent, 10 percent ; encounter rates: morn/day/nite
	IF DEF(_GOLD)
	; morn
	db 39, PIDGEOTTO
	db 39, RATICATE
	db 40, BUTTERFREE
	db 40, JIGGLYPUFF
	db 43, FEAROW
	db 40, PIKACHU
	db 43, MR__MIME
	; day
	db 39, PIDGEOTTO
	db 39, RATICATE
	db 40, BUTTERFREE
	db 40, JIGGLYPUFF
	db 43, FEAROW
	db 40, PIKACHU
	db 43, MR__MIME
	; nite
	db 39, GOLBAT
	db 39, RATICATE
	db 40, VENOMOTH
	db 40, GLOOM
	db 43, PERSIAN
	db 40, PIKACHU
	db 43, MR__MIME

	
	ELIF DEF(_SILVER)
	; morn
	db 39, PIDGEOTTO
	db 39, RATICATE
	db 40, BEEDRILL
	db 40, JIGGLYPUFF
	db 43, FEAROW
	db 40, PIKACHU
	db 43, MR__MIME
	; day
	db 39, PIDGEOTTO
	db 39, RATICATE
	db 40, BEEDRILL
	db 40, JIGGLYPUFF
	db 43, FEAROW
	db 40, PIKACHU
	db 43, MR__MIME
	; nite
	db 39, GOLBAT
	db 39, PERSIAN
	db 40, VENOMOTH
	db 40, GLOOM
	db 43, RATICATE
	db 40, PIKACHU
	db 43, MR__MIME
	ENDC
	
	map_id DIGLETTS_CAVE
	db 4 percent, 2 percent, 8 percent ; encounter rates: morn/day/nite
	; morn
	db 24, DIGLETT
	db 24, DIGLETT
	db 32, DIGLETT
	db 34, DIGLETT
	db 40, DUGTRIO
	db 42, DUGTRIO
	db 44, DUGTRIO
	; day
	db 20, DIGLETT
	db 24, DIGLETT
	db 28, DIGLETT
	db 32, DIGLETT
	db 36, DUGTRIO
	db 42, DUGTRIO
	db 44, DUGTRIO
	; nite
	db 24, DIGLETT
	db 28, DIGLETT
	db 32, DIGLETT
	db 38, DIGLETT
	db 42, DUGTRIO
	db 44, DUGTRIO
	db 46, DUGTRIO

	map_id MOUNT_MOON
	db 6 percent, 6 percent, 6 percent ; encounter rates: morn/day/nite
	; morn
	db 36, GOLBAT
	db 38, GEODUDE
	db 38, SANDSLASH
	db 42, PARASECT
	db 40, GRAVELER
	db 38, CLEFAIRY
	db 38, CLEFAIRY
	; day
	db 36, GOLBAT
	db 38, GEODUDE
	db 38, SANDSLASH
	db 42, PARASECT
	db 40, GRAVELER
	db 38, CLEFAIRY
	db 38, CLEFAIRY
	; nite
	db 36, GOLBAT
	db 38, GEODUDE
	db 38, CLEFAIRY
	db 42, PARASECT
	db 40, GRAVELER
	db 42, CLEFAIRY
	db 42, CLEFAIRY

	map_id ROCK_TUNNEL_1F
	db 6 percent, 6 percent, 6 percent ; encounter rates: morn/day/nite
	; morn
	db 37, CUBONE
	db 38, GEODUDE
	db 40, MACHOKE
	db 42, GOLBAT
	db 41, MACHOKE
	db 42, MAROWAK
	db 42, MAROWAK
	; day
	db 37, CUBONE
	db 38, GEODUDE
	db 40, MACHOKE
	db 42, GOLBAT
	db 41, MACHOKE
	db 42, MAROWAK
	db 42, MAROWAK
	; nite
	db 40, GOLBAT
	db 38, GEODUDE
	db 40, GRAVELER
	db 42, HAUNTER
	db 43, GOLBAT
	db 44, GOLBAT
	db 43, CROBAT

	map_id ROCK_TUNNEL_B1F
	db 6 percent, 6 percent, 6 percent ; encounter rates: morn/day/nite
	; morn
	db 40, CUBONE
	db 41, GRAVELER
	db 43, ONIX
	db 41, GOLBAT
	db 42, MAROWAK
	db 41, KANGASKHAN
	db 41, KANGASKHAN
	; day
	db 40, CUBONE
	db 41, GRAVELER
	db 43, ONIX
	db 41, GOLBAT
	db 42, MAROWAK
	db 41, KANGASKHAN
	db 41, KANGASKHAN
	; nite
	db 40, GOLBAT
	db 41, GRAVELER
	db 43, ONIX
	db 41, GOLBAT
	db 42, HAUNTER
	db 43, CROBAT
	db 43, CROBAT

	map_id KANTO_POWER_PLANT
	db 6 percent, 6 percent, 6 percent ; encounter rates: morn/day/nite
	; morn
	db 38, VOLTORB
	db 38, MAGNEMITE
	db 37, PIKACHU
	db 40, MAGNETON
	db 43, ELECTRODE
	db 42, ELECTABUZZ
	db 42, ELECTABUZZ
	; day
	db 38, VOLTORB
	db 38, MAGNEMITE
	db 37, PIKACHU
	db 40, MAGNETON
	db 43, ELECTRODE
	db 42, ELECTABUZZ
	db 42, ELECTABUZZ
	; nite
	db 38, VOLTORB
	db 38, MAGNEMITE
	db 37, PIKACHU
	db 40, PIKACHU
	db 42, MAGNETON
	db 42, RAICHU
	db 42, ELECTABUZZ

	map_id POKEMON_TOWER_2F
	db 3 percent, 3 percent, 3 percent ; encounter rates: morn/day/nite
	; morn
	db 36, GASTLY
	db 38, GASTLY
	db 38, GASTLY
	db 42, CUBONE
	db 40, CUBONE
	db 38, GASTLY
	db 38, GASTLY
	; day
	db 36, GASTLY
	db 38, GASTLY
	db 38, GASTLY
	db 42, CUBONE
	db 40, CUBONE
	db 38, HAUNTER
	db 38, HAUNTER
	; nite
	db 36, GASTLY
	db 38, GASTLY
	db 38, GASTLY
	db 42, HAUNTER
	db 40, HAUNTER
	db 42, CUBONE
	db 42, CUBONE

	map_id POKEMON_TOWER_3F
	db 3 percent, 3 percent, 3 percent ; encounter rates: morn/day/nite
	; morn
	db 36, GASTLY
	db 38, GASTLY
	db 38, CUBONE
	db 42, CUBONE
	db 40, HAUNTER
	db 38, HAUNTER
	db 38, MAROWAK
	; day
	db 36, GASTLY
	db 38, GASTLY
	db 38, CUBONE
	db 42, CUBONE
	db 40, HAUNTER
	db 38, HAUNTER
	db 38, MAROWAK
	; nite
	db 36, GASTLY
	db 38, HAUNTER
	db 38, HAUNTER
	db 42, HAUNTER
	db 40, MAROWAK
	db 42, MAROWAK
	db 42, MAROWAK

	map_id SEAFOAM_ISLANDS_1F
	db 6 percent, 6 percent, 6 percent ; encounter rates: morn/day/nite
	; morn
	db 40, SEEL
	db 41, SHELLDER
	db 42, KRABBY
	db 42, SLOWPOKE
	db 42, PSYDUCK
	db 45, GOLDUCK
	db 43, SLOWBRO
	; day
	db 40, SEEL
	db 41, SHELLDER
	db 42, KRABBY
	db 42, SLOWPOKE
	db 42, PSYDUCK
	db 43, GOLDUCK
	db 43, SLOWBRO
	; nite
	db 40, SEEL
	db 41, STARYU
	db 42, KRABBY
	db 42, STARYU
	db 42, PSYDUCK
	db 43, GOLDUCK
	db 43, SLOWBRO

	map_id SEAFOAM_ISLANDS_B1F
	db 6 percent, 6 percent, 6 percent ; encounter rates: morn/day/nite
	; morn
	db 40, SEEL
	db 41, SHELLDER
	db 42, KRABBY
	db 42, SLOWPOKE
	db 42, JYNX
	db 43, KINGLER
	db 43, SLOWBRO
	; day
	db 40, SEEL
	db 41, SHELLDER
	db 42, KRABBY
	db 42, SLOWPOKE
	db 42, JYNX
	db 43, KINGLER
	db 43, SLOWBRO
	; nite
	db 40, SEEL
	db 41, STARYU
	db 42, KRABBY
	db 42, STARYU
	db 42, JYNX
	db 43, GOLDUCK
	db 43, SLOWBRO

	map_id SAFARI_ZONE_BETA
	db 10 percent, 10 percent, 10 percent ; encounter rates: morn/day/nite
	; morn
	db 39, NIDORINO
	db 39, NIDORINA
	db 40, EXEGGCUTE
	db 40, RHYHORN
	db 43, SCYTHER
	db 40, TAUROS
	db 43, CHANSEY
	; day
	db 39, NIDORINO
	db 39, NIDORINA
	db 40, EXEGGCUTE
	db 40, RHYHORN
	db 43, SCYTHER
	db 40, PINSIR
	db 43, CHANSEY
	; nite
	db 39, NIDORINO
	db 39, NIDORINA
	db 40, VENOMOTH
	db 40, RHYHORN
	db 43, PINSIR
	db 40, KANGASKHAN
	db 43, CHANSEY

	map_id KANTO_VICTORY_ROAD
	db 6 percent, 6 percent, 6 percent ; encounter rates: morn/day/nite
	; morn
	db 40, GRAVELER
	db 41, RHYHORN
	db 43, ONIX
	db 44, GOLBAT
	db 42, SANDSLASH
	db 43, RHYDON
	db 43, RHYDON
	; day
	db 42, GRAVELER
	db 41, RHYHORN
	db 43, ONIX
	db 44, GOLBAT
	db 42, SANDSLASH
	db 43, RHYDON
	db 43, RHYDON
	; nite
	db 42, GOLBAT
	db 41, GRAVELER
	db 42, ONIX
	db 43, GRAVELER
	db 44, GRAVELER
	db 45, GRAVELER
	db 45, GRAVELER
	
	map_id ROUTE_115
	db 10 percent, 10 percent, 10 percent ; encounter rates: morn/day/nite
	; morn
	db 40, DODUO
	db 42, ARBOK
	db 42, RATICATE
	db 42, GRAVELER
	db 43, TAUROS
	db 42, DODRIO
	db 44, DODRIO
	; day
	db 40, DODUO
	db 42, ARBOK
	db 42, RATICATE
	db 42, GRAVELER
	db 43, TAUROS
	db 42, DODRIO
	db 44, DODRIO
	; nite
	db 40, QUAGSIRE
	db 42, NOCTOWL
	db 42, RATICATE
	db 42, GRAVELER
	db 43, NOCTOWL
	db 42, MURKROW
	db 44, MURKROW
	
	map_id VICTORY_ROAD
	db 4 percent, 4 percent, 4 percent ; encounter rates: morn/day/nite
	; morn
	db 42, ONIX
	db 42, GOLBAT
	db 43, RHYHORN
	db 43, GRAVELER
	db 44, DONPHAN
	db 44, KANGASKHAN
	db 46, KANGASKHAN
	; day
	db 42, ONIX
	db 42, GOLBAT
	db 43, RHYHORN
	db 43, GRAVELER
	db 44, DONPHAN
	db 44, KANGASKHAN
	db 46, KANGASKHAN
	; nite
	db 42, ONIX
	db 42, GOLBAT
	db 43, RHYHORN
	db 43, GRAVELER
	db 44, BELLRUN
	db 44, KANGASKHAN
	db 46, KANGASKHAN
	
	map_id VICTORY_ROAD_2F
	db 4 percent, 4 percent, 4 percent ; encounter rates: morn/day/nite
	; morn
	db 43, RHYHORN
	db 43, GOLBAT
	db 44, MACHOKE
	db 44, DUGTRIO
	db 46, RHYDON
	db 45, KANGASKHAN
	db 46, KANGASKHAN
	; day
	db 43, RHYHORN
	db 43, GOLBAT
	db 44, MACHOKE
	db 44, DUGTRIO
	db 46, RHYDON
	db 45, KANGASKHAN
	db 46, KANGASKHAN
	; nite
	db 43, RHYHORN
	db 43, GOLBAT
	db 44, MACHOKE
	db 44, DUGTRIO
	db 46, RHYDON
	db 45, KANGASKHAN
	db 46, KANGASKHAN
	
	map_id TIDAL_GROTTO_1F
	db 4 percent, 4 percent, 4 percent ; encounter rates: morn/day/nite
	; morn
	db 37, GOLBAT
	db 38, POLIWHIRL
	db 37, TURBAN
	db 39, POLIWHIRL
	db 40, GOLDUCK
	db 40, SLOWBRO
	db 40, SLOWBRO
	; day
	db 37, GOLBAT
	db 38, POLIWHIRL
	db 37, TURBAN
	db 39, POLIWHIRL
	db 40, GOLDUCK
	db 40, SLOWBRO
	db 40, SLOWBRO
	; nite
	db 37, GOLBAT
	db 38, POLIWHIRL
	db 37, TURBAN
	db 39, POLIWHIRL
	db 40, GOLDUCK
	db 40, SLOWBRO
	db 40, SLOWBRO
	
	map_id TIDAL_GROTTO_B1F
	db 4 percent, 4 percent, 4 percent ; encounter rates: morn/day/nite
	; morn
	db 37, GOLBAT
	db 38, POLIWHIRL
	db 37, TURBAN
	db 39, POLIWHIRL
	db 40, GOLDUCK
	db 40, SLOWBRO
	db 40, SLOWBRO
	; day
	db 37, GOLBAT
	db 38, POLIWHIRL
	db 37, TURBAN
	db 39, POLIWHIRL
	db 40, GOLDUCK
	db 40, SLOWBRO
	db 40, SLOWBRO
	; nite
	db 37, GOLBAT
	db 38, POLIWHIRL
	db 37, TURBAN
	db 39, POLIWHIRL
	db 40, GOLDUCK
	db 40, SLOWBRO
	db 40, SLOWBRO

	db -1 ; end
