#extends Button
#
#@export var target_texture_rect: TextureRect
#@export var new_texture: Texture
#@export var new_button_color: Color = Color(0.8, 0.8, 0.8, 0.5)
#@export var disabled_button_color: Color = Color(0.8, 0.8, 0.8, 0.0)
#
#var is_activated := false
#
#func _ready():
	#if target_texture_rect and new_texture:
		#target_texture_rect.texture = new_texture
#
	## Connect button press
	#pressed.connect(_on_button_pressed)
#
	## Set initial style
	#_update_button_color()
#
#func _on_button_pressed():
	#is_activated = !is_activated
	#_update_button_color()
#
#func _update_button_color():
	#var stylebox := StyleBoxFlat.new()
	#stylebox.bg_color = new_button_color if is_activated else disabled_button_color
#
	## ✅ This is the CORRECT way to assign style overrides in Godot 4.x
	#self.theme_override_styles.normal = stylebox
	#self.theme_override_styles.hover = stylebox
	#self.theme_override_styles.pressed = stylebox
	#self.theme_override_styles.disabled = stylebox

extends Button

@export var target_texture_rect: TextureRect
@export var mail_node: Control
@export var new_texture: Texture
@export var new_button_color: Color = Color(0.8, 0.8, 0.8, 0.5)
@export var disabled_button_color: Color = Color(0.8, 0.8, 0.8, 0.0)

var is_activated := false

func _ready():
	if target_texture_rect and new_texture:
		target_texture_rect.texture = new_texture
	
	pressed.connect(_on_button_pressed)

	update_button_color()

func _on_button_pressed():
	is_activated = !is_activated
	update_button_color()

func update_button_color():
	var stylebox := StyleBoxFlat.new()
	stylebox.bg_color = new_button_color if is_activated else disabled_button_color
	mail_node.visible = is_activated
	
	stylebox.border_width_left = 0
	stylebox.border_width_right = 0
	stylebox.border_width_top = 0
	stylebox.border_width_bottom = 0
	

	self.add_theme_stylebox_override("normal", stylebox)
	self.add_theme_stylebox_override("hover", stylebox)
	self.add_theme_stylebox_override("pressed", stylebox)
	self.add_theme_stylebox_override("disabled", stylebox)
