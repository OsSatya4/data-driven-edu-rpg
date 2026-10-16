extends Control

@onready var question_label = $Panel/VBoxContainer/Label
@onready var button_1 = $Panel/VBoxContainer/GridContainer/Button
@onready var button_2 = $Panel/VBoxContainer/GridContainer/Button2
@onready var button_3 = $Panel/VBoxContainer/GridContainer/Button3
@onready var button_4 = $Panel/VBoxContainer/GridContainer/Button4
@onready var health_label=$"../HealthLabel"
@onready var game_over_ui=$"../GameOverUI"

var current_correct_index=-1 
var hp=3

func _ready():
	hide()
	
	button_1.pressed.connect(check_answer.bind(0))
	button_2.pressed.connect(check_answer.bind(1))
	button_3.pressed.connect(check_answer.bind(2))
	button_4.pressed.connect(check_answer.bind(3))

func show_question(questions: String, answers:Array, correct_index:int):
	question_label.text=questions
	
	button_1.modulate=Color.WHITE
	button_2.modulate=Color.WHITE
	button_3.modulate=Color.WHITE
	button_4.modulate=Color.WHITE
	
	button_1.text=answers[0]
	button_2.text=answers[1]
	button_3.text=answers[2]
	button_4.text=answers[3]
	
	current_correct_index=correct_index
	
	show()

func check_answer(selected_index:int):
	var buttons=[button_1,button_2,button_3,button_4]
	var pressed_button=buttons[selected_index]
	
	if selected_index==current_correct_index:
		print("HELYES VÁLASZ!")
		pressed_button.modulate=Color.GREEN
	else:
		print("ROSSZ VÁLASZ!")	
		pressed_button.modulate=Color.RED
		
		hp-=1
		if hp==2:
			health_label.text="ÉLET: ♥ ♥"
		elif hp==1:
			health_label.text="ÉLET: ♥ "	
		elif  hp<=0:
			health_label.text="VÉGE A JÁTÉKNAK"
			game_over_ui.show()
		
	await get_tree().create_timer(2.0).timeout
	hide()
