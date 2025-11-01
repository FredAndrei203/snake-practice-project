class_name RoundEndUI extends Control

var message: String:
	set(new_value):
		message = new_value
		%Label.text = message
