extends Control

func _on_buttonnewgame_pressed():
	get_tree().change_scene_to_file("res://scenes/cutscene.tscn")

func _on_buttonoptions_pressed():
	get_tree().change_scene_to_file("res://UI/game_options.tscn")
	
func _on_buttoncredits_pressed():
	get_tree().change_scene_to_file("res://UI/credits.tscn")
	
func _on_buttonquit_pressed():
	get_tree().quit()
