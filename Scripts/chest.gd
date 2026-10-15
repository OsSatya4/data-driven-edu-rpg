extends Area2D

func _on_body_entered(body: Node2D) -> void:
	if body.name == "Player":
			print("---LÁDA NYITVA---")
			load_and_ask_question() # Replace with function body.

func load_and_ask_question():
	var file_path = "res://Data/questions.json"
	if FileAccess.file_exists(file_path):
		var file=FileAccess.open(file_path, FileAccess.READ)
		var content = file.get_as_text()
		file.close
	
		var json=JSON.new()
		if json.parse(content)==OK:
			var data = json.get_data()
			var first_question=data["questions"][0]
		
			print("Kérdés: ", first_question["text"])
			print("Válaszok: ", first_question["options"])
			print("---------------")
		
		else:
			print("HIBA a JSON feldolgozásakor!")
	else:
		print("Nem található JSON fájl!")	

	
