extends Node

static func save_to_json(path, data) -> bool:
	var json_string = JSON.stringify(data, "\t")
	var file = FileAccess.open(path, FileAccess.WRITE)
	if file:
		file.store_string(json_string)
		file.close()
		return true
	return false

static func load_from_json(path):
	if not FileAccess.file_exists(path):
		return {"error": "FileDoesNotExist"}
	
	var file = FileAccess.open(path, FileAccess.READ)
	if file:
		var json_string = file.get_as_text()
		file.close()
		
		var json = JSON.new()
		if json.parse(json_string) == OK:
			return json.data
	return {"error": "FileCouldNotBeOpened"}
	
static func save_max_level(level, path):
	var data = load_from_json(path)
	if level > data["max_level"]:
		data["max_level"] = level
		save_to_json(path, data)
		
