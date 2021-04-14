#NoEnv  ; Recommended for performance and compatibility with future AutoHotkey releases.
; #Warn  ; Enable warnings to assist with detecting common errors.
SendMode Input  ; Recommended for new scripts due to its superior speed and reliability.
SetWorkingDir %A_ScriptDir%  ; Ensures a consistent starting directory.

::
wait := 2000
delay := 600000

Msgbox, {
	Started! Delay: %delay%ms. AutoDep is off by Default.
	Keys:
	Shift + i = Enable AutoDep
	Shift + o = Disable AutoDep
	Esc = Quit
}

user1 := 53t2t368t1t5t14tt5t585t86t98
user2 := 58t6t7t46t80t60t08t93ttt8t50t9

user1fix := RegExReplace(user1, "[t]")
user2fix := RegExReplace(user2, "[t]")

Loop, {
	Sleep, delay
	Send, {Enter}{+}work{Enter}
	Sleep, wait
    Send,{+}with 40{Enter}
    Sleep, wait
	Send,{+}give user1fix 30{Enter}
    Sleep, wait
	Send,{+}give user2fix 10{Enter}
	Sleep, wait
	if(autoDep = 1)
	{
		Send, {+}dep all{Enter}
	}

}

+i::
autoDep := 1
Msgbox, AutoDep is on!
return

+o::
autoDep := 0
MsgBox, AutoDep is off!
return

Esc::
Msgbox, Stopped!
exitapp