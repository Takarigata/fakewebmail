extends Node

var camera_feed : CameraFeed

func _ready():
	await get_tree().create_timer(1.0).timeout 
	print("Camera feeds available: ", CameraServer.get_feed_count())
	for i in range(CameraServer.get_feed_count()):
		var feed = CameraServer.get_feed(i)
		print("Feed ", i, ": ", feed.get_name(), " - Active: ", feed.is_active())
	
	if CameraServer.get_feed_count() == 0:
		print("No webcam found.")
		return # Longer wait
	if CameraServer.get_feed_count() == 0:
		print("No webcam found.")
		return

	camera_feed = CameraServer.get_feed(0)
	camera_feed.set_active(true)

	await get_tree().create_timer(0.5).timeout

	take_snapshot()

func take_snapshot():
	var tex : Texture2D = camera_feed.get_texture()
	if tex:
		var img : Image = tex.get_image()
		var save_path : String = "C:\\dblon\\test.png"
		var result : int = img.save_png(save_path)
		if result == OK:
			print("Snapshot saved to: ", save_path)
		else:
			print("Failed to save snapshot. Error code: ", result)
