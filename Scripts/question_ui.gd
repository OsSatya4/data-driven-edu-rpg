extends Control

@onready var question_label = $Panel/VBoxContainer/Label
@onready var button_1 = $Panel/VBoxContainer/GridContainer/Button
@onready var button_2 = $Panel/VBoxContainer/GridContainer/Button2
@onready var button_3 = $Panel/VBoxContainer/GridContainer/Button3
@onready var button_4 = $Panel/VBoxContainer/GridContainer/Button4

var current_correct_index=-1 

func _ready():
	hide()
	
	button_1.pressed.connect(check_answer.bind(0))
	button_2.pressed.connect(check_answer.bind(1))
	button_3.pressed.connect(check_answer.bind(2))
	button_4.pressed.connect(check_answer.bind(3))

func show_question(questions: String, answers:Array, correct_index:int):
	question_label.text=questions
	
	button_1.text=answers[0]
	button_2.text=answers[1]
	button_3.text=answers[2]
	button_4.text=answers[3]
	
	current_correct_index=correct_index
	
	show()

func check_answer(selected_index:int):
	if selected_index==current_correct_index:
		print("HELYES VÁLASZ!")
	else:
		print("ROSSZ VÁLASZ!")	
	hide()
