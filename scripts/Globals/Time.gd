extends Node

func get_current_time_dict():
	var time = Time.get_time_dict_from_system()
	return time

func get_time_string_from_dict(time):
	var ret : String = "%2d:%02d" % [((time.get("hour")-1)%12)+1, time.get("minute")]
	if Settings.show_seconds:
		ret += ":%02d" % [time.get("second")]
	if Settings.show_AmPm:
		if (time.get("hour") <12):
			ret += " AM"
		else:
			ret += " PM"
	ret += "  "
	return ret



## Time A -> Time B (Time A is the earlier time)
func get_time_between_times(timeA:Dictionary, timeB:Dictionary):
	var ret = []
	for i in range(3):
		ret.append(timeB[i]-timeA[i])
	return ret

func get_clock_time():
	return get_time_string_from_dict(get_current_time_dict())
