extends Node2D


# Called when the node enters the scene tree for the first time.
func _ready():
	$Continue.visible = false
	$Back.visible = true
	$Once.visible = true
	$TenTimes.visible = true
	$Transition.visible = false
	#$Timer.autostart = false
