extends CanvasLayer

var battleInProgress = false

var hero = null
var enemy1 = null
var enemy2 = null
var enemy3 = null

func _ready():
	set_process_input(true)
	
	hero = get_node("Hero/BattleEntity")
	assert hero != null
	hero.setEntityName("Guy")
	enemy1 = get_node("Enemies/Enemy1/BattleEntity")
	assert enemy1 != null
	enemy1.setEntityName("Enemy")
	enemy2 = get_node("Enemies/Enemy2/BattleEntity")
	assert enemy2 != null
	enemy2.setEntityName("Enemy")
	enemy3 = get_node("Enemies/Enemy3/BattleEntity")
	assert enemy3 != null
	enemy3.setEntityName("Enemy")
	
	set_fixed_process(true)

func engage():
	battleInProgress = true
	hero.reset()
	enemy1.reset()
	enemy2.reset()
	enemy3.reset()	
	get_tree().set_pause(true)
	get_node("AnimationPlayer").play("Engage")
	
func finish():
	battleInProgress = false
	get_tree().set_pause(false)
	get_node("AnimationPlayer").play_backwards("Engage")

func enemyThink(enemy):
	if battleInProgress and enemy.isReadyForAction():
		enemy.attack(hero)

func _fixed_process(delta):
	enemyThink(enemy1)
	enemyThink(enemy2)
	enemyThink(enemy3)

func _input(event):
	if event.type == InputEvent.KEY:
		if event.is_action_released("debug-battle-engage"):
			engage()
		elif event.is_action_released("debug-battle-finish"):
			finish()
		elif event.is_action_released("debug-battle-attack"):
			get_node("Hero/BattleEntity").attack(get_node("Enemies/Enemy1/BattleEntity"))
			get_node("Hero/BattleEntity").attack(get_node("Enemies/Enemy2/BattleEntity"))
			get_node("Hero/BattleEntity").attack(get_node("Enemies/Enemy3/BattleEntity"))
		#elif event.is_action_released("debug-battle-damage"):
		#	get_node("Enemies/Enemy1/BattleEntity").attack(get_node("Hero/BattleEntity"))
		#	get_node("Enemies/Enemy2/BattleEntity").attack(get_node("Hero/BattleEntity"))
		#	get_node("Enemies/Enemy3/BattleEntity").attack(get_node("Hero/BattleEntity"))
