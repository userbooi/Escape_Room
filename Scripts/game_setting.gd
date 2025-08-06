extends Resource

class_name GameSettings

enum STATES {START, LEVEL_SELECT, PLAYING, DIALOGUE, FINISHED}

#============================    DEFAULT SETTINGS    ===========================#
#@export var level = 1
#@export var curr_level = 1
#@export var curr_state = STATES.START
#@export var special_events = ["ReTa1", "Seat2", "Clos1", "SpPl1"]
#@export var event_num = 0
#@export var found = false
#@export var curr_room = "Bedroom"
#@export var level_ready = [true, true, true]
#var DEBUG = false

#===========================    TEST SETTINGS    ========================#
@export var level = 3
@export var curr_level = 3
@export var curr_state = STATES.PLAYING
@export var special_events = [
	["ReTa1", "Seat2", "Clos1", "SpPl1"],
	["DoBe1", "TeVi2", "RoTa4", "Clos1", "Plan2", "WeCh1", "Seat2"],
	[]
]
@export var event_num = 0
@export var found = false
@export var curr_room = "Bedroom"
@export var level_ready = [true, true, true]
var DEBUG = true

# spawn location format: [spawn location]
var levels_spawn_locations = [
	Vector2(858, 353),
	Vector2(858, 353),
	Vector2(837, 201),
]

# Level Layout Format: {name: [position, rotation, [special lines]]}
var levels_layout = [
	{
		"DoBe1":[Vector2(315, -55), 0, []],
		"Plan1":[Vector2(1663, 2), 0, []],
		"Plan2":[Vector2(30, 4), 0, []],
		"Plan3":[Vector2(32, 1011), 0, []],
		"SpPl1":[Vector2(1670, 1021), 0, ["Inside the plant with a different green than the others", "You find a key out of this place"]],
		"Clos1":[Vector2(856, -14), 0, ["You pull open a hidden compartment at the back of the closet.", "You find a paper colored with an odd green color"]],
		"TeVi1":[Vector2(652, 1218), PI, []],
		"Seat1":[Vector2(1061, 751), 3*PI/2, []],
		"Seat2":[Vector2(1283, 462), 0, ["Inside a hole where a nail used to be, you hear a voice[br]it whispers:", "[i]A hidden panel where garments live[/i]"]],
		"Seat3":[Vector2(1414, 895), PI, []],
		"Seat4":[Vector2(1644, 622), PI/2, []],
		"ReTa1":[Vector2(1099, 562), 0, ["Among the gum stuck on the underside of the table, you found a [b]note[/b] stuck to it[br]It reads:", "[i]The seat pointing at noon[/i]"]]
	},
	{
		"Door1":[Vector2(1389, 514), PI/2, []],
		"Door2":[Vector2(641, 751), 0, []],
		"DoBe1":[Vector2(203, -51), 0, ["Seeing this bed, you remember a dream, a fleeting memory...[br]You remember...", "[i]There is something special about a cramped space[/i]"]],
		"Plan1":[Vector2(153, 623), 0, []],
		"Plan2":[Vector2(1038, 1404), 0, ["Deep within this soil, you find a key.", "But not for the exit...[br]Perhaps for something that looks off"]],
		"Plan3":[Vector2(23, 1401), 0, []],
		"WeCh1":[Vector2(1094, 30), 0, ["The key worked on this chair...[br]Somehow", "You find a note[br]It reads...", "[i]Rest near the electronic display, but not too close[/i]"]],
		"TeVi1":[Vector2(722, 1620), PI, []],
		"TeVi2":[Vector2(2136, 692), PI/2, ["Endless Buffer...[br]But something is different this time", "A message is felt through the buzz...", "[i]An item in this room[/i]"]],
		"Clos1":[Vector2(1211, 911), PI, ["The hidden panel reveals a note...[br]This seem familiar", "The note encrypts a message, you must read carefully", "[i][b]B[/b]ounce around and W[b]rite[/b] your story[/i]"]],
		"Clos2":[Vector2(1249, 339), 0, []],
		"Clos5":[Vector2(1543, 350), 0, []],
		"Clos3":[Vector2(1472, 314), PI/6, []],
		"Clos4":[Vector2(1748, 673), PI*4/3, []],
		"Clos6":[Vector2(1896, 314), PI/6, []],
		"Clos7":[Vector2(2227, 502), PI*3/4, []],
		"Clos8":[Vector2(2001, 773), PI*4/3, []],
		"Sofa1":[Vector2(510, 1140), 0, []],
		"RoTa1":[Vector2(1240, 895), 0, []],
		"RoTa4":[Vector2(23, 1031), 0, ["You not only like this table, but it emits a signal...", "[i]The other item, a hidden panel[/i]"]],
		"RoTa2":[Vector2(1554, 810), PI/6, []],
		"RoTa3":[Vector2(1701, 895), 0, []],
		"Seat1":[Vector2(210, 927), 0, []],
		"Seat2":[Vector2(340, 1387), PI, ["You take a seat in the gross chair...[br]You feel calm...", "You are released out of this place"]],
	},
	{
		
	}
]

# camera limit format: {room-name: [left, top, right, bottom, spawn_location]}
var levels_camera_limit = [
	{
		"Bedroom": [0, 0, 1913, 1272]
	},
	{
		"Bedroom": [136, 0, 1273, 890],
		"Storage": [1252, 352, 2170, 1143],
		"Living": [0, 865, 1273, 1653]
	},
	{
		"Bedroom": [518, 6, 1398, 752],
		"PlantRoom1": [0, 229, 542, 760],
		"Living": [263, 741, 1530, 1397],
		"PlantRoom2": [905, 1379, 1399, 1909],
		"TvRoom": [135, 1382, 927, 1909],
		"Ritual": [1511, 741, 2551, 1398],
		"Empty": [1800, 1379, 2293, 1778],
		"LongHall": [1673, -2039, 2421, 756]
	}
]

var levels_room_connections = [
	{
		
	},
	{
		"Bedroom": {
			"Door1":["Storage", Vector2(1416, 637)],
			"Door2":["Living", Vector2(779, 1025)]
		},
		"Storage": {
			"Door1":["Bedroom", Vector2(1132, 594)],
		},
		"Living": {
			"Door2":["Bedroom", Vector2(779, 733)]
		}
	},
	{
		"Bedroom": {
			"Door1":["PlantRoom1", Vector2(444, 504)],
			"Door2":["Living", Vector2(772, 848)]
		},
		"PlantRoom1": {
			"Door1":["Bedroom", Vector2(639, 506)]
		},
		"Living": {
			"Door2":["Bedroom", Vector2(771, 653)],
			"Door4":["PlantRoom2", Vector2(1164, 1461)],
			"Door3":["Ritual", Vector2(1630, 1027)],
		},
		"PlantRoom2": {
			"Door4":["Living", Vector2(1156,1271)],
			"Door5":["TvRoom", Vector2(820, 1657)],
		},
		"TvRoom": {
			"Door5":["PlantRoom2", Vector2(1004, 1663)],
		},
		"Ritual": {
			"Door3":["Living", Vector2(1421, 1024)],
			"Door7":["Empty", Vector2(2057, 1477)],
			"Door6":["LongHall", Vector2(2055, 656)]
		},
		"Empty": {
			"Door7":["Ritual", Vector2(2053, 1286)]
		},
		"LongHall": {
			"Door6":["Ritual", Vector2(2055, 837)]
		}
	},
]
