UnusedPhoneScript:
	farwritetext UnusedPhoneText
	end

; Mom

MomPhoneScript:
	checkevent EVENT_TALKED_TO_MOM_AFTER_GETTING_POKEDEX
	iftrue .bcec5
	checkevent EVENT_DUDE_TALKED_TO_YOU
	iftrue MomPhoneLectureScript
	checkevent EVENT_GOT_A_POKEMON_FROM_OAK
	iftrue MomPhoneNoPokedexScript
	jump MomPhoneNoPokemonScript

.bcec5
	checkevent EVENT_TEMPORARY_UNTIL_MAP_RELOAD_8
	iftrue MomPhoneHangUpScript
	farwritetext MomPhoneGreetingText
	buttonsound
	mapnametotext MEM_BUFFER_0
	checkcode VAR_ROOFPALETTE
	ifequal 1, MomPhonePalette1
	ifequal 2, MomPhonePalette2
	jump MomPhoneOther

MomPhoneLandmark:
	farwritetext MomPhoneLandmarkText
	buttonsound
	jump MomSavingMoney

MomPhonePalette1:
	checkcode VAR_MAPGROUP
	ifequal GROUP_SILENT_TOWN, .newbark
	ifequal GROUP_CROWN_CITY, .cherrygrove
	ifequal GROUP_PAGOTA_CITY, .violet
	ifequal GROUP_BIRDON_TOWN, .azalea
	ifequal GROUP_WESTPORT_CITY, .goldenrod
	ifequal GROUP_SUNPOINT_CITY, .cianwood
	ifequal GROUP_KOBAN_ISLAND, .pallet
	ifequal GROUP_STAND_CITY, .fuchsia
;	ifequal GROUP_INDIGO_PLATEAU, .mtfuji ;why doesn't this work???? where are these map group variables defined???????asdfasdf
	farwritetext MomPhoneGenericAreaText
	buttonsound
	jump MomSavingMoney
	
.newbark
	farwritetext MomPhoneNewBarkText
	buttonsound
	jump MomSavingMoney
	
.mtfuji
	farwritetext MomPhoneIndigoText
	buttonsound
	jump MomSavingMoney

.cherrygrove
	farwritetext MomPhoneCherrygroveText
	buttonsound
	jump MomSavingMoney
	
.silenthills
	farwritetext MomPhoneSilentHillsText
	buttonsound
	jump MomSavingMoney

.violet
	landmarktotext BRASS_TOWER, MEM_BUFFER_1
	jump MomPhoneLandmark
.azalea
	landmarktotext SLOWPOKE_WELL, MEM_BUFFER_1
	jump MomPhoneLandmark
.goldenrod
	landmarktotext RADIO_TOWER, MEM_BUFFER_1
	jump MomPhoneLandmark
.cianwood
	landmarktotext MAGMA_SHAFT, MEM_BUFFER_1
	jump MomPhoneLandmark
.pallet
	landmarktotext DRAGONS_MAW, MEM_BUFFER_1
	jump MomPhoneLandmark
.fuchsia
	landmarktotext NATIONAL_PARK, MEM_BUFFER_1
	jump MomPhoneLandmark

MomPhonePalette2:
	farwritetext MomOtherAreaText
	buttonsound
	jump MomSavingMoney

MomPhoneOther:
	farwritetext MomDeterminedText
	buttonsound
	jump MomSavingMoney

MomSavingMoney:
	checkflag ENGINE_MOM_SAVING_MONEY
	iffalse .NotSaving
	checkmoney MOMS_MONEY, 0
	ifequal HAVE_MORE, .SavingHasMoney
	jump .SavingNoMoney

.NotSaving:
	checkmoney MOMS_MONEY, 0
	ifequal HAVE_MORE, .HasMoney
	jump .NoMoney

.SavingHasMoney:
	readmoney MOMS_MONEY, MEM_BUFFER_0
	farwritetext MomCheckBalanceText
	yesorno
	iftrue MomPhoneSaveMoneyScript
	jump MomPhoneWontSaveMoneyScript

.SavingNoMoney:
	farwritetext MomImportantToSaveText
	yesorno
	iftrue MomPhoneSaveMoneyScript
	jump MomPhoneWontSaveMoneyScript

.NoMoney:
	farwritetext MomYoureNotSavingText
	yesorno
	iftrue MomPhoneSaveMoneyScript
	jump MomPhoneWontSaveMoneyScript

.HasMoney:
	readmoney MOMS_MONEY, MEM_BUFFER_0
	farwritetext MomYouveSavedText
	yesorno
	iftrue MomPhoneSaveMoneyScript
	jump MomPhoneWontSaveMoneyScript

MomPhoneSaveMoneyScript:
	setflag ENGINE_MOM_SAVING_MONEY
	farwritetext MomOKIllSaveText
	buttonsound
	jump MomPhoneHangUpScript

MomPhoneWontSaveMoneyScript:
	clearflag ENGINE_MOM_SAVING_MONEY
	farwritetext MomPhoneWontSaveMoneyText
	buttonsound
	jump MomPhoneHangUpScript

