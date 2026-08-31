extends Node

func get_current_time_dict():
	var time = Time.get_time_dict_from_system()
	return time

func get_time_string_from_dict(time):
	if Settings.show_seconds:
		return "%02d:%02d:%02d  " % [time.get("hour"), time.get("minute"),time.get("second")]
	return "%02d:%02d  " % [time.get("hour"), time.get("minute")]

## Time A -> Time B (Time A is the earlier time)
func get_time_between_times(timeA:Dictionary, timeB:Dictionary):
	var ret = []
	for i in range(3):
		ret.append(timeB[i]-timeA[i])
	return ret

func get_clock_time():
	return get_time_string_from_dict(get_current_time_dict())
