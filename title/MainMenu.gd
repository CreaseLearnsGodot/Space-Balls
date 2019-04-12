#MainMenu.gd
extends Control

func _on_Start_pressed():
	audio_player.play_sound("res://assets/UI/click.wav")
	get_tree().change_scene("res://maps/Main.tscn")

func _on_Quit_pressed():
	audio_player.play_sound("res://assets/UI/click.wav")
	get_tree().quit()

func _on_Options_pressed():
	audio_player.play_sound("res://assets/UI/click.wav")
	get_tree().change_scene("res://Options.tscn")

func _on_Back_pressed():
	audio_player.play_sound("res://assets/UI/click.wav")
	get_tree().change_scene("res://MainMenu.tscn")