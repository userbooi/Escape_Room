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
@export var level = 2
@export var curr_level = 2
@export var curr_state = STATES.PLAYING
@export var special_events = [
	["ReTa1", "Seat2", "Clos1", "SpPl1"],
	[]
]
@export var event_num = 0
@export var found = false
@export var curr_room = "Bedroom"
@export var level_ready = [true, true, false]
var DEBUG = true

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
		"Door1":[Vector2(1389, 514), PI/2, ["Storage"]],
		"Door2":[Vector2(641, 751), 0, ["Living"]],
		"DoBe1":[Vector2(203, -51), 0, []],
		"Plan1":[Vector2(153, 623), 0, []],
		"Plan2":[Vector2(1038, 1404), 0, []],
		"Plan3":[Vector2(23, 1401), 0, []],
		"WeCh1":[Vector2(1094, 30), 0, []],
		"TeVi1":[Vector2(722, 1620), PI, []],
		"TeVi2":[Vector2(2136, 692), PI/2, []],
		"Clos1":[Vector2(1211, 911), 0, []],
		"Clos2":[Vector2(1249, 339), 0, []],
		"Clos5":[Vector2(1543, 350), 0, []],
		"Clos3":[Vector2(1472, 314), PI/6, []],
		"Clos4":[Vector2(1748, 673), PI*4/3, []],
		"Clos6":[Vector2(1896, 314), PI/6, []],
		"Clos7":[Vector2(2227, 502), PI*3/4, []],
		"Clos8":[Vector2(2001, 773), PI*4/3, []],
		"Sofa1":[Vector2(510, 1140), 0, []],
		"RoTa1":[Vector2(1240, 895), 0, []],
		"RoTa4":[Vector2(23, 1031), 0, []],
		"RoTa2":[Vector2(1554, 810), PI/6, []],
		"RoTa3":[Vector2(1701, 895), 0, []],
		"Seat1":[Vector2(210, 927), 0, []],
		"Seat2":[Vector2(340, 1387), 180, []],
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
		"Living": [0, 865, 1273, 1653, Vector2(779, 1025)]
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
	}
]
