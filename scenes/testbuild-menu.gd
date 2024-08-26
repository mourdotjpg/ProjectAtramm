extends Control
# меню для тестирования. удалить после альфы

func _on_buttoncutscene_pressed():
	get_tree().change_scene_to_file("res://scenes/cutscene.tscn")
	
func _on_buttoncutscene_2_pressed():
	get_tree().change_scene_to_file("res://scenes/cutscene_2_choises.tscn")
	
func _on_buttonbasement_pressed():
	get_tree().change_scene_to_file("res://scenes/basement.tscn")

func _on_buttonhall_pressed():
	get_tree().change_scene_to_file("res://scenes/hallway.tscn")

func _on_buttonbass_pressed():
	get_tree().change_scene_to_file("res://scenes/bass.tscn")
