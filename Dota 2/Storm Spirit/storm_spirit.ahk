
#NoEnv  ; Recommended for performance and compatibility with future AutoHotkey releases.
#Warn  ; Enable warnings to assist with detecting common errors.
SendMode Input  ; Recommended for new scripts due to its superior speed and reliability.
SetWorkingDir %A_ScriptDir%  ; Ensures a consistent starting directory.

;#SingleInstance force       ;Skips the dialog box and replaces the old instance automatically, which is similar in effect to the Reload command.
#SingleInstance ignore     ;Skips the dialog box and leaves the old instance running. In other words, attempts to launch an already-running script are ignored.
;#SingleInstance off        ;Allows multiple instances of the script to run concurrently.


; FUNCTIONS -------------------------------------------------------------------------------------------
checkSuspend()
checkSuspend(){
	If(A_IsSuspended==0){ 
		SetScrollLockState, On
		SoundBeep, 6000, 300
	}
Else{ SetScrollLockState, Off
}
}

;TO SUSPEND THE HOTKEY AND RESUME
~MButton & s::
	Suspend
	checkSuspend()
Return

;TO EXIT THE SCRIPT HOTKEY
~MButton & e::
	SetScrollLockState, Off
	SoundBeep, 100, 300
	ExitApp
Return

;TO RELOAD THE SCRIPT HOTKEY
~MButton & r::Reload
Return

;TO EDIT THE SCRIPT HOTKEY
~MButton & Ins::
	Edit
	checkSuspend()
Return




; NOTEPAD++ -------------------------------------------------------------------------------------------
#IfWinActive storm_spirit.ahk - Notepad++
~^S::
	; Reload, %A_ScriptDir%\\%A_ScriptName%
	Reload, A_ScriptFullPath
Return

; NOTEPAD ---------------------------------------------------------------------------------------------
#IfWinActive storm_spirit - Notepad
~^S::
	 ; Reload, %A_ScriptDir%\\%A_ScriptName%
	Reload, A_ScriptFullPath
Return

; SUBLIME TEXT ----------------------------------------------------------------------------------------
#IfWinActive storm_spirit.ahk - Sublime Text
~^S::
	Reload, A_ScriptFullPath
Return

; VISUAL STUDIO CODE ----------------------------------------------------------------------------------
#IfWinActive storm_spirit.ahk - Visual Studio Code
~^S::
	 ; Reload, %A_ScriptDir%\\%A_ScriptName%
	Reload, A_ScriptFullPath
Return




; DOTA 2 ----------------------------------------------------------------------------------------------
#IfWinActive ahk_exe dota2.exe
XButton2::
	SendInput, r
	; KeyWait, XButton2
	Sleep, 100 ;CAST_POINT
	SendInput, a
	SendInput, {LButton}
Return

r::
	SendInput, r
	SendInput, a
	SendInput, {LButton}
Return

XButton1::
	SendInput, xx
Return