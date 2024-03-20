extends CharacterBody2D

var can_laser: bool = true
var can_grenade: bool = true

signal laser_signal(position)
signal granade_signal(position)

func _process(_delta):
	var direction = Input.get_vector("left","right","up","down")
	velocity = direction * 500
	move_and_slide()
	
	if (Input.is_action_just_pressed("primary action") and can_laser):
		var laser_markers = $LaserStartPositions.get_children()
		var selected_laser_marker = laser_markers[randi() % laser_markers.size()]
		laser_signal.emit(selected_laser_marker.global_position)
		can_laser = false
		$LaserTimer.start()

	if (Input.is_action_just_pressed("secondary action") and can_grenade):
		var laser_markers = $LaserStartPositions.get_children()
		var selected_laser_marker = laser_markers[randi() % laser_markers.size()]
		granade_signal.emit(selected_laser_marker.global_position)
		can_grenade = false
		$GranadeTimer.start()


func _on_laser_timer_timeout():
	can_laser = true

func _on_granade_timer_timeout():
	can_grenade = true
