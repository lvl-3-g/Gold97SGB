landmark: MACRO
; x, y, name
	db \1 + 8, \2 + 16
	dw \3
ENDM

Landmarks:
; entries correspond to constants/landmark_constants.asm
	dbbw       0,   0, SpecialMapName
	landmark  92, 116, SilentTownName
	landmark  84, 116, Route101Name
	landmark  76, 116, SilentHillsName
	landmark  76, 100, PagotaCityName
	landmark  75,  99, FiveFloorTowerName
	landmark  68, 100, Route102Name
	landmark  60, 100, WestportCityName
	landmark  59,  99, RadioTowerName
	landmark  60,  84, Route103Name
	landmark  60,  68, BirdonTownName
	landmark  59,  67, SlowpokeWellName
	landmark  60,  60, Route116Name
	landmark  56,  60, Route117Name
	landmark  52,  60, EndonCaveName
	landmark  44,  60, SanskritTownName
	landmark  44,  52, SanskritRuinsName
	landmark  32,  60, Route118Name
	landmark  20,  60, SunpointCityName
	landmark  19,  59, MagmaShaftName
	landmark  20,  52, SunpointDocksName
	landmark  20,  76, Route119Name
	landmark  28,  92, BoulderMineName
	landmark  36,  92, Route120Name
	landmark  44,  92, TeknosCityName
	landmark  44,  76, BoardwalkName
	landmark  76,  68, Route104Name
	landmark  92,  68, Route105Name
	landmark  92,  76, JadeForestName
	landmark 100,  76, Route106Name
	landmark 108,  76, AlloyCityName
	landmark 108,  64, Route107Name
	landmark 108,  52, KobanIslandName
	landmark 107,  51, DragonsDenName
	landmark 116,  76, Route108Name
	landmark 124,  68, Route109Name
	landmark 124,  60, AmpareCavernName
	landmark 128,  52, Route110Name
	landmark 140,  52, BlueForestName
	landmark 139,  51, IcePathName
	landmark 140,  40, Route111Name
	landmark 139,  39, WhirlIslandsName
	landmark 140,  28, FrostpointTownName
	landmark 140,  68, Route112Name
	landmark 140,  84, StandCityName
	landmark 132,  84, NationalParkName
	landmark 140, 100, Route113Name
	landmark 132, 116, Route114Name
	landmark 124, 116, KantoRegionName
	landmark 108, 116, Route115Name
	landmark  92, 108, VictoryRoadName
	landmark  92, 100, CrownCityName
	landmark  92,  92, MountFujiName
	landmark 123, 115, BattleTowerName
	landmark 108, 108, MtMortarName
	landmark  92, 112, Route121Name
	landmark  80, 116, RouteU8UName
	landmark  36,  68, RouteU7UName
	landmark  28,  44, FujiSummitName
	landmark  28,  92, RouteU6UName
	landmark  20,  68, RouteU5UName
	landmark  92,  44, RouteU4UName
	landmark 120,  44, UnusedRoute1Name
	landmark 132,  64, UnusedPathName
	landmark  52,  92, TropicalIslandJungleName
	landmark 132,  68, LavenderTownName
	landmark  20, 124, RainbowIslandName
	landmark  52, 124, TropicalIslandName
	landmark  36, 124, ForkedStraitName
	landmark  36, 100, KumeCityName
	landmark  36,  92, IcedCavernName
	landmark  44, 100, KumePointName
	landmark  60, 100, KeramaStraitName
	landmark 132, 100, DaitoRanchName
	landmark 112, 100, GreatEastStraitName
	landmark  84, 100, NanjoForestName
	landmark  76,  96, UrasoeTrailName
	landmark  76,  84, UrasoeParkName
	landmark  76,  76, RyukyuCityName
	landmark  92,  68, CharredSummitName
	landmark  84,  68, MeridianPathName
	landmark  36,  44, HydroPlantName
	landmark  40,  52, WeatheredTrailName
	landmark  52,  52, IejimaTown
	landmark  68,  52, MotobuPathName
	landmark  84,  52, NagoVillageName
	landmark  96,  52, IsenStraitName
	landmark 112,  52, SeasidePathName
	landmark 124,  52, JouleCaveName
	landmark 140,  28, KikaiCalderaName
	landmark 140,  36, KikaiVillageName
	landmark 140,  44, KikaiStraitName
	landmark 128,  44, TatsugoPathName
	landmark 116,  44, AmamiTownName
	landmark  36, 124, FastShipName

