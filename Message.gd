extends Popup

var messages = []
var bgObject = null
var active = false

func _ready():
	set_process_input(true)

func showMessages(theMessages = []):
	messages = theMessages
	if not messages.empty():
		nextMessage()

func nextMessage():
	hide()
	if not messages.empty():
		active = true
		get_tree().set_pause(true)
		var msg = messages[0]
		assert msg != null
		messages.pop_front()
		get_node("Panel/RichTextLabel").set_bbcode(msg)
		popup_centered_ratio()
	else:
		active = false
		get_tree().set_pause(false)
	
func _input(event):
	if active and event.is_action_released("player-use"):
		nextMessage()

func setBackgroundObject(obj):
	bgObject = obj
	assert bgObject != null
