RouteU5U_MapScripts:
	db 0 ; scene scripts

	db 0 ; callbacks

RouteU5USign:
	jumptext RouteU5USignText

RouteU5UHiddenRareCandy:
	hiddenitem RARE_CANDY, EVENT_ROUTE_U5U_HIDDEN_RARE_CANDY

RouteU5USignText:
	text "ROUTE 28"
	done

RouteU5U_MapEvents:
	db 0, 0 ; filler

	db 2 ; warp events
	warp_event -3,  3, DAITO_RANCH_ORCHARD_HOUSE, 1
	warp_event 23,  5, CROWN_PATH_GATE, 7

	db 0 ; coord events

	db 2 ; bg events
	bg_event 21,  5, BGEVENT_READ, RouteU5USign
	bg_event 15,  2, BGEVENT_ITEM, RouteU5UHiddenRareCandy

	db 0 ; object events
