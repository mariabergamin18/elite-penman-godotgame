extends Control

onready var option_popup = $VBoxContainer/OptionButton/OptionPopUp

func _ready():
	$VBoxContainer/StartButton.grab_focus()
	option_popup.hide()

func _on_StartButton_pressed():
	get_tree().change_scene("res://Main.tscn")


func _on_OptionButton_pressed():
	option_popup.show()


func _on_QuitButton_pressed():
	get_tree().quit()


func _on_Close_pressed():
	option_popup.hide()
