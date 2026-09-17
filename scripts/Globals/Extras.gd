extends Node

func comma(text:int) -> String:
	var textArray = []
	
	for letter in str(text):
		textArray.append(letter)
	
	var counter = 0
	var ret = ""
	
	while len(textArray)>0:
		if counter==3:
			ret = "," + ret
		counter+=1
		ret = textArray[len(textArray)-1] + ret
		textArray.pop_back()
	
	return ret