MomPhoneHangUpScript:
	farwritetext MomPhoneHangUpText
	end

MomPhoneNoPokemonScript:
	farwritetext MomPhoneNoPokemonText
	end

MomPhoneNoPokedexScript:
	farwritetext MomPhoneNoPokedexText
	end

MomPhoneLectureScript:
	setevent EVENT_TALKED_TO_MOM_AFTER_GETTING_POKEDEX
	setflag ENGINE_MOM_ACTIVE
	specialphonecall SPECIALCALL_NONE
	farwritetext MomPhoneLectureText
	yesorno
	iftrue MomPhoneSaveMoneyScript
	jump MomPhoneWontSaveMoneyScript

; Bill

BillPhoneScript1:
	checktime DAY
	iftrue .daygreet
	checktime NITE
	iftrue .nitegreet
	farwritetext BillPhoneMornGreetingText
	buttonsound
	jump .main

.daygreet
	farwritetext BillPhoneDayGreetingText
	buttonsound
	jump .main

.nitegreet
	farwritetext BillPhoneNiteGreetingText
	buttonsound
	jump .main

.main
	farwritetext BillPhoneGenericText
	buttonsound
	checkcode VAR_BOXSPACE
	vartomem MEM_BUFFER_0
	ifequal 0, .full
	ifless PARTY_LENGTH, .nearlyfull
	farwritetext BillPhoneNotFullText
	end

.nearlyfull
	farwritetext BillPhoneNearlyFullText
	end

.full
	farwritetext BillPhoneFullText
	end

BillPhoneScript2:
	farwritetext BillPhoneNewlyFullText
	waitbutton
	end

; Oak

OakPhoneScript1:
	checkcode VAR_SPECIALPHONECALL
	ifequal SPECIALCALL_POKERUS, .pokerus
	checkevent EVENT_CLEARED_RADIO_TOWER
	iftrue .elmafterradiotower
	checkevent EVENT_RIVAL_BURNED_TOWER
	iftrue .discovery
	checkevent EVENT_GOT_ODD_EGG_FROM_ELMS_AIDE
	iffalse .next
	checkevent EVENT_TOGEPI_HATCHED
	iftrue .egghatched
.next
	checkevent EVENT_GOT_ODD_EGG_FROM_ELMS_AIDE
	iftrue .taking_on_league
	checkevent EVENT_ELMS_AIDE_IN_LAB
	iftrue .assistant
	checkevent EVENT_ELM_CALLED_ABOUT_STOLEN_POKEMON
	iftrue .stolen
	checkevent EVENT_GOT_MYSTERY_EGG_FROM_MR_POKEMON
	iftrue .sawmrpokemon
	farwritetext OakPhoneStartText
	end

.sawmrpokemon
	farwritetext OakPhoneSawMrPokemonText
	end

.stolen
	farwritetext OakPhonePokemonStolenText
	end

.assistant
	farwritetext OakPhoneAssistantText
	end

.taking_on_league
	farwritetext OakPhoneTakingOnLeagueText
	end

.egghatched
	farwritetext OakPhoneEggHatchedText
	setevent EVENT_TOLD_ELM_ABOUT_TOGEPI_OVER_THE_PHONE
	end

.discovery
	farwritetext OakPhoneRocketsText
	end

.nextdiscovery
	farwritetext OakPhoneDiscovery2Text
	end

.pokerus
	farwritetext OakPhonePokerusText
	specialphonecall SPECIALCALL_NONE
	end
	
.elmafterradiotower
	farwritetext OakAfterRadioTower
	end

OakPhoneScript2:
	checkcode VAR_SPECIALPHONECALL
	ifequal SPECIALCALL_ROBBED, .disaster
	ifequal SPECIALCALL_ASSISTANT, .assistant
	ifequal SPECIALCALL_WEIRDBROADCAST, .rocket
	ifequal SPECIALCALL_SSTICKET, .gift
	ifequal SPECIALCALL_MASTERBALL, .gift
	farwritetext OakPhonePokerusText
	specialphonecall SPECIALCALL_NONE
	end

.disaster
	farwritetext OakPhoneDisasterText
	specialphonecall SPECIALCALL_NONE
	setevent EVENT_ELM_CALLED_ABOUT_STOLEN_POKEMON
	end

.assistant
	farwritetext OakPhoneEggAssistantText
	specialphonecall SPECIALCALL_NONE
	clearevent EVENT_ELMS_AIDE_IN_VIOLET_POKEMON_CENTER
	setevent EVENT_ELMS_AIDE_IN_LAB
	end

.rocket
	farwritetext OakPhoneRocketText
	specialphonecall SPECIALCALL_NONE
	end

.gift
	farwritetext OakPhoneGiftText
	specialphonecall SPECIALCALL_NONE
	end

.unused
	farwritetext OakPhoneUnusedText
	specialphonecall SPECIALCALL_NONE
	end
