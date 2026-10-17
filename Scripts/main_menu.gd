extends Control

@onready var main_menu_container = $MainMenuContainer
@onready var subject_menu_container = $SubjectMenuContainer

func _on_play_button_pressed() -> void:
	main_menu_container.hide()
	subject_menu_container.show()

func _on_exit_button_pressed() -> void:
	get_tree().quit()

func _on_subject_1_button_pressed() -> void:
	get_tree().change_scene_to_file("res://Scenes/mainScene.tscn")


func _on_back_button_pressed() -> void:
	subject_menu_container.hide()
	main_menu_container.show()
