extends MarginContainer


@onready var member_name_label: Label = $PanelContainer/MarginContainer/VBoxContainer/TopBar/MemberNameLabel
@onready var member_icon: TextureRect = $PanelContainer/MarginContainer/VBoxContainer/Content/MemberIcon
@onready var message_label: Label = $PanelContainer/MarginContainer/VBoxContainer/Content/MessageLabel
@onready var auto_close: Timer = $AutoClose
@onready var dialog_close_button: Button = $PanelContainer/MarginContainer/VBoxContainer/TopBar/DialogCloseButton


var dialog:Dialog:
	set(dialog_in):
		visible = false
		dialog = dialog_in
		member_name_label.text = dialog.speaker.name
		member_icon.texture = dialog.speaker.image
		message_label.text = dialog.message
		auto_close.wait_time = dialog.autoCloseTime
		dialog_close_button.autoCloseTime = dialog.autoCloseTime
		auto_close.start()
		visible = true


func _ready() -> void:
	visible = false


func close() -> void:
	visible = false
