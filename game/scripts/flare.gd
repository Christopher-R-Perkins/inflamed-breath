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
const OXYGEN_USED_PER_BLAST = 3
const MAX_CHECKS = 4

signal boosted(direction)
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
	EventBus.oxygen_used.emit(OXYGEN_USED_PER_BLAST)
	
	
func _process(delta: float) -> void:
	if state == Flare_State.IDLE || checks >= MAX_CHECKS:
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
			return acc + [global_position - collider.global_position]
		else:
			return acc
		
	var hits = RAY_CASTS.reduce(get_hits, [])
	
	if hits.size() == 0:
		return
		
	
	checks = MAX_CHECKS
	
	var direction_of_blast = hits.reduce(func(acc, a): return acc + a, Vector2(0 , 0))
	if direction_of_blast.y > 0:
		direction_of_blast.y = 0
	
	direction_of_blast = direction_of_blast.normalized()
	
	boosted.emit(direction_of_blast)
