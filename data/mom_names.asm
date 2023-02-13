MomNameMenuHeader:
	db STATICMENU_NO_TOP_SPACING ; flags
	menu_coords 0, 0, 10, TEXTBOX_Y - 1
	dw .Names
	db 1

.Names:
	db STATICMENU_CURSOR | STATICMENU_PLACE_TITLE | STATICMENU_DISABLE_B ; flags
	db 5 ; items
	db "NEW NAME@"
MomNameArray:
	db "MOM@"
	db "MAMA@"
	db "MOMMY@"
	db "MOTHER@"
	db 2
	db "NAME@" ; title
