Oak2PhoneCalleeScript:
	readvar VAR_SPECIALPHONECALL
	ifequal SPECIALCALL_POKERUS, .pokerus
	checkevent EVENT_CLEARED_RADIO_TOWER
	iftrue .oak2afterradiotower
	checkevent EVENT_103_SLOWPOKE_SALESMAN
	iftrue .discovery
	checkevent EVENT_GOT_TOGEPI_EGG_FROM_OAKS_AIDE
	iffalse .next
	checkevent EVENT_TOGEPI_HATCHED
	iftrue .egghatched
.next
	checkevent EVENT_GOT_TOGEPI_EGG_FROM_OAKS_AIDE
	iftrue .eggunhatched
	checkevent EVENT_OAK2S_AIDE_IN_LAB
	iftrue .assistant
	checkevent EVENT_GAVE_MYSTERY_EGG_TO_OAK2
	iftrue .checkingegg
	checkevent EVENT_OAK2_CALLED_ABOUT_STOLEN_POKEMON
	iftrue .stolen
	checkevent EVENT_GOT_MYSTERY_EGG_FROM_MR_POKEMON
	iftrue .sawmrpokemon
	writetext Oak2PhoneHealYourMonText
	end

.sawmrpokemon
	writetext Oak2PhoneSawMrPokemonText
	end

.stolen
	writetext Oak2PhonePokemonStolenText
	end

.checkingegg
	writetext Oak2PhoneCheckingTheEggText
	end

.assistant
	writetext Oak2PhoneAssistantText
	end

.eggunhatched
	writetext Oak2PhoneHowIsTheEggText
	end

.egghatched
	writetext Oak2PhoneEggHatchedText
	setevent EVENT_TOLD_OAK2_ABOUT_TOGEPI_OVER_THE_PHONE
	end

.discovery
	random 2
	ifequal 0, .nextdiscovery
	writetext Oak2PhoneDiscoveredHatchTimeText
	end

.nextdiscovery
	writetext Oak2PhoneInvestigatingEggMovesText
	end

.pokerus
	writetext Oak2PhoneDiscoveredPokerusText
	specialphonecall SPECIALCALL_NONE
	end

.oak2afterradiotower
	writetext Oak2AfterRadioTower
	end

Oak2PhoneCallerScript:
	readvar VAR_SPECIALPHONECALL
	ifequal SPECIALCALL_ROBBED, .disaster
	ifequal SPECIALCALL_ASSISTANT, .assistant
	ifequal SPECIALCALL_WEIRDBROADCAST, .rocket
	ifequal SPECIALCALL_SSTICKET, .gift
	ifequal SPECIALCALL_MASTERBALL, .gift
	writetext Oak2PhoneDiscoveredPokerusText
	specialphonecall SPECIALCALL_NONE
	end

.disaster
	writetext Oak2PhoneDisasterText
	specialphonecall SPECIALCALL_NONE
	setevent EVENT_OAK2_CALLED_ABOUT_STOLEN_POKEMON
	end

.assistant
	writetext Oak2PhoneEggAssistantText
	specialphonecall SPECIALCALL_NONE
	clearevent EVENT_OAK2S_AIDE_IN_PAGOTA_POKEMON_CENTER
	setevent EVENT_OAK2S_AIDE_IN_LAB
	end

.rocket
	writetext Oak2PhoneRadioTowerRocketTakeoverText
	specialphonecall SPECIALCALL_NONE
	end

.gift
	writetext Oak2PhoneGiftText
	specialphonecall SPECIALCALL_NONE
	end

.unused
	writetext Oak2PhoneGotAholdOfSomethingNeatText
	specialphonecall SPECIALCALL_NONE
	end
