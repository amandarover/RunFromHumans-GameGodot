extends Node

export (PackedScene) var Mob
var score

func _ready():
	randomize()

func _process(delta):
	pass

func game_over():
	if $Player/CollisionShapeFire.disabled:
		$ScoreTimer.stop()
		$MobTimer.stop()
		$HUD.update_score(score)
		$HUD.show_game_over()
		$Music.stop()
		$DeathSound.play()

func new_game():
	score = 0
	$Player.start($StartPosition.position)
	$StartTimer.start()
	$HUD.update_score(score)
	$HUD.show_message("Get Ready!")
	$Music.play()
	$DeathSound.stop()

func _on_StartTimer_timeout():
	$MobTimer.start()
	$ScoreTimer.start()

func _on_ScoreTimer_timeout():
	score += 1
	$HUD.update_score(score)

func _on_MobTimer_timeout():
	#$MobPath/MobSpawnLocation.set_offset(randi())
	var mob = Mob.instance()
	add_child(mob)
	mob.set_position(Vector2(rand_range(0,450),0))


func _on_Player_body_entered():
	pass # replace with function body


func _on_Player_hit():
	pass # replace with function body
