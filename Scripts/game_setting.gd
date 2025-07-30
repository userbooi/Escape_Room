extends Resource

class_name GameSettings

enum STATES {PLAYING, DIALOGUE, FINISHED}

@export var level = 1
@export var curr_state = STATES.PLAYING
@export var special_events = ["t", "ss", "clo", "sp"]
@export var event_num = 0
@export var found = false
