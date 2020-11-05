; Johto Pokémon in water
;60
;30
;10

JohtoWaterWildMons:

	map_id PAGOTA_CITY
	db 2 percent ; encounter rate
	db 18, POLIWAG
	db 15, POLIWAG
	db 18, POLIWHIRL
	
	map_id WESTPORT_CITY
	db 2 percent ; encounter rate
	db 18, TENTACOOL
	db 15, STARYU
	db 18, TENTACRUEL

	map_id ROUTE_116
	db 6 percent ; encounter rate
	db 18, TENTACOOL
	db 15, STARYU
	db 18, TENTACRUEL
	
	map_id ROUTE_117
	db 6 percent ; encounter rate
	db 18, TENTACOOL
	db 15, STARYU
	db 18, TENTACRUEL
	
	map_id RUINS_OF_ALPH_OUTSIDE
	db 6 percent ; encounter rate
	db 20, TENTACOOL
	db 18, CORASUN
	db 20, TENTACRUEL
	
	map_id SUNPOINT_CITY
	db 6 percent ; encounter rate
	db 22, TENTACOOL
	db 20, CORASUN
	db 24, TENTACRUEL
	
	map_id SANSKRIT_TOWN
	db 6 percent ; encounter rate
	db 20, TENTACOOL
	db 25, CORASUN
	db 25, TENTACRUEL
	
	map_id ROUTE_118
	db 6 percent ; encounter rate
	db 20, TENTACOOL
	db 25, CORASUN
	db 25, TENTACRUEL
	
	map_id ROUTE_119
	db 6 percent ; encounter rate
	db 20, TENTACOOL
	db 18, CORASUN
	db 20, TENTACRUEL
	
	map_id ROUTE_120
	db 6 percent ; encounter rate
	db 15, GOLDEEN
	db 18, POLIWAG
	db 18, MARILL
	
	map_id BOARDWALK
	db 6 percent ; encounter rate
	db 18, TENTACOOL
	db 15, STARYU
	db 18, TENTACRUEL
	
	map_id SLOWPOKE_WELL_B1F
	db 2 percent ; encounter rate
	db 15, SLOWPOKE
	db 18, SLOWPOKE
	db 10, SLOWPOKE

	map_id SLOWPOKE_WELL_B2F
	db 2 percent ; encounter rate
	db 15, SLOWPOKE
	db 18, SLOWPOKE
	db 18, SLOWBRO
	
	map_id BOULDER_MINES_1F
	db 4 percent ; encounter rate
	db 15, GOLDEEN
	db 18, POLIWAG
	db 18, MARILL

	map_id BOULDER_MINES_B1F
	db 4 percent ; encounter rate
	db 15, GOLDEEN
	db 18, POLIWAG
	db 18, MARILL

	map_id BOULDER_MINES_B2F
	db 4 percent ; encounter rate
	db 15, GOLDEEN
	db 18, POLIWAG
	db 18, MARILL
	
	map_id BOULDER_MINES_B3F
	db 4 percent ; encounter rate
	db 15, GOLDEEN
	db 18, POLIWAG
	db 18, MARILL
	
	map_id BOULDER_MINES_B4F
	db 4 percent ; encounter rate
	db 15, GOLDEEN
	db 18, POLIWAG
	db 18, MARILL
	
	map_id BOULDER_MINES_B5F
	db 4 percent ; encounter rate
	db 15, GOLDEEN
	db 18, POLIWAG
	db 18, MARILL

	map_id ENDON_CAVE_1F
	db 4 percent ; encounter rate
	db 15, GOLDEEN
	db 18, SEAKING
	db 18, QUAGSIRE
	
	map_id ENDON_CAVE_B1F
	db 4 percent ; encounter rate
	db 15, GOLDEEN
	db 18, SEAKING
	db 18, QUAGSIRE
	
	map_id SUNPOINT_DOCKS
	db 4 percent ; encounter rate
	db 18, TENTACOOL
	db 15, CORASUN
	db 18, TENTACRUEL
	
	map_id JADE_FOREST
	db 4 percent ; encounter rate
	db 25, PSYDUCK
	db 25, POLIWAG
	db 20, GOLDUCK
	
	map_id ALLOY_CITY
	db 4 percent ; encounter rate
	IF DEF(_GOLD)
	db 18, TENTACOOL
	db 15, MANTINE
	db 18, TENTACRUEL
	
	ELIF DEF(_SILVER)
	db 18, TENTACOOL
	db 18, TENTACRUEL
	db 15, MANTINE
	ENDC
	
	map_id ROUTE_109
	db 4 percent ; encounter rate
	db 25, POLIWAG
	db 28, GOLDEEN
	db 25, POLIWHIRL
	
	map_id AMPARE_CAVERN_B1F
	db 4 percent ; encounter rate
	db 25, POLIWAG
	db 28, GOLDEEN
	db 25, MARILL
	
	map_id ROUTE_110
	db 4 percent ; encounter rate
	db 25, TENTACOOL
	db 27, SEEL
	db 25, SHELLDER
	
	map_id ROUTE_111
	db 4 percent ; encounter rate
	IF DEF(_GOLD)
	db 28, SHELLDER
	db 28, MANTINE
	db 28, STARYU
	
	ELIF DEF(_SILVER)
	db 28, SHELLDER
	db 28, STARYU
	db 28, MANTINE
	ENDC
	
	map_id ROUTE_107
	db 4 percent ; encounter rate
	IF DEF(_GOLD)
	db 25, TENTACOOL
	db 25, MANTINE
	db 28, TENTACRUEL
	
	ELIF DEF(_SILVER)
	db 25, TENTACOOL
	db 28, TENTACRUEL
	db 25, MANTINE
	ENDC

	map_id DEEPWATER_PASSAGE_B2F
	db 4 percent ; encounter rate
	db 18, SLOWPOKE
	db 15, SLOWPOKE
	db 18, SEEL

	map_id DRAGONS_MAW
	db 4 percent ; encounter rate
	db 28, SEEL
	db 28, DEWGONG
	db 25, DRATINI
	
	map_id FROSTPOINT_TOWN
	db 4 percent ; encounter rate
	db 28, SHELLDER
	db 28, SEEL
	db 28, STARYU
	
	map_id ROUTE_112
	db 4 percent ; encounter rate
	db 30, POLIWAG
	db 30, MARILL
	db 32, POLIWHIRL
	
	map_id NATIONAL_PARK
	db 4 percent ; encounter rate
	db 22, POLIWAG
	db 20, PSYDUCK
	db 25, POLIWHIRL
	
	map_id WHIRL_ISLAND_B1F
	db 4 percent ; encounter rate
	db 30, TENTACOOL
	db 28, SEEL
	db 30, HORSEA
	
	map_id WHIRL_ISLAND_B2F
	db 4 percent ; encounter rate
	db 30, TENTACOOL
	db 28, SEEL
	db 30, HORSEA
	
	map_id ROUTE_113
	db 6 percent ; encounter rate
	db 28, GOLDEEN
	db 30, PSYDUCK
	db 28, SEAKING
	
	map_id KANTO_REGION
	db 4 percent ; encounter rate
	db 30, TENTACOOL
	db 30, GOLDEEN
	db 32, TENTACRUEL
	
	map_id SAFARI_ZONE_BETA
	db 4 percent
	db 20, PSYDUCK
	db 24, PSYDUCK
	db 30, GOLDEEN
	
	map_id SEAFOAM_ISLANDS_B1F
	db 6 percent
	db 35, HORSEA
	db 38, SEADRA
	db 40, DEWGONG
	
	map_id KANTO_DOCK
	db 6 percent
	db 30, TENTACOOL
	db 35, TENTACOOL
	db 40, TENTACRUEL
	
	map_id ROUTE_115
	db 6 percent ; encounter rate
	db 20, TENTACOOL
	db 15, TENTACOOL
	db 20, TENTACRUEL
	
	map_id VICTORY_ROAD
	db 4 percent ; encounter rate
	db 38, SEAKING
	db 38, GOLDUCK
	db 35, DRATINI
	
	map_id VICTORY_ROAD_2F
	db 4 percent ; encounter rate
	db 38, SEAKING
	db 38, GOLDUCK
	db 35, DRATINI
	
	map_id TIDAL_GROTTO_1F
	db 4 percent ; encounter rate
	db 38, GOLDUCK
	db 38, ANCHORAGE
	db 35, DRATINI
	
	map_id TIDAL_GROTTO_B1F
	db 4 percent ; encounter rate
	db 38, GOLDUCK
	db 38, ANCHORAGE
	db 35, DRAGONAIR

	db -1 ; end
