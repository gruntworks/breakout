extends Node

const TRACKS = [
	"Mosswood", 
	"Lost&Found", 
	"Moonrise", 
	"Outlaws_Farewell_pt1", 
	"Outlaws_Farewell_pt2", 
	"To_Weather_a_Storm"
] 

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	shuffle_songs()

func play_music(song: AudioStream) -> void:
	$MainTheme.stream = song
	$MainTheme.play()

func shuffle_songs() -> void:
	randomize() # Built in function for changing randi() seed
	TRACKS.shuffle() # Randomize tracks order
	var song_index = randi() % TRACKS.size()
	var audio_stream: AudioStream = load('res://assets/sound/music/' + TRACKS[song_index] + '.ogg')
	play_music(audio_stream)

func _on_MainTheme_finished() -> void:
	shuffle_songs()
