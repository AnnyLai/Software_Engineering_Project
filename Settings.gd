extends Node2D


# Called when the node enters the scene tree for the first time.
func _ready():
	$SettingsBG.visible = true
	$NameLabel.visible = true
	$Name.visible = true
	$Name.editable = false
	$Name.text = Global.register_args["nickname"]
	$Pen.visible = true
	$PlayerID.text = "ID: " + Global.PlayerID
	$PlayerID.visible = true
	$BGM/BGMLabel.visible = true
	$BGM/Sprite2D.visible = true
	$BGM/Sprite2D2.visible = true
	$SE/SELabel.visible = true
	$SE/Sprite2D.visible = true
	$SE/Sprite2D2.visible = true
	

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass


func _on_touch_screen_button_pressed():
	if $Name.editable == false:
		$Name.editable = true
	else:
		$Name.editable = false
		Global.register_args["nickname"] = $Name.text
