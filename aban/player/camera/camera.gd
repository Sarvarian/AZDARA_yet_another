extends Camera2D


const STEP : Vector2 = Vector2(.1, .1)
const MIN : Vector2 = Vector2(1, 1)
const MAX : Vector2 = Vector2(2, 2)


onready var target_zoom : Vector2 = zoom


func zoom_in() -> void:
	target_zoom -= STEP
	act()
	pass


func zoom_out() -> void:
	target_zoom += STEP
	act()
	pass


func act() -> void:
	target_zoom.x = clamp(target_zoom.x, MIN.x, MAX.x)
	target_zoom.y = clamp(target_zoom.y, MIN.y, MAX.y)
	$Tween.interpolate_property(self, "zoom",
		null, target_zoom, .2,
		Tween.TRANS_LINEAR, Tween.EASE_IN_OUT)
	$Tween.start()
