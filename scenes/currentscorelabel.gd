extends RichTextLabel

var defult_text = "CURRENT SCORE: "

func _process(_delta: float) -> void:
	text = str(defult_text, str(Global.current_score))
	self.text = (text)
