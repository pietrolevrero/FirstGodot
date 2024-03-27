extends LevelParent

var outisde_level_scene: PackedScene = preload("res://scenes/levels/outside.tscn")

func _on_exit_gate_area_body_entered(_body):
	var tween = create_tween()
	tween.tween_property($Player, "speed", 0, 0.3)
	get_tree().change_scene_to_packed(outisde_level_scene)
