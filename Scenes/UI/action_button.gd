extends TextureButton

@onready var timer: Timer = $Sweep/Timer
@onready var value: Label = $Coutner/Value
@onready var sweep: TextureProgressBar = $Sweep

var action:Action


func _ready() -> void:
	timer.wait_time = action.cooldownTime
	value.hide()
	sweep.texture_progress = texture_normal
	sweep.value = 0
	set_process(false)


func _process(delta: float) -> void:
	value.text = "%2.1f" % timer.time_left
	sweep.value = (int)((timer.time_left / action.cooldownTime) * 100)


func _on_pressed() -> void:
	disabled = true
	set_process(true)
	timer.start()
	value.show()


func _on_timer_timeout() -> void:
	sweep.value = 0
	disabled = false
	value.hide()
	set_process(false)
