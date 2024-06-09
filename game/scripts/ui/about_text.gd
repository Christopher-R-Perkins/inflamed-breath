extends RichTextLabel

func _ready() -> void:
	if OS.get_name() != "HTML5":
		connect('meta_clicked', _on_meta_clicked)

func _on_meta_clicked(meta):
	OS.shell_open(meta)