SilentTownName:     db "SILENT TOWN@"
CrownCityName: db "CROWN CITY@"
PagotaCityName:      db "PAGOTA CITY@"
BirdonTownName:      db "BIRDON TOWN@"
WestportCityName:   db "WESTPORT¯CITY@"
TeknosCityName:    db "TEKNOS CITY@"
AlloyCityName:     db "ALLOY CITY@"
SunpointCityName:    db "SUNPOINT¯CITY@"
SanskritTownName:    db "SANSKRIT¯TOWN@"
BlueForestName:  db "BLUE FOREST@"
KikaiVillageName:      db "KIKAI¯VILLAGE@"
DaitoRanchName:      db "DAITO RANCH@"
FiveFloorTowerName:     db "5 FLOOR¯TOWER@"
SanskritRuinsName:     db "SANSKRIT¯RUINS@"
BoulderMineName:       db "BOULDER¯MINE@"
SlowpokeWellName:    db "SLOWPOKE¯WELL@"
RadioTowerName:      db "RADIO TOWER@"
HydroPlantName:      db "HYDRO PLANT@"
NationalParkName:    db "NATIONAL¯PARK@"
TropicalIslandName:        db "TROPICAL¯ISLAND@"
EndonCaveName:      db "ENDON CAVE@"
WhirlIslandsName:    db "WHIRL¯ISLAND@"
MtMortarName:        db "NOT USED@"
DragonsDenName:      db "DRAGON'S¯MAW@"
IcePathName:         db "DEEPWATER¯PASSAGE@"
NotApplicableName:   db "N/A@" ; "オバケやしき" ("HAUNTED HOUSE") in Japanese
KobanIslandName:      db "KOBAN¯ISLAND@"
IejimaTown:    db "IEJIMA¯TOWN@"
KumeCityName:      db "KUME CITY@"
NagoVillageName:    db "NAGO¯VILLAGE@"
LavenderTownName:    db "LAVENDER¯TOWN@"
AmamiTownName:   db "AMAMI TOWN@"
KantoRegionName:     db "KANTO¯REGION@"
RyukyuCityName:     db "RYUKYU CITY@"
StandCityName:     db "STAND CITY@"
FrostpointTownName:  db "FROSTPOINT¯TOWN@"
MountFujiName:   db "MT.FUJI@"
VictoryRoadName:     db "CROWN PATH@"
UrasoeParkName:          db "URASOE PARK@"
CharredSummitName:      db "CHARRED¯SUMMIT@"
ForkedStraitName:   db "FORKED¯STRAIT@"
SilphCoName:         db "SILPH CO.@"
SafariZoneName:      db "SAFARI ZONE@"
NanjoForestName:  db "NANJO¯FOREST@"
PokemonMansionName:  db "#MON¯MANSION@"
NagoCaveName:    db "NAGO¯CAVE@"
TropicalIslandJungleName:          db "ROUTE 1@"
Route116Name:          db "ROUTE 116@"
Route117Name:          db "ROUTE 117@"
Route118Name:          db "ROUTE 118@"
SunpointDocksName:          db "SUNPOINT¯DOCKS@"
Route119Name:          db "ROUTE 119@"
Route120Name:          db "ROUTE 120@"
Route114Name:          db "ROUTE 114@"
SeasidePathName:         db "SEASIDE¯PATH@"
MotobuPathName:         db "MOTOBU¯PATH@"
UrasoeTrailName:         db "URASOE¯TRAIL@"
TatsugoPathName:         db "TATSUGO¯PATH@"
Route121Name:         db "ROUTE 121@"
KikaiStraitName:         db "KIKAI¯STRAIT@"
KikaiCalderaName:         db "KIKAI¯CALDERA@"
WeatheredTrailName:         db "WEATHERED¯TRAIL@"
RouteU8UName:         db "ROUTE 18@"
KeramaStraitName:         db "KERAMA¯STRAIT@"
IsenStraitName:         db "ISEN STRAIT@"
Route107Name:         db "ROUTE 107@"
RouteU7UName:         db "ROUTE 22@"
FujiSummitName:         db "ROUTE 23@"
KumePointName:         db "KUME POINT@"
MeridianPathName:         db "MERIDIAN¯PATH@"
RouteU6UName:         db "ROUTE 26@"
Route115Name:         db "ROUTE 115@"
RouteU5UName:         db "ROUTE 28@"
Route101Name:         db "ROUTE 101@"
Route105Name:         db "ROUTE 105@"
Route106Name:         db "ROUTE 106@"
Route112Name:         db "ROUTE 112@"
Route104Name:         db "ROUTE 104@"
Route113Name:         db "ROUTE 113@"
Route103Name:         db "ROUTE 103@"
Route102Name:         db "ROUTE 102@"
SilentHillsName:         db "SILENT¯HILLS@"
Route108Name:         db "ROUTE 108@"
Route109Name:         db "ROUTE 109@"
Route110Name:         db "ROUTE 110@"
Route111Name:         db "ROUTE 111@"
RouteU4UName:         db "ROUTE 42@"
BoardwalkName:         db "BOARDWALK@"
UnusedRoute1Name:         db "ROUTE 44@"
UnusedPathName:         db "ROUTE 45@"
GreatEastStraitName:         db "GREAT EAST¯STRAIT@"
AmpareCavernName:        db "AMPARE¯CAVERN@"
JadeForestName:      db "JADE FOREST@"
MagmaShaftName:     db "MAGMA SHAFT@"
FastShipName:        db "FAST SHIP@"
ViridianForestName:  db "VIRIDIAN¯FOREST@"
IcedCavernName:    db "ICED¯CAVERN@"
RainbowIslandName:      db "RAINBOW¯ISLAND@"
JouleCaveName:     db "JOULE CAVE@"
BattleTowerName:     db "BATTLE¯TOWER@"
SpecialMapName:      db "SPECIAL@"
