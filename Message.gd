extends Popup

var messages = []

func _ready():
	set_process_input(true)

func showMessages(theMessages = []):
	messages = theMessages
	nextMessage()

func nextMessage():
	hide()
	if not messages.empty():
		var msg = messages[0]
		assert msg != null
		messages.pop_front()
		get_node("RichTextLabel").set_bbcode(msg)
		popup()
	
func _input(event):
	if event.is_action_released("player-use"):
		nextMessage()
