extends Area2D



@onready var game_manager: Node2D = %GameManager
@onready var animation_player: AnimationPlayer = $AnimationPlayer

func _on_body_entered(body: Node2D) -> void:
	print("+1 turbomonedas.")
	game_manager.add_points()
	animation_player.play("pickup")
	
