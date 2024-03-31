extends Button


var autoCloseTime:float:
	set(time_in):
		autoCloseTime = time_in
		progress_bar.value = 0
		timer.wait_time = autoCloseTime
		timer.start()

@onready var progress_bar: ProgressBar = $ProgressBar
@onready var timer: Timer = $ProgressBar/Timer


func _process(_delta: float) -> void:
	progress_bar.value = (int)((timer.time_left / autoCloseTime) * 100)
