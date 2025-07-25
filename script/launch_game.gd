extends Node

func _on_launch_button_pressed():
	var exe_path = "C:\\Users\\charl\\Downloads\\h2testw_1.4\\h2testw.exe"
	var arguments = []  # Add command line arguments if needed
	
	# Launch the executable
	var pid = OS.create_process(exe_path, arguments)
	
	if pid > 0:
		print("Successfully launched process with PID: ", pid)
	else:
		print("Failed to launch executable")


func _on_button_quit_pressed() -> void:
	get_tree().quit()
