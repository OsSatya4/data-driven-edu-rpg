extends Control

@onready var question_label = $Panel/VBoxContainer/Label
@onready var button_1 = $Panel/VBoxContainer/GridContainer/Button
@onready var button_2 = $Panel/VBoxContainer/GridContainer/Button2
@onready var button_3 = $Panel/VBoxContainer/GridContainer/Button3
@onready var button_4 = $Panel/VBoxContainer/GridContainer/Button4
@onready var health_label=$"../HealthLabel"
@onready var game_over_ui=$"../GameOverUI"
@onready var coin_label=$"../CoinLabel"
@onready var timer_label=$"TimerLabel"
@onready var timer =$"Timer"

var current_correct_index=-1 
var hp=3
var coins=0
var time_left=30

func _ready():
	hide()
	
	button_1.pressed.connect(check_answer.bind(0))
	button_2.pressed.connect(check_answer.bind(1))
	button_3.pressed.connect(check_answer.bind(2))
	button_4.pressed.connect(check_answer.bind(3))

#kérdés és válasz megjelenítése
func show_question(questions: String, answers:Array, correct_index:int):
	var buttons=[button_1,button_2,button_3,button_4]
	question_label.text=questions
	
	for b in buttons:
		b.disabled=false
	
	button_1.modulate=Color.WHITE
	button_2.modulate=Color.WHITE
	button_3.modulate=Color.WHITE
	button_4.modulate=Color.WHITE
	
	button_1.text=answers[0]
	button_2.text=answers[1]
	button_3.text=answers[2]
	button_4.text=answers[3]
	
	current_correct_index=correct_index
	
	time_left=30
	timer_label.text="00:"+str(time_left)
	timer.start()
	
	show()
	get_tree().paused=true

#válasz ellenörzése
func check_answer(selected_index:int):
	var buttons=[button_1,button_2,button_3,button_4]
	var pressed_button=buttons[selected_index]
	timer.stop()
	
	for b in buttons:
		b.disabled=true
	
	if selected_index==current_correct_index:
		print("HELYES VÁLASZ!")
		pressed_button.modulate=Color.GREEN
		coins+=10
		coin_label.text="Arany: "+str(coins)
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
		
	await get_tree().create_timer(1.0, true).timeout
	hide()
	get_tree().paused=false

func _on_timer_timeout():
	time_left-=1
	
	#timer formázása
	if time_left<10:
		timer_label.text="00:0"+str(time_left)
	else:
		timer_label.text="00:"+str(time_left)
	
	#lejárt időért büntetés	
	if time_left<=0:
		timer.stop()	
		hp-=1
		if hp==2:
			health_label.text="ÉLET: ♥ ♥"
			get_tree().paused = false
		elif hp==1:
			health_label.text="ÉLET: ♥ "
			get_tree().paused = false
		elif  hp<=0:
			health_label.text="VÉGE A JÁTÉKNAK"
			game_over_ui.show()
			
		hide()
