extends Control

onready var MenuScene = preload("res://Menu.tscn")
onready var PauseMenu = $PanelContainer

func _ready():
	PauseMenu.hide()

func resume():
	get_tree().paused = false

func pause():
	get_tree().paused = true

func testEsc():
	if Input.is_action_just_pressed("escape") and !get_tree().paused:
		pause()
		PauseMenu.show()
	elif Input.is_action_just_pressed("escape") and get_tree().paused:
		resume()
		PauseMenu.hide()

func _on_Resume_pressed():
	PauseMenu.hide()
	resume()
	


func _on_Restart_pressed():
	resume()
	get_tree().reload_current_scene()


func _on_QuitGame_pressed():
	get_tree().change_scene("res://Menu.tscn")

func _process(delta):
	testEsc()
