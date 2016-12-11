extends Popup

var messages = []
var bgObject = null

func _ready():
	set_process_input(true)

func showMessages(theMessages = []):
	messages = theMessages
	nextMessage()

func nextMessage():
	hide()
	if not messages.empty():
		get_tree().set_pause(true)
		var msg = messages[0]
		assert msg != null
		messages.pop_front()
		get_node("Panel/RichTextLabel").set_bbcode(msg)
		popup_centered_ratio()
	else:
		get_tree().set_pause(false)
	
func _input(event):
	if event.is_action_released("player-use"):
		nextMessage()

func setBackgroundObject(obj):
	bgObject = obj
	assert bgObject != null
