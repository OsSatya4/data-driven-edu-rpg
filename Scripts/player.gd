extends CharacterBody2D

const SPEED = 300.0

func _physics_process(delta):
	# Bekérjük az irányítást (balra, jobbra, fel, le nyílgombok)
	var direction = Input.get_vector("ui_left", "ui_right", "ui_up", "ui_down")
	
	# Beállítjuk a karakter sebességét az iránynak megfelelően
	velocity = direction * SPEED

	# A Godot beépített parancsa, ami elvégzi a mozgatást és figyeli a falakat
	move_and_slide()
