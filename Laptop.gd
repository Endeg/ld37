extends Area2D

func _ready():
	print("Laptop ready.")

func _on_Laptop_body_enter(body):
	print("Body enter: " + body.get_name())
	if body.get_name() == "Player":
		body.set_examined_object(self)

func _on_Laptop_body_exit(body):
	print("Area exit: " + body.get_name())
	if body.get_name() == "Player":
		body.set_examined_object(null)
