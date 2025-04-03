extends Node

#Todo: figure out how to make this more dynamic
const MASTER_BUS_INDEX = 0
const MUSIC_BUS_INDEX = 1
const AMBIENCE_BUS_INDEX = 2
const SFX_BUS_INDEX = 3

var soundSettings = {
	'Master': {
		'mute':false,
		'value':0.7,
		},
	'Music': {
		'mute':false,
		'value':0.7,
		},
	'Ambience': {
		'mute':false,
		'value':1,
		},
	'SFX': {
		'mute':false,
		'value':1,
		},
	}

var controlSettings = {
		"menu_pause": InputMap.action_get_events("menu_pause")[0],
		#"building_tray_open": InputMap.action_get_events("building_tray_open")[0],
		#"set_speed_high": InputMap.action_get_events("set_speed_high")[0],
		#"set_speed_low": InputMap.action_get_events("set_speed_low")[0],
		#"time_pause": InputMap.action_get_events("time_pause")[0],
	}

func _ready():
	applySettings()

func applySettings():
	print(soundSettings)
	#==sounds==
	applyAudioSettingsChanged()
	applyMuteAudioSettings()
	#==controls==
	for setting in controlSettings:
		InputMap.action_erase_events(setting)
		InputMap.action_add_event(setting, controlSettings[setting])
		print(setting,':',InputMap.action_get_events(setting))

func applyAudioSettingsChanged():
	AudioServer.set_bus_volume_db(MASTER_BUS_INDEX,linear_to_db(soundSettings.Music.value))
	AudioServer.set_bus_volume_db(MUSIC_BUS_INDEX,linear_to_db(soundSettings.Music.value))
	AudioServer.set_bus_volume_db(SFX_BUS_INDEX,linear_to_db(soundSettings.SFX.value))
	AudioServer.set_bus_volume_db(AMBIENCE_BUS_INDEX,linear_to_db(soundSettings.Ambience.value))
	
func applyMuteAudioSettings():
	AudioServer.set_bus_mute(MASTER_BUS_INDEX,soundSettings.Music.mute)
	AudioServer.set_bus_mute(MUSIC_BUS_INDEX,soundSettings.Music.mute)
	AudioServer.set_bus_mute(SFX_BUS_INDEX,soundSettings.SFX.mute)
	AudioServer.set_bus_mute(AMBIENCE_BUS_INDEX,soundSettings.Ambience.mute)
