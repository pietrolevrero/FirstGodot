extends CharacterBody2D

var can_laser: bool = true
var can_grenade: bool = true

signal laser_signal
signal granade_signal

func _process(_delta):
	var direction = Input.get_vector("left","right","up","down")
	velocity = direction * 500
	move_and_slide()
	
	if (Input.is_action_just_pressed("primary action") and can_laser):
		laser_signal.emit()
		can_laser = false
		$LaserTimer.start()

	if (Input.is_action_just_pressed("secondary action") and can_grenade):
		granade_signal.emit()
		can_grenade = false
		$GranadeTimer.start()


func _on_laser_timer_timeout():
	can_laser = true

func _on_granade_timer_timeout():
	can_grenade = true
