extends Node

var mainTheme = load("res://assets/sound/background_1.ogg")
# Called when the node enters the scene tree for the first time.
func _ready():
	playMainTheme()


func playMainTheme():
	$Music.stream = mainTheme
	$Music.play()
