; Kanto Pokémon in grass

KantoGrassWildMons:

	map_id SEASIDE_PATH
	db 10 percent, 10 percent, 10 percent ; encounter rates: morn/day/nite
	; morn
	db 44, GOLDUCK
	db 45, FEAROW
	db 45, PIDGEOTTO
	db 48, PIDGEOT
	db 44, RAPIDASH
	db 46, DODRIO
	db 48, DODRIO
	; day
	db 44, GOLDUCK
	db 45, FEAROW
	db 45, PIDGEOTTO
	db 48, PIDGEOT
	db 44, RAPIDASH
	db 46, DODRIO
	db 48, DODRIO
	; nite
	db 44, GOLDUCK
	db 45, MURKROW
	db 45, GOLBAT
	db 48, NOCTOWL
	db 44, RAPIDASH
	db 46, QUAGSIRE
	db 48, QUAGSIRE
	
	map_id JOULE_CAVE
	db 4 percent, 4 percent, 4 percent ; encounter rates: morn/day/nite
	; morn
	db 45, GRAVELER
	db 46, MAGNETON
	db 46, ELECTRODE
	db 45, GOLBAT
	db 46, ELECTABUZZ
	db 45, GOLBAT
	db 47, GOLBAT
	; day
	db 45, GRAVELER
	db 46, MAGNETON
	db 46, ELECTRODE
	db 45, GOLBAT
	db 46, ELECTABUZZ
	db 45, GOLBAT
	db 47, GOLBAT
	; nite
	db 45, GRAVELER
	db 46, MAGNETON
	db 46, ELECTRODE
	db 45, GOLBAT
	db 46, ELECTABUZZ
	db 45, GOLBAT
	db 47, GOLBAT
	
	map_id JOULE_CAVE_ZAPDOS_ROOM
	db 4 percent, 4 percent, 4 percent ; encounter rates: morn/day/nite
	; morn
	db 45, GRAVELER
	db 46, MAGNETON
	db 46, ELECTRODE
	db 45, GOLBAT
	db 46, ELECTABUZZ
	db 45, GOLBAT
	db 47, GOLBAT
	; day
	db 45, GRAVELER
	db 46, MAGNETON
	db 46, ELECTRODE
	db 45, GOLBAT
	db 46, ELECTABUZZ
	db 45, GOLBAT
	db 47, GOLBAT
	; nite
	db 45, GRAVELER
	db 46, MAGNETON
	db 46, ELECTRODE
	db 45, GOLBAT
	db 46, ELECTABUZZ
	db 45, GOLBAT
	db 47, GOLBAT

	map_id MERIDIAN_PATH
	db 10 percent, 10 percent, 10 percent ; encounter rates: morn/day/nite
	IF DEF(_GOLD)
	; morn
	db 46, DODUO
	db 48, EXEGGCUTE
	db 50, NIDORINO
	db 50, GROWLITHE
	db 52, TAUROS
	db 50, DODRIO
	db 50, DODRIO
	; day
	db 46, DODUO
	db 48, EXEGGCUTE
	db 50, NIDORINO
	db 50, GROWLITHE
	db 52, TAUROS
	db 50, DODRIO
	db 50, DODRIO
	; nite
	db 46, QUAGSIRE
	db 48, EXEGGCUTE
	db 50, NIDORINO
	db 50, GIRAFARIG
	db 52, QUAGSIRE
	db 50, NOCTOWL
	db 50, NOCTOWL
	
	ELIF DEF(_SILVER)
	; morn
	db 46, DODUO
	db 48, EXEGGCUTE
	db 50, NIDORINO
	db 50, VULPIX
	db 52, TAUROS
	db 50, DODRIO
	db 50, DODRIO
	; day
	db 46, DODUO
	db 48, EXEGGCUTE
	db 50, NIDORINO
	db 50, VULPIX
	db 52, TAUROS
	db 50, DODRIO
	db 50, DODRIO
	; nite
	db 46, QUAGSIRE
	db 48, EXEGGCUTE
	db 50, NIDORINO
	db 50, GIRAFARIG
	db 52, QUAGSIRE
	db 50, NOCTOWL
	db 50, NOCTOWL
	ENDC
	
	map_id URASOE_PARK
	db 10 percent, 10 percent, 10 percent ; encounter rates: morn/day/nite
	; morn
	db 49, EXEGGCUTE
	db 48, NIDORINA
	db 50, SUNFLORA
	db 48, PINSIR
	db 48, SCYTHER
	db 48, CHANSEY
	db 50, CHANSEY
	; day
	db 49, EXEGGCUTE
	db 48, NIDORINA
	db 50, SUNFLORA
	db 48, PINSIR
	db 48, SCYTHER
	db 48, CHANSEY
	db 50, CHANSEY
	; nite
	db 49, EXEGGCUTE
	db 48, NIDORINA
	db 50, TUHEAD
	db 48, PINSIR
	db 48, SCYTHER
	db 48, CHANSEY
	db 50, CHANSEY
	
	map_id CHARRED_SUMMIT_CAVE
	db 4 percent, 4 percent, 4 percent ; encounter rates: morn/day/nite
	; morn
	db 50, WEEZING
	db 48, GRAVELER
	db 48, RHYHORN
	db 52, HOUNDOOM
	db 50, BOMSHEAL
	db 50, MAGMAR
	db 52, MAGMAR
	; day
	db 50, WEEZING
	db 48, GRAVELER
	db 48, RHYHORN
	db 52, HOUNDOOM
	db 50, BOMSHEAL
	db 50, MAGMAR
	db 52, MAGMAR
	; nite
	db 50, WEEZING
	db 48, GRAVELER
	db 48, RHYHORN
	db 52, HOUNDOOM
	db 50, BOMSHEAL
	db 50, MAGMAR
	db 52, MAGMAR
	
	map_id URASOE_TRAIL
	db 10 percent, 10 percent, 10 percent ; encounter rates: morn/day/nite
	IF DEF(_GOLD)
	; morn
	db 52, PIDGEOTTO
	db 53, GROWLITHE
	db 54, PIDGEOT
	db 53, MADAME
	db 52, RATICATE
	db 53, JUMPLUFF
	db 53, JUMPLUFF
	; day
	db 52, PIDGEOTTO
	db 53, GROWLITHE
	db 54, PIDGEOT
	db 53, MADAME
	db 52, RATICATE
	db 53, JUMPLUFF
	db 53, JUMPLUFF
	; nite
	db 52, NOCTOWL
	db 53, BELLRUN
	db 54, GOLBAT
	db 53, GOLDUCK
	db 52, PERSIAN
	db 53, NOCTOWL
	db 53, NOCTOWL
	
	ELIF DEF(_SILVER)
	; morn
	db 52, PIDGEOTTO
	db 53, VULPIX
	db 54, PIDGEOT
	db 53, MADAME
	db 52, RATICATE
	db 53, JUMPLUFF
	db 53, JUMPLUFF
	; day
	db 52, PIDGEOTTO
	db 53, VULPIX
	db 54, PIDGEOT
	db 53, MADAME
	db 52, RATICATE
	db 53, JUMPLUFF
	db 53, JUMPLUFF
	; nite
	db 52, NOCTOWL
	db 53, PERSIAN
	db 54, GOLBAT
	db 53, GOLDUCK
	db 52, BELLRUN
	db 53, NOCTOWL
	db 53, NOCTOWL
	ENDC
	
	map_id NANJO_FOREST
	db 2 percent, 2 percent, 2 percent ; encounter rates: morn/day/nite
	; morn
	db 53, PARASECT
	db 53, FEAROW
	db 54, JUMPLUFF
	db 53, SKIPLOOM
	db 55, SUNFLORA
	db 53, AIPOM
	db 55, AIPOM
	; day
	db 53, PARASECT
	db 53, FEAROW
	db 54, JUMPLUFF
	db 53, SKIPLOOM
	db 55, SUNFLORA
	db 53, AIPOM
	db 55, AIPOM
	; nite
	db 53, PARASECT
	db 53, NOCTOWL
	db 54, JUMPLUFF
	db 53, SKIPLOOM
	db 55, MURKROW
	db 53, AIPOM
	db 55, AIPOM

	map_id KUME_POINT
	db 10 percent, 10 percent, 10 percent ; encounter rates: morn/day/nite
	; morn
	db 54, PIDGEOTTO
	db 54, SKIPLOOM
	db 55, PIDGEOT
	db 55, MADAME
	db 54, RATICATE
	db 55, JUMPLUFF
	db 55, JUMPLUFF
	; day
	db 54, PIDGEOTTO
	db 54, SKIPLOOM
	db 55, PIDGEOT
	db 55, MADAME
	db 54, RATICATE
	db 55, JUMPLUFF
	db 55, JUMPLUFF
	; nite
	db 54, NOCTOWL
	db 54, RATICATE
	db 55, NOCTOWL
	db 55, MADAME
	db 54, RATICATE
	db 55, NOCTOWL
	db 55, NOCTOWL
	
	map_id RESEARCH_FACILITY_ENTRANCE
	db 4 percent, 4 percent, 4 percent ; encounter rates: morn/day/nite
	; morn
	db 52, MAGNETON
	db 52, ELECTRODE
	db 53, HAUNTER
	db 53, PANGSHI
	db 52, RATICATE
	db 53, RATICATE
	db 53, RATICATE
	; day
	db 52, MAGNETON
	db 52, ELECTRODE
	db 53, HAUNTER
	db 53, PANGSHI
	db 52, RATICATE
	db 53, RATICATE
	db 53, RATICATE
	; nite
	db 52, MAGNETON
	db 52, ELECTRODE
	db 53, HAUNTER
	db 53, PANGSHI
	db 52, RATICATE
	db 53, RATICATE
	db 53, RATICATE

	
	map_id ICED_CAVERN_1F
	db 4 percent, 4 percent, 4 percent ; encounter rates: morn/day/nite
	; morn
	db 55, GOLBAT
	db 56, DEWGONG
	db 55, WOLFAN
	db 55, SLOWPOKE
	db 57, JYNX
	db 56, QUAGSIRE
	db 58, JYNX
	; day
	db 55, GOLBAT
	db 56, DEWGONG
	db 55, WOLFAN
	db 55, SLOWPOKE
	db 57, JYNX
	db 56, QUAGSIRE
	db 58, JYNX
	; nite
	db 55, GOLBAT
	db 56, DEWGONG
	db 55, WOLFAN
	db 55, SLOWPOKE
	db 57, SNEASEL
	db 56, QUAGSIRE
	db 58, SNEASEL
	
	map_id ICED_CAVERN_B1F
	db 4 percent, 4 percent, 4 percent ; encounter rates: morn/day/nite
	; morn
	db 55, GOLBAT
	db 56, DEWGONG
	db 55, WOLFAN
	db 55, SLOWBRO
	db 57, JYNX
	db 56, WARWOLF
	db 58, JYNX
	; day
	db 55, GOLBAT
	db 56, DEWGONG
	db 55, WOLFAN
	db 55, SLOWBRO
	db 57, JYNX
	db 56, WARWOLF
	db 58, JYNX
	; nite
	db 55, GOLBAT
	db 56, DEWGONG
	db 55, WOLFAN
	db 55, SLOWBRO
	db 57, SNEASEL
	db 56, WARWOLF
	db 58, SNEASEL


	map_id TROPICAL_ISLAND
	db 6 percent, 6 percent, 6 percent ; encounter rates: morn/day/nite
	; morn
	db 55, SLOWPOKE
	db 56, WEEPINBELL
	db 55, PSYDUCK
	db 55, EXEGGUTOR
	db 57, EXEGGUTOR
	db 56, BELMITT
	db 58, BELMITT
	; day
	db 55, SLOWPOKE
	db 56, WEEPINBELL
	db 55, PSYDUCK
	db 55, EXEGGUTOR
	db 57, EXEGGUTOR
	db 56, BELMITT
	db 58, BELMITT
	; nite
	db 55, SLOWPOKE
	db 56, POLIWHIRL
	db 55, GOLDUCK
	db 55, EXEGGUTOR
	db 57, EXEGGUTOR
	db 56, POLITOED
	db 58, POLITOED

	map_id TROPICAL_ISLAND_JUNGLE
	db 6 percent, 6 percent, 6 percent ; encounter rates: morn/day/nite
	; morn
	IF DEF(_GOLD)
	db 55, WEEPINBELL
	db 56, BUTTERFREE
	db 55, LICKITUNG
	db 55, PRIMEAPE
	db 57, PARASECT
	db 56, LICKILORD
	db 58, LICKILORD
	; day
	db 55, WEEPINBELL
	db 56, BUTTERFREE
	db 55, LICKITUNG
	db 55, PRIMEAPE
	db 57, PARASECT
	db 56, LICKILORD
	db 58, LICKILORD
	; nite
	db 55, GLOOM
	db 56, VENOMOTH
	db 55, LICKITUNG
	db 55, PRIMEAPE
	db 57, PARASECT
	db 56, LICKILORD
	db 58, VILEPLUME
	
	ELIF DEF(_SILVER)
	db 55, WEEPINBELL
	db 56, BEEDRILL
	db 55, LICKITUNG
	db 55, PRIMEAPE
	db 57, PARASECT
	db 56, LICKILORD
	db 58, LICKILORD
	; day
	db 55, WEEPINBELL
	db 56, BEEDRILL
	db 55, LICKITUNG
	db 55, PRIMEAPE
	db 57, PARASECT
	db 56, LICKILORD
	db 58, LICKILORD
	; nite
	db 55, GLOOM
	db 56, VENOMOTH
	db 55, LICKITUNG
	db 55, PRIMEAPE
	db 57, PARASECT
	db 56, LICKILORD
	db 58, VILEPLUME
	ENDC
	
	map_id RAINBOW_ISLAND
	db 6 percent, 6 percent, 6 percent ; encounter rates: morn/day/nite
	IF DEF(_GOLD)
	; morn
	db 55, BUTTERFREE
	db 56, TRIPSTAR
	db 55, JIGGLYPUFF
	db 55, PIKACHU
	db 57, EXEGGUTOR
	db 56, DODRIO
	db 58, TOGEPI
	; day
	db 55, BUTTERFREE
	db 56, TRIPSTAR
	db 55, JIGGLYPUFF
	db 55, PIKACHU
	db 57, EXEGGUTOR
	db 56, PIDGEOT
	db 58, TOGEPI
	; nite
	db 55, GLOOM
	db 56, RATICATE
	db 55, JIGGLYPUFF
	db 55, MEOWTH
	db 57, EXEGGUTOR
	db 56, ONIX
	db 58, TOGEPI
	
	ELIF DEF(_SILVER)
	; morn
	db 55, BEEDRILL
	db 56, TRIPSTAR
	db 55, JIGGLYPUFF
	db 55, PIKACHU
	db 57, EXEGGUTOR
	db 56, DODRIO
	db 58, TOGEPI
	; day
	db 55, BEEDRILL
	db 56, TRIPSTAR
	db 55, JIGGLYPUFF
	db 55, PIKACHU
	db 57, EXEGGUTOR
	db 56, PIDGEOT
	db 58, TOGEPI
	; nite
	db 55, GLOOM
	db 56, RATICATE
	db 55, JIGGLYPUFF
	db 55, MEOWTH
	db 57, EXEGGUTOR
	db 56, ONIX
	db 58, TOGEPI
	ENDC
	

	map_id TATSUGO_PATH
	db 10 percent, 10 percent, 10 percent ; encounter rates: morn/day/nite
	; morn
	db 44, SKIPLOOM
	db 45, FEAROW
	db 45, PIDGEOTTO
	db 48, PIDGEOT
	db 44, JUMPLUFF
	db 46, BELLOSSOM
	db 48, BELLOSSOM
	; day
	db 44, SKIPLOOM
	db 45, FEAROW
	db 45, PIDGEOTTO
	db 48, PIDGEOT
	db 44, JUMPLUFF
	db 46, BELLOSSOM
	db 48, BELLOSSOM
	; nite
	db 44, GLOOM
	db 45, MURKROW
	db 45, GOLBAT
	db 48, NOCTOWL
	db 44, POLIWHIRL
	db 46, VILEPLUME
	db 48, VILEPLUME

	map_id KIKAI_CALDERA_1F
	db 4 percent, 4 percent, 4 percent ; encounter rates: morn/day/nite
	; morn
	db 50, MACHOKE
	db 48, GRAVELER
	db 48, MACHOKE
	db 52, WEEZING
	db 50, BOMSHEAL
	db 50, MAGMAR
	db 52, MAGMAR
	; day
	db 50, MACHOKE
	db 48, GRAVELER
	db 48, MACHOKE
	db 52, WEEZING
	db 50, BOMSHEAL
	db 50, MAGMAR
	db 52, MAGMAR
	; nite
	db 50, MACHOKE
	db 48, GRAVELER
	db 48, MACHOKE
	db 52, WEEZING
	db 50, BOMSHEAL
	db 50, MAGMAR
	db 52, MAGMAR


	map_id KIKAI_CALDERA_2F
	db 4 percent, 4 percent, 4 percent ; encounter rates: morn/day/nite
	; morn
	db 50, MACHOKE
	db 48, GRAVELER
	db 48, MACHOKE
	db 52, WEEZING
	db 50, BOMSHEAL
	db 50, HITMONCHAN
	db 50, HITMONLEE
	; day
	db 50, MACHOKE
	db 48, GRAVELER
	db 48, MACHOKE
	db 52, WEEZING
	db 50, BOMSHEAL
	db 50, HITMONCHAN
	db 50, HITMONLEE
	; nite
	db 50, MACHOKE
	db 48, GRAVELER
	db 48, MACHOKE
	db 52, WEEZING
	db 50, BOMSHEAL
	db 50, HITMONCHAN
	db 50, HITMONLEE
	
	
	map_id MOTOBU_PATH
	db 10 percent, 10 percent, 10 percent ; encounter rates: morn/day/nite
	; morn
	db 46, KRABBY
	db 46, MANKEY
	db 47, PRIMEAPE
	db 50, EXEGGCUTE
	db 47, KINGLER
	db 48, RAITORA
	db 50, PRIMEAPE
	; day
	db 46, KRABBY
	db 46, MANKEY
	db 47, PRIMEAPE
	db 50, EXEGGCUTE
	db 47, KINGLER
	db 48, RAITORA
	db 50, PRIMEAPE
	; nite
	db 46, KRABBY
	db 47, RINRING
	db 47, BELLRUN
	db 50, TANGELA
	db 46, KINGLER
	db 48, RAITORA
	db 50, GELANIA
	
	map_id CASTLE_MOUNTAIN_1F
	db 5 percent, 5 percent, 5 percent ; encounter rates: morn/day/nite
	; morn
	db 52, RATICATE
	db 52, KURSTRAW
	db 53, HAUNTER
	db 53, TUHEAD
	db 52, HAUNTER
	db 53, PANGSHI
	db 53, TUHEAD
	; day
	db 52, RATICATE
	db 52, KURSTRAW
	db 53, HAUNTER
	db 53, TUHEAD
	db 52, HAUNTER
	db 53, PANGSHI
	db 53, TUHEAD
	; nite
	db 52, RATICATE
	db 52, KURSTRAW
	db 53, HAUNTER
	db 53, TUHEAD
	db 52, HAUNTER
	db 53, PANGSHI
	db 53, TUHEAD
	
	map_id CASTLE_MOUNTAIN_1F_LONG_HALL
	db 5 percent, 5 percent, 5 percent ; encounter rates: morn/day/nite
	; morn
	db 52, RATICATE
	db 52, KURSTRAW
	db 53, HAUNTER
	db 53, TUHEAD
	db 52, HAUNTER
	db 53, PANGSHI
	db 53, TUHEAD
	; day
	db 52, RATICATE
	db 52, KURSTRAW
	db 53, HAUNTER
	db 53, TUHEAD
	db 52, HAUNTER
	db 53, PANGSHI
	db 53, TUHEAD
	; nite
	db 52, RATICATE
	db 52, KURSTRAW
	db 53, HAUNTER
	db 53, TUHEAD
	db 52, HAUNTER
	db 53, PANGSHI
	db 53, TUHEAD
	
	map_id CASTLE_MOUNTAIN_1F_DANCE_HALL
	db 3 percent, 3 percent, 3 percent ; encounter rates: morn/day/nite
	; morn
	db 52, RATICATE
	db 52, KURSTRAW
	db 53, HAUNTER
	db 53, TUHEAD
	db 52, HAUNTER
	db 53, PANGSHI
	db 53, TUHEAD
	; day
	db 52, RATICATE
	db 52, KURSTRAW
	db 53, HAUNTER
	db 53, TUHEAD
	db 52, HAUNTER
	db 53, PANGSHI
	db 53, TUHEAD
	; nite
	db 52, RATICATE
	db 52, KURSTRAW
	db 53, HAUNTER
	db 53, TUHEAD
	db 52, HAUNTER
	db 53, PANGSHI
	db 53, TUHEAD
	
	map_id CASTLE_MOUNTAIN_1F_DINING_HALL
	db 3 percent, 3 percent, 3 percent ; encounter rates: morn/day/nite
	; morn
	db 52, RATICATE
	db 52, KURSTRAW
	db 53, HAUNTER
	db 53, TUHEAD
	db 52, HAUNTER
	db 53, PANGSHI
	db 53, TUHEAD
	; day
	db 52, RATICATE
	db 52, KURSTRAW
	db 53, HAUNTER
	db 53, TUHEAD
	db 52, HAUNTER
	db 53, PANGSHI
	db 53, TUHEAD
	; nite
	db 52, RATICATE
	db 52, KURSTRAW
	db 53, HAUNTER
	db 53, TUHEAD
	db 52, HAUNTER
	db 53, PANGSHI
	db 53, TUHEAD
	
	map_id CASTLE_MOUNTAIN_2F
	db 5 percent, 5 percent, 5 percent ; encounter rates: morn/day/nite
	; morn
	db 52, HAUNTER
	db 52, KURSTRAW
	db 53, RATICATE
	db 53, BELLRUN
	db 52, HAUNTER
	db 53, PANGSHI
	db 56, TUHEAD
	; day
	db 52, HAUNTER
	db 52, KURSTRAW
	db 53, RATICATE
	db 53, BELLRUN
	db 52, HAUNTER
	db 53, PANGSHI
	db 56, TUHEAD
	; nite
	db 52, HAUNTER
	db 52, KURSTRAW
	db 53, RATICATE
	db 53, BELLRUN
	db 52, HAUNTER
	db 53, PANGSHI
	db 56, TUHEAD
	
	map_id CASTLE_MOUNTAIN_3FA
	db 3 percent, 3 percent, 3 percent ; encounter rates: morn/day/nite
	; morn
	db 52, MURKROW
	db 52, KURSTRAW
	db 53, HAUNTER
	db 53, TUHEAD
	db 52, RATICATE
	db 53, PANGSHI
	db 53, TUHEAD
	; day
	db 52, MURKROW
	db 52, KURSTRAW
	db 53, HAUNTER
	db 53, TUHEAD
	db 52, RATICATE
	db 53, PANGSHI
	db 53, TUHEAD
	; nite
	db 52, MURKROW
	db 52, KURSTRAW
	db 53, HAUNTER
	db 53, TUHEAD
	db 52, RATICATE
	db 53, PANGSHI
	db 53, TUHEAD
	
	map_id CASTLE_MOUNTAIN_3FB
	db 3 percent, 3 percent, 3 percent ; encounter rates: morn/day/nite
	; morn
	db 52, MURKROW
	db 52, KURSTRAW
	db 53, HAUNTER
	db 53, TUHEAD
	db 52, RATICATE
	db 53, PANGSHI
	db 53, TUHEAD
	; day
	db 52, MURKROW
	db 52, KURSTRAW
	db 53, HAUNTER
	db 53, TUHEAD
	db 52, RATICATE
	db 53, PANGSHI
	db 53, TUHEAD
	; nite
	db 52, MURKROW
	db 52, KURSTRAW
	db 53, HAUNTER
	db 53, TUHEAD
	db 52, RATICATE
	db 53, PANGSHI
	db 53, TUHEAD
	
	map_id CASTLE_MOUNTAIN_1F_CAVE
	db 3 percent, 3 percent, 3 percent ; encounter rates: morn/day/nite
	; morn
	db 52, DIGLETT
	db 52, GRAVELER
	db 53, DUGTRIO
	db 53, GRAVELER
	db 52, DUGTRIO
	db 53, ONIX
	db 53, GOLEM
	; day
	db 52, DIGLETT
	db 52, GRAVELER
	db 53, DUGTRIO
	db 53, GRAVELER
	db 52, DUGTRIO
	db 53, ONIX
	db 53, GOLEM
	; nite
	db 52, DIGLETT
	db 52, GRAVELER
	db 53, DUGTRIO
	db 53, GRAVELER
	db 52, DUGTRIO
	db 53, ONIX
	db 53, GOLEM
	
	map_id CASTLE_MOUNTAIN_B1F
	db 4 percent, 4 percent, 4 percent ; encounter rates: morn/day/nite
	; morn
	db 52, ONIX
	db 52, GRAVELER
	db 53, DUGTRIO
	db 53, GRAVELER
	db 52, DUGTRIO
	db 53, RHYDON
	db 53, STEELIX
	; day
	db 52, ONIX
	db 52, GRAVELER
	db 53, DUGTRIO
	db 53, GRAVELER
	db 52, DUGTRIO
	db 53, RHYDON
	db 53, STEELIX
	; nite
	db 52, ONIX
	db 52, GRAVELER
	db 53, DUGTRIO
	db 53, GRAVELER
	db 52, DUGTRIO
	db 53, RHYDON
	db 53, STEELIX
	db -1 ; end
