extends Area2D

@onready var question_ui=$"../../CanvasLayer/QuestionUI"

func _on_body_entered(body: Node2D) -> void:
	print("Valami hozzáért a ládához", body.name)
	if body.name == "Player":
		print("---LÁDA NYITVA---")
		load_and_ask_question()


func load_and_ask_question():
	var file_path = "res://Data/questions.json"
	if FileAccess.file_exists(file_path):
		var file=FileAccess.open(file_path, FileAccess.READ)
		var content = file.get_as_text()
		file.close()
	
		var json=JSON.new()
		if json.parse(content)==OK:
			var data = json.get_data()
			var random_question=data["questions"].pick_random()
		
			#print("Kérdés: ", first_question["text"])
			#print("Válaszok: ", first_question["options"])
			#print("---------------")
			question_ui.show_question(random_question["text"], random_question["options"], random_question["correct_answer_index"])
		
		else:
			print("HIBA a JSON feldolgozásakor!")
	else:
		print("Nem található JSON fájl!")	

	
