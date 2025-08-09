extends Resource

class_name GameSettings

enum STATES {START, CREDIT, LEVEL_SELECT, PLAYING, DIALOGUE, FINISHED}

#===========================    TEST SETTINGS    ========================#
@export var level = 1
@export var curr_level = 1
@export var secret = false
@export var curr_state = STATES.START
@export var special_events = [
	["ReTa1", "Seat2", "Clos1", "SpPl1"],
	["DoBe1", "TeVi2", "RoTa4", "Clos1", "Plan2", "WeCh1", "Seat2"],
	["TeVi1", "TeVi3", "Plan1", "TeVi4", "Plan2", "Seat4", "Seat12", "TeVi5"],
	["", "", "", "", "", "", "Seat2", "TeVi5"]
]
@export var event_num = 0
@export var found = false
@export var curr_room = "Bedroom"
@export var level_ready = [true, true, true]

var DEBUG = false

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
		"TeVi2":[Vector2(2136, 692), PI/2, ["Endless Buffer...[br]But something is different this time", "A message is felt through the buzz...", "[i]An item found in this room[/i]"]],
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
		"Door1":[Vector2(655, 384), PI/2, []],
		"Door2":[Vector2(640, 623), 0, []],
		"Door3":[Vector2(1644, 897), PI/2, []],
		"Door4":[Vector2(1023, 1266), 0, []],
		"Door5":[Vector2(1038, 1536), PI/2, []],
		"Door6":[Vector2(1921, 623), 0, []],
		"Door7":[Vector2(1920, 1263), 0, []],
		"SiBe1":[Vector2(542, -44), 0, []],
		"Clos1":[Vector2(951, -19), 0, []],
		"Clos2":[Vector2(1147, -17), 0, []],
		"Seat1":[Vector2(1130, 326), PI/6, []],
		"Plan1":[Vector2(76, 367), 0, ["Searching around the pot, you find an etched message...", "[i]Look into the TV surrounded by an [b]audience[/b][/i]"]],
		"TeVi1":[Vector2(1364, 382), PI/2, ["Staring into the TV, you see yourself...", "You are staring into another TV with a void space surrounding you and the TV"]],
		"Plan2":[Vector2(281, 734), 0, ["You found the plant the cartoon mentioned[br]Its leaves holds a message:", "[i]The person who loves the show obviously wants to see it![/i]"]],
		"TeVi2":[Vector2(868, 1369), PI, []],
		"TeVi4":[Vector2(1970, 1001), 0, ["Staring into the TV, you begin to understand the crowd[br]It is playing your favorite cartoon from your childhood...", "But the Characters are saying one phrase and one phrase only:", "[i]Start Playing Our Game! First Find The Plant![/i]"]],
		"TeVi5":[Vector2(1979, -1999), 0, ["You have reached the end of this game. The goal is to [b]escape[/b] isn't it? However, is there a world [b]outside[/b] of these rooms?", 
										   "[color=#B61E1E][i][b]There isn't There isn't There isn't There isn't There isn't[n]There isn't There isn't There isn't There isn't There isn't[n]There isn't There isn't There isn't There isn't There isn't[n]There isn't There isn't There isn't There isn't There isn't[n]There isn't There isn't There isn't There isn't There isn't[/b][/i][/color]", 
										   "No where in this game exists a location aside from these rooms", 
										   "Though the game is made to display 'You Escaped' at the end of each level,[n]you never actually escaped these rooms", 
										   "The Character will forever be within them.[n]If you choose to replay a level, you Character will always be in these rooms", 
										   "True escape is unattainable, not with the steps you took", 
										   "Anyways, congratulations on [b][i]Escaping[/i][/b]"],
										  ["Interesting...[br]It seems you weren't a big fan of the cartoon...",
										   "Whether you came searching for another way our after my dialogue in a pervious playthrough or just found it by accident, It matters not",
										   "You found the secret ending.[br]Congratulations.",
										   "As such, I will grant your character forever freedom",
										   "Bye Bye now."]],
		"Plan3":[Vector2(1277, 736), 0, []],
		"Plan5":[Vector2(283, 1134), 0, []],
		"Plan4":[Vector2(1277, 1135), 0, []],
		"Chai1":[Vector2(489, 1051), PI*11/6, []],
		"Chai2":[Vector2(954, 972), PI/6, []],
		"Plan6":[Vector2(1052, 1547), 0, []],
		"TeVi3":[Vector2(183, 1745), PI*3/2, ["Staring into the TV, you are drawn to a far room", "The room houses a sole living entity"]],
		"Seat2":[Vector2(2343, 753), PI/4, ["You found the seat [b]FURTHEST[/b] from the TV", 
											"[color=#B61E1E]Interesting Interesting Interesting Interesting[n]Interesting Interesting Interesting Interesting[n]Interesting Interesting Interesting Interesting[n]Interesting Interesting Interesting Interesting[color]",
											"Go to the TV at the end of the long hallway"]],
		"Seat3":[Vector2(2427, 831), PI/4, []],
		"Seat4":[Vector2(1737, 1400), PI*5/4, ["You found the seat of the cartoon's number 1 fan...", "The Character's phrase changed[br]They now say:", "[i]How many TVs have you interacted with here?[br]Go to the long hallway and sit in that chair on the right[/i]"]],
		"Seat5":[Vector2(1655, 1317), PI*5/4, []],
		"Seat6":[Vector2(2439, 1309), PI*3/4, []],
		"Seat7":[Vector2(2516, 1228), PI*3/4, []],
		"Seat8":[Vector2(1571, 918), PI*7/4, []],
		"Seat9":[Vector2(1649, 847), PI*7/4, []],
		"Seat10":[Vector2(2422, 576), PI/2, []],
		"Seat11":[Vector2(2422, 472), PI/2, []],
		"Seat12":[Vector2(2422, 368), PI/2, ["You find the seat, [b]proceed forward[/b]"]],
		"Seat13":[Vector2(2422, 264), PI/2, []],
		"Seat14":[Vector2(2422, 160), PI/2, []],
		"Seat15":[Vector2(2422, 56), PI/2, []],
		"Seat16":[Vector2(2422, -48), PI/2, []],
		"Seat17":[Vector2(2422, -152), PI/2, []],
		"Seat18":[Vector2(2422, -256), PI/2, []],
		"Seat19":[Vector2(2422, -360), PI/2, []],
		"Seat20":[Vector2(2422, -464), PI/2, []],
		"Seat21":[Vector2(2422, -568), PI/2, []],
		"Seat22":[Vector2(2422, -672), PI/2, []],
		"Seat23":[Vector2(2422, -776), PI/2, []],
		"Seat24":[Vector2(2422, -880), PI/2, []],
		"Seat25":[Vector2(2422, -984), PI/2, []],
		"Seat26":[Vector2(2422, -1088), PI/2, []],
		"Seat27":[Vector2(2422, -1192), PI/2, []],
		"Seat28":[Vector2(2422, -1296), PI/2, []],
		"Seat29":[Vector2(2422, -1400), PI/2, []],
		"Seat30":[Vector2(2422, -1504), PI/2, []],
		"Seat31":[Vector2(2422, -1608), PI/2, []],
		"Seat32":[Vector2(2422, -1712), PI/2, []],
		"Seat33":[Vector2(2422, -1816), PI/2, []],
		"Seat34":[Vector2(2422, -1920), PI/2, []],
		"Seat35":[Vector2(1692, 676), PI*3/2, []],
		"Seat36":[Vector2(1692, 572), PI*3/2, []],
		"Seat37":[Vector2(1692, 468), PI*3/2, []],
		"Seat38":[Vector2(1692, 364), PI*3/2, []],
		"Seat39":[Vector2(1692, 260), PI*3/2, []],
		"Seat40":[Vector2(1692, 156), PI*3/2, []],
		"Seat41":[Vector2(1692, 52), PI*3/2, []],
		"Seat42":[Vector2(1692, -52), PI*3/2, []],
		"Seat43":[Vector2(1692, -156), PI*3/2, []],
		"Seat44":[Vector2(1692, -260), PI*3/2, []],
		"Seat45":[Vector2(1692, -364), PI*3/2, []],
		"Seat46":[Vector2(1692, -468), PI*3/2, []],
		"Seat47":[Vector2(1692, -572), PI*3/2, []],
		"Seat48":[Vector2(1692, -676), PI*3/2, []],
		"Seat49":[Vector2(1692, -780), PI*3/2, []],
		"Seat50":[Vector2(1692, -884), PI*3/2, []],
		"Seat51":[Vector2(1692, -988), PI*3/2, []],
		"Seat52":[Vector2(1692, -1092), PI*3/2, []],
		"Seat53":[Vector2(1692, -1196), PI*3/2, []],
		"Seat54":[Vector2(1692, -1300), PI*3/2, []],
		"Seat55":[Vector2(1692, -1404), PI*3/2, []],
		"Seat56":[Vector2(1692, -1508), PI*3/2, []],
		"Seat57":[Vector2(1692, -1612), PI*3/2, []],
		"Seat58":[Vector2(1692, -1716), PI*3/2, []],
		"Seat59":[Vector2(1692, -1820), PI*3/2, []],
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

#var testing = [{"Level1": {"asd": "ASD"}, "LEvel2": {"123": {"123":Vector2(2, 3)}}}, {"LevelNa": [123]}]
