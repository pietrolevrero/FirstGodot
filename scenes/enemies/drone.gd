extends CharacterBody2D

func _process(_delta):
	var direction = Vector2.RIGHT
	var speed = 200
	
	velocity = direction * speed
	move_and_slide()
