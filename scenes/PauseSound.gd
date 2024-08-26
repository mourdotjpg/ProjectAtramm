extends AudioStreamPlayer

@onready var pause_menu_open

func audiofxpusemenu():
	if pause_menu_open == true:
		play()
