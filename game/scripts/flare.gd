extends Node2D

@export_flags_2d_physics var mask

const RAY_CASTS = [
	Vector2(1, 0), 
	Vector2(.707, .707), 
	Vector2(0, 1), 
	Vector2(-.707, .707), 
	Vector2(-1, 0), 
	Vector2(-.707,-.707), 
	Vector2(0, -.707), 
	Vector2(.707, -.707),
]
const BLAST_RADIUS = 12

signal boosted
@onready var animator = $AnimationPlayer

enum Flare_State {IDLE, FIRING}
@export var state = Flare_State.IDLE

var checks = 0
var checkTime = 0

func fire():
	if state == Flare_State.FIRING:
		return
	
	animator.play('fire')
	checks = 0
	checkTime = 0
	
	
func _process(delta: float) -> void:
	if state == Flare_State.IDLE || checks > 3:
		return
		
	checkTime -= delta
	if checkTime >= 0:
		return
		
	checkTime = .1
	checks += 1
		
	var space_state = get_world_2d().direct_space_state
	
	var get_hits = func(acc, ray):
		var query = PhysicsRayQueryParameters2D.create(
			global_position + (ray * 4), global_position - (ray * BLAST_RADIUS), mask)
		var result = space_state.intersect_ray(query)
		
		if result:
			var collider = result.collider
			if collider.has_method('alight'):
				collider.alight()
			return acc + [global_position - result.position]
		else:
			return acc
		
	var hits = RAY_CASTS.reduce(get_hits, [])
	
	var direction_of_blast = hits.reduce(func(acc, a): return acc + a, Vector2(0 , 0)).normalized()
	if direction_of_blast.y > 0:
		return
		
	checks = 1000
	
	emit_signal('boosted', direction_of_blast)
