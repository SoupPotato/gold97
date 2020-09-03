CreditsScript:

; Clear the banner.
	db CREDITS_CLEAR

; Pokemon Crystal Version Staff
	db                STAFF, 1

	db CREDITS_WAIT, 8

; Play the credits music.
	db CREDITS_MUSIC

	db CREDITS_WAIT2, 10

	db CREDITS_WAIT, 1

; Update the banner.
	db CREDITS_SCENE, 0 ; Pichu

	db             DIRECTOR, 1
	db       SATOSHI_TAJIRI, 2
	db		          LVL_3, 3

	db CREDITS_WAIT, 12

	db          CODIRECTORS, 1
	db       JUNICHI_MASUDA, 2
	db	         SOUR_APPLE, 3
	db			       ROOL, 4
	

	db CREDITS_WAIT, 12

	db          PROGRAMMERS, 0
	db       SOUSUKE_TAMADA, 1
	db       HISASHI_SOGABE, 2
	db         KEITA_KAGAYA, 3
	db    YOSHINORI_MATSUDA, 4

	db CREDITS_WAIT, 12

	db          PROGRAMMERS, 0
	db     SHIGEKI_MORIMOTO, 1
	db     TETSUYA_WATANABE, 2
	db        TAKENORI_OOTA, 3
	db                PFERO, 4
	db           SOUR_APPLE, 5

	db CREDITS_WAIT, 12

	db    GRAPHICS_DIRECTOR, 1
	db         KEN_SUGIMORI, 2
	db                 ROOL, 3
	db           SOUR_APPLE, 4

	db CREDITS_WAIT, 12

	db       MONSTER_DESIGN, 0
	db         KEN_SUGIMORI, 1
	db    MOTOFUMI_FUJIWARA, 2
	db     SHIGEKI_MORIMOTO, 3
	db     HIRONOBU_YOSHIDA, 4
	db         SATOSHI_OOTA, 5

	db CREDITS_WAIT, 12

	db       MONSTER_DESIGN, 0
	db       ATSUKO_NISHIDA, 1
	db          MUNEO_SAITO, 2
	db       RENA_YOSHIKAWA, 3
	
	db CREDITS_WAIT, 12

	db       MONSTER_DESIGN, 0
	db      	       ROOL, 1
	db               SMALLS, 2
	db           SOUR_APPLE, 3
	db                  PIK, 4
	db          ACTUALLY_TC, 4
	
	db CREDITS_WAIT, 12	
	
; Clear the banner.
	db CREDITS_CLEAR

	db CREDITS_WAIT, 1

; Update the banner.
	db CREDITS_SCENE, 1 ; Smoochum


	db      GRAPHICS_DESIGN, 0
	db     HIRONOBU_YOSHIDA, 1
	db          JUN_OKUTANI, 2
	db       ASUKA_IWASHITA, 3
	db     TETSUYA_WATANABE, 4

	db CREDITS_WAIT, 12

	db         CREDIT_MUSIC, 0
	db       JUNICHI_MASUDA, 1
	db        MORIKAZU_AOKI, 2
	db          GO_ICHINOSE, 3
	db                CORAL, 4

	db CREDITS_WAIT, 12

	db CREDIT_SOUND_EFFECTS, 0
	db        MORIKAZU_AOKI, 1
	db       JUNICHI_MASUDA, 2
	db     TETSUYA_WATANABE, 3

	db CREDITS_WAIT, 12

	db          GAME_DESIGN, 0
	db       JUNICHI_MASUDA, 1
	db     SHIGEKI_MORIMOTO, 2
	db        KOHJI_NISHINO, 3
	db                LVL_3, 4

	db CREDITS_WAIT, 12

	db          GAME_DESIGN, 0
	db         TETSUJI_OOTA, 1
	db          HITOMI_SATO, 2
	db     KENJI_MATSUSHIMA, 3
	db           SOUR_APPLE, 4

	db CREDITS_WAIT, 12

	db        GAME_SCENARIO, 0
	db       JUNICHI_MASUDA, 1
	db        KOHJI_NISHINO, 2
	db  TOSHINOBU_MATSUMIYA, 3
	db     KENJI_MATSUSHIMA, 4

	db CREDITS_WAIT, 12

	db         POKEDEX_TEXT, 1
	db  TOSHINOBU_MATSUMIYA, 2
	db                LVL_3, 3
	db                  CAM, 4

	db CREDITS_WAIT, 12

; Clear the banner.
	db CREDITS_CLEAR

	db CREDITS_WAIT, 1

