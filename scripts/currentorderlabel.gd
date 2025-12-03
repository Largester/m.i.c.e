extends RichTextLabel


var defult_text = "CURRENT ORDER: "

func _process(_delta: float) -> void:
	text = str(defult_text, str(Global.current_order))
	self.text = (text)
