extends Node

func get_current_time_dict():
	var time = Time.get_time_dict_from_system()
	return time

func get_time_string_from_dict(time):
	return str(time[0] + ":" + time[1])

## Time A -> Time B (Time A is the earlier time)
func get_time_between_times(timeA:Dictionary, timeB:Dictionary):
	var ret = []
	for i in range(3):
		ret.append(timeB[i]-timeA[i])
	return ret
