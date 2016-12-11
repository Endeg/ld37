extends CanvasLayer

var battleInProgress = false

func _ready():
	set_process_input(true)
	
	get_node("Hero/BattleEntity").setEntityName("Guy")
	get_node("Enemies/Enemy1/BattleEntity").setEntityName("Enemy")
	get_node("Enemies/Enemy2/BattleEntity").setEntityName("Enemy")
	get_node("Enemies/Enemy3/BattleEntity").setEntityName("Enemy")

func engage():
	battleInProgress = true
	get_tree().set_pause(true)
	get_node("AnimationPlayer").play("Engage")
	
func finish():
	battleInProgress = false
	get_tree().set_pause(false)
	get_node("AnimationPlayer").play_backwards("Engage")

func _input(event):
	if event.type == InputEvent.KEY:
		if event.is_action_released("debug-battle-engage"):
			engage()
		elif event.is_action_released("debug-battle-finish"):
			finish()
		elif event.is_action_released("debug-battle-attack"):
			get_node("Hero/BattleEntity").displayAttack()
			get_node("Enemies/Enemy1/BattleEntity").displayDamage()
			get_node("Enemies/Enemy2/BattleEntity").displayDamage()
			get_node("Enemies/Enemy3/BattleEntity").displayDamage()
		elif event.is_action_released("debug-battle-damage"):
			get_node("Hero/BattleEntity").displayDamage()
			get_node("Enemies/Enemy1/BattleEntity").displayAttack()
			get_node("Enemies/Enemy2/BattleEntity").displayAttack()
			get_node("Enemies/Enemy3/BattleEntity").displayAttack()