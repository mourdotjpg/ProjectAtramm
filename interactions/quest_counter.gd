extends Node

# ______ Item quest counter ______

var qbook: bool = false
var qsacrifice: bool = false
var qlightbulb: bool = false
var qitemquest: bool = false # false if not done, true if done

# ______ Sid quest counter ______

var sknife: bool = false
var sbook: bool = false # imp
var spenta: bool = false #imp
var spaint: bool = false # imp
var squest: bool = false # false if not done, true if done

# ______ Item quest if finished ______

func itemQuest():
	if qbook == true and qsacrifice == true and qlightbulb == true:
		qitemquest = true
		print("[QUEST COUNTER] item quest completed")

# ______ Sid quest if finished ______

func sidQuest():
	if sknife == true && sbook == true && spenta == true && spaint == true:
		squest = true
		print("[QUEST COUNTER] sid quest clear")
