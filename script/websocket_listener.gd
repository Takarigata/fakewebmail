extends Node

const WATCHED_FILE := "C:\\dblon\\godot.txt"
var last_modified_time := 0

func write():
	var file = FileAccess.open(WATCHED_FILE, FileAccess.WRITE)
	var text_edit = get_node("TextEdit")
	var content = text_edit.text
	file.store_string(content)
	file.close()

func _ready():
	write()
	print("Watching for changes to: ", WATCHED_FILE)
	check_file_changed()

func _process(_delta):
	check_file_changed()

func check_file_changed():
	var file = FileAccess.open(WATCHED_FILE, FileAccess.READ)
	if file:
		var mod_time = FileAccess.get_modified_time(WATCHED_FILE)
		if mod_time != last_modified_time:
			last_modified_time = mod_time
			var content = file.get_as_text()
			print("File changed! Content:\n", content)
		file.close()
		


func _on_text_edit_text_changed() -> void:
	write() # Replace with function body.
	
	
