; Maps that roaming monsters can be on, and possible maps they can jump to.
; Notably missing are Route 110 and Route 111, which are water routes.

roam_map: MACRO
	map_id \1
	db _NARG - 1
rept _NARG - 1
	map_id \2
	shift
endr
	db 0
ENDM

RoamMaps:
; there are NUM_ROAMMON_MAPS entries
	; start map, ...other maps
	roam_map ROUTE_101, ROUTE_105, GREAT_EAST_STRAIT
	roam_map ROUTE_105, ROUTE_101, ROUTE_106
	roam_map ROUTE_106, ROUTE_105, ROUTE_112, ROUTE_102
	roam_map ROUTE_112, ROUTE_102, ROUTE_106, ROUTE_104
	roam_map ROUTE_104, ROUTE_112, ROUTE_113
	roam_map ROUTE_113, ROUTE_104, ROUTE_103
	roam_map ROUTE_103, ROUTE_113, ROUTE_102
	roam_map ROUTE_102, ROUTE_103, ROUTE_106, ROUTE_112, SILENT_HILLS
	roam_map SILENT_HILLS, ROUTE_102, ROUTE_108, ROUTE_U4U
	roam_map ROUTE_108, SILENT_HILLS, ROUTE_109, ROUTE_U4U
	roam_map ROUTE_109, ROUTE_108
	roam_map ROUTE_U4U, BOARDWALK, KIKAI_STRAIT, SILENT_HILLS, ROUTE_108
	roam_map BOARDWALK, ROUTE_U4U, KIKAI_STRAIT
	roam_map KIKAI_STRAIT, ROUTE_U4U, BOARDWALK, TATSUGO_PATH
	roam_map TATSUGO_PATH, KIKAI_STRAIT, GREAT_EAST_STRAIT
	roam_map GREAT_EAST_STRAIT, TATSUGO_PATH, ROUTE_101
	db -1 ; end
