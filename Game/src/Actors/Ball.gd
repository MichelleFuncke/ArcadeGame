extends RigidBody2D

func _ready():
	# PlayerData.connect("ball_went_through_hole", self, "_ball_disappear")
	pass

func disappear(achieved_goal : bool) -> void:
	if achieved_goal:
		PlayerData.goal_hole += 1
	else:
		# Decrease the number of balls left and end the game
		PlayerData.number_of_balls -= 1
		pass
	
	emit_signal("ball_went_through_hole")
	queue_free()