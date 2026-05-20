extends Node
# this is an autoload


@onready var clips: Node = $Clips
var active_music_stream: AudioStreamPlayer

func stop_music():
	if active_music_stream:
		active_music_stream.stop()

func play_music(audio_name: String, from_pos: float = 0.0, restart: bool = true) -> void:
	if restart and active_music_stream and active_music_stream.name == audio_name:
		return
	else: 
		var tween: Tween = get_tree().create_tween()
		stop_music()
			
		active_music_stream = clips.get_node(audio_name)
		active_music_stream.play(from_pos)
		tween.tween_property(active_music_stream, "volume_db", 0.0, 0.3)