; Update the banner.
	db CREDITS_SCENE, 2 ; Ditto

	db        SCRIPT_DESIGN, 0
	db         TETSUJI_OOTA, 1
	db        NOBUHIRO_SEYA, 2
	db                LVL_3, 3
	db           SOUR_APPLE, 4
	db                  CAM, 5

	db CREDITS_WAIT, 12

	db      MAP_DATA_DESIGN, 0
	db         TETSUJI_OOTA, 1
	db      KAZUHITO_SEKINE, 2
	db                LVL_3, 3
	db           SOUR_APPLE, 4

	db CREDITS_WAIT, 12

	db           MAP_DESIGN, 0
	db         TETSUJI_OOTA, 1
	db        KOHJI_NISHINO, 2
	db        NOBUHIRO_SEYA, 3
	db           KOOLBOYMAN, 4
	db                  CAM, 5

	db CREDITS_WAIT, 12

	db         COORDINATION, 0
	db      HIROYUKI_ZINNAI, 1
	db                 ROOL, 2
	db                  CAM, 3

	db CREDITS_WAIT, 12

	db            PRODUCERS, 0
	db         SATORU_IWATA, 1
	db       SATOSHI_YAMATO, 2
	db     SHIGERU_MIYAMOTO, 3
	db   TSUNEKAZU_ISHIHARA, 4
	db                 ROOL, 5

	db CREDITS_WAIT, 12

	db          BUG_TESTERS, 0
	db       DEPRESSED_GABE, 1
	db                GMERC, 2
	db                 AHAB, 3
	db         LE_RUSE_BIRD, 4
	db         CYBERSHELL11, 5

	db CREDITS_WAIT, 12
	
	db          BUG_TESTERS, 0
	db       PASSION_WORKER, 1
	db                  NEP, 2
	db                LUCKY, 3
	db             COCONUTZ, 4
	db              RACIE_B, 5
	
	db CREDITS_WAIT, 12
	
	db          BUG_TESTERS, 0
	db                 ADEM, 1
	db             JUSTIN_N, 2
	db                 CCCP, 3
	db               MCDON7, 4
	db    SPAGHETTI_CULTIST, 5
	
	db CREDITS_WAIT, 12
	
	

; Clear the banner.
	db CREDITS_CLEAR

	db CREDITS_WAIT, 1

; Update the banner.
	db CREDITS_SCENE, 3 ; Igglybuff

	db     US_VERSION_STAFF, 2

	db CREDITS_WAIT, 9

	db      US_COORDINATION, 1
	db          GAIL_TILDEN, 2
	db        HIRO_NAKAMURA, 3

	db CREDITS_WAIT, 12

	db      US_COORDINATION, 1
	db       JUNICHI_MASUDA, 2
	db        SETH_MCMAHILL, 3

	db CREDITS_WAIT, 12

	db      US_COORDINATION, 1
	db     HIROTO_ALEXANDER, 2
	db     TERESA_LILLYGREN, 3

	db CREDITS_WAIT, 12

	db     TEXT_TRANSLATION, 1
	db        NOB_OGASAWARA, 2

	db CREDITS_WAIT, 12

	db          PROGRAMMERS, 1
	db      TERUKI_MURAKAWA, 2
	db      KAZUYOSHI_OSAWA, 3

	db CREDITS_WAIT, 12

	db         PAAD_TESTING, 1
	db       THOMAS_HERTZOG, 2
	db         ERIK_JOHNSON, 3

	db CREDITS_WAIT, 12

	db      PRODUCT_TESTING, 0
	db             PLANNING, 1

	db CREDITS_WAIT, 12

	db      PRODUCT_TESTING, 0
	db       KEITA_NAKAMURA, 1
	db      HIROTAKA_UEMURA, 2
	db       HIROAKI_TAMURA, 3
	db    NORIAKI_SAKAGUCHI, 4

	db CREDITS_WAIT, 12

	db      PRODUCT_TESTING, 0
	db NCL_SUPER_MARIO_CLUB, 1
	db          KENJI_SAIKI, 2
	db         ATSUSHI_TADA, 3
	db          MIYUKI_SATO, 4

	db CREDITS_WAIT, 12

	db       SPECIAL_THANKS, 0
	db     KIMIKO_NAKAMICHI, 1
	db           AKITO_MORI, 2

	db CREDITS_WAIT, 12

	db       SPECIAL_THANKS, 0
	db        GAKUZI_NOMOTO, 1
	db           AI_MASHIMA, 2
	db      KUNIMI_KAWAMURA, 3

	db CREDITS_WAIT, 12

	db       SPECIAL_THANKS, 0
	db    MIKIHIRO_ISHIKAWA, 1
	db   HIDEYUKI_HASHIMOTO, 2
	db                LVL_3, 3

	db CREDITS_WAIT, 12

	db   EXECUTIVE_PRODUCER, 1
	db     HIROSHI_YAMAUCHI, 2

	db CREDITS_WAIT, 12

	db            COPYRIGHT, 1

	db CREDITS_WAIT, 9

; Display "The End" graphic.
	db CREDITS_THEEND

	db CREDITS_WAIT, 20

	db CREDITS_END
