extends Resource

class_name GameSettings

enum STATES {START, LEVEL_SELECT, PLAYING, DIALOGUE, FINISHED}

#============================    DEFAULT SETTINGS    ===========================#
#@export var level = 1
#@export var curr_state = STATES.START
#@export var special_events = ["ReTa1", "Seat2", "Clos1", "SpPl1"]
#@export var event_num = 0
#@export var found = false
#@export var curr_room = "Bedroom"
#var DEBUG = false

#===========================    TEST SETTINGS    ========================#
@export var level = 1
@export var curr_state = STATES.PLAYING
@export var special_events = ["ReTa1", "Seat2", "Clos1", "SpPl1"]
@export var event_num = 0
@export var found = false
@export var curr_room = "Bedroom"
var DEBUG = true

# Level Layout Format: {name: [position, rotation, [special lines]]}
var level1_layout = {
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
}

# camera limit format: {room-name: [left, top, right, bottom]}
var level1_camera_limit = {
	"Bedroom": [0, 0, 1913, 1272]
}
