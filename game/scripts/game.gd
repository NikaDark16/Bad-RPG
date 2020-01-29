extends Node2D

func _on_Player_die():
	$Player.queue_free()
	$Spawner.queue_free()
	$WindowDialog.show()


func _on_ButtonYes_button_down():
	get_tree().reload_current_scene()

func _on_ButtonNo_button_down():
	get_tree().quit()
