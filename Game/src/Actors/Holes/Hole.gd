extends Area2D

export (bool) var is_goal := false
export (int) var hole_size_number
export (int) var hole_number

func _ready():
	PlayerData.connect("goal_updated", self, "_update_status")
	
func _update_status(goal: int):
	# This is where we want to update is_goal and change the state of the hole if it is the new goal
	# Need to look at the groups to determine if it is the group of "goal holes"
	if self.is_in_group("Goal"):
		is_goal = goal == hole_number

func _on_ball_entered(area):
	# Check if the body is ball
	var object = area.get_parent()
	if not object.is_in_group("Ball"):
		return
	# If is_goal
	object.disappear(is_goal)