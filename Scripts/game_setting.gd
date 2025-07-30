extends Resource

class_name GameSettings

enum STATES {PLAYING, DIALOGUE, FINISHED}

@export var level = 1
@export var curr_state = STATES.PLAYING
@export var special_events = ["t", "ss", "clo", "sp"]
@export var event_num = 0
@export var found = false

# Level Layout Format: {name: [position, rotation, [special lines]]}
var level1_layout = {
	"db":[Vector2(315, -55), 0, []],
	"p1":[Vector2(1663, 2), 0, []],
	"p2":[Vector2(30, 4), 0, []],
	"p3":[Vector2(32, 1011), 0, []],
	"sp":[Vector2(1670, 1021), 0, ["Inside the plant with a different green than the others", "You find a key out of this place"]],
	"cl":[Vector2(856, -14), 0, ["You pull open a hidden compartment at the back of the closet.", "You find a paper colored with an odd green color"]],
	"tv":[Vector2(652, 1218), PI, []],
	"s1":[Vector2(1061, 751), 3*PI/2, []],
	"ss":[Vector2(1283, 462), 0, ["Inside a hole where a nail used to be, you hear a voice[br]it whispers:", "[i]A hidden panel where garments live[/i]"]],
	"s2":[Vector2(1414, 895), PI, []],
	"s3":[Vector2(1644, 622), PI/2, []],
	"rect":[Vector2(1099, 562), 0, ["Among the gum stuck on the underside of the table, you found a [b]note[/b] stuck to it[br]It reads:", "[i]The seat pointing at noon[/i]"]]
	}
