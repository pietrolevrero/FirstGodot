extends Node2D


func _on_gate_player_entered_gate():
	print("player entered gate level")


func _on_player_laser_signal():
	print("laser from level")


func _on_player_granade_signal():
	print("grenade from level")
