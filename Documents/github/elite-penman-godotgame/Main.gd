extends Node2D

var Enemy = preload("res://Enemy.tscn")

onready var enemy_container = $EnemyContainer
onready var spawn_container = $SpawnContainer
onready var spawn_timer = $SpawnTimer

var active_enemy = null
var current_letter_index : int = -1

var difficulty: int = 0

func _ready() -> void:
	randomize()
	spawn_timer.start()
	spawn_enemy()

func find_new_active_enemy(typed_character: String):
	for enemy in enemy_container.get_children():
		var prompt = enemy.get_prompt() 
		var next_character = prompt.substr(0,1)
		if next_character == typed_character:
			print("found new enemy that starts with %s" % next_character)
			active_enemy = enemy
			current_letter_index = 1
			active_enemy.set_next_character(current_letter_index)
			return


func _unhandled_input(event: InputEvent) -> void:
	if event is InputEventKey and event.is_pressed():
		var typed_event = event as InputEventKey
		var key_typed = PoolByteArray([typed_event.unicode]).get_string_from_utf8()

		if active_enemy == null:
			find_new_active_enemy(key_typed)
		else: 
			var prompt = active_enemy.get_prompt()
			var next_character = prompt.substr(current_letter_index, 1)
			if key_typed == next_character:
				print("successfully typed %s" % key_typed)
				current_letter_index += 1
				active_enemy.set_next_character(current_letter_index)
				if current_letter_index == prompt.length():
					print("done")
					current_letter_index = -1
					active_enemy.queue_free()
					active_enemy = null
			else:
				print("incorrectly typed %s instead of %s" % [key_typed, next_character])


func _on_SpawnTimer_timeout() -> void:
	spawn_enemy()

func spawn_enemy():
	var enemy_instance = Enemy.instance()
	var spawns = spawn_container.get_children()
	var index = randi() % spawns.size()
	enemy_container.add_child(enemy_instance)
	enemy_instance.global_position = spawns[index].global_position
	enemy_instance.set_difficulty(difficulty)

func _on_DifficultyTimer_timeout():
	difficulty += 1
	GlobalSignals.emit_signal("difficulty_increased", difficulty)
	print("Difficulty increased to %d " % difficulty)
	var new_wait_time = spawn_timer.wait_time -0.2
	spawn_timer.wait_time = clamp(new_wait_time, 1, spawn_timer.wait_time)


