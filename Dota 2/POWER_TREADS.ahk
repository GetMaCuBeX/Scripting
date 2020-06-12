
#NoEnv  ; Recommended for performance and compatibility with future AutoHotkey releases.
#Warn  ; Enable warnings to assist with detecting common errors.
SendMode Input  ; Recommended for new scripts due to its superior speed and reliability.
SetWorkingDir %A_ScriptDir%  ; Ensures a consistent starting directory.

;#SingleInstance force       ;Skips the dialog box and replaces the old instance automatically, which is similar in effect to the Reload command.
#SingleInstance ignore     ;Skips the dialog box and leaves the old instance running. In other words, attempts to launch an already-running script are ignored.
;#SingleInstance off        ;Allows multiple instances of the script to run concurrently.


; INITIALIZE VARIABLES ---------------------------------------------------------------------------------

GLOBAL POWER_TREADS = "n"			; Location of Power Treads ITEM
GLOBAL HERO_ATTRIBUTE = "A"			; A = AGILITY		S = STRENGHT


; FUNCTIONS --------------------------------------------------------------------------------------------
checkSuspend()
checkSuspend(){
	If(A_IsSuspended==0){
		SetScrollLockState, On
		SoundBeep, 6000, 300
	}
Else{ SetScrollLockState, Off
}
}


; TO SUSPEND THE HOTKEY AND RESUME
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
#IfWinActive POWER_TREADS.ahk - Notepad++
~^S::
	; Reload, %A_ScriptDir%\\%A_ScriptName%
	Reload, A_ScriptFullPath
Return

; NOTEPAD ---------------------------------------------------------------------------------------------
#IfWinActive POWER_TREADS - Notepad
~^S::
	; Reload, %A_ScriptDir%\\%A_ScriptName%
	Reload, A_ScriptFullPath
Return

; SUBLIME TEXT ----------------------------------------------------------------------------------------
#IfWinActive POWER_TREADS.ahk - Sublime Text
~^S::
	Reload, A_ScriptFullPath
Return

; VISUAL STUDIO CODE ----------------------------------------------------------------------------------
#IfWinActive POWER_TREADS.ahk - Visual Studio Code
~^S::
	; Reload, %A_ScriptDir%\\%A_ScriptName%
	Reload, A_ScriptFullPath
Return



; DOTA 2 ----------------------------------------------------------------------------------------------
#IfWinActive ahk_exe dota2.exe
W::
	ATTRIBUTES("W",HERO_ATTRIBUTE)
Return

r::
	ATTRIBUTES("r",HERO_ATTRIBUTE)
Return


; FUNCTIONS -------------------------------------------------------------------------------------------
ATTRIBUTES(skill,attribute){
	if(attribute = "A"){
		AGILITY(skill)
	}
	if(attribute = "S"){
		STRENGTH(skill)
	}
}


AGILITY(skill){
	SendInput, %POWER_TREADS%
	SendInput, %POWER_TREADS%
	SendInput, %skill%
	Sleep, 50
	SendInput, %POWER_TREADS%
}


STRENGTH(skill){
	SendInput, %POWER_TREADS%
	SendInput, %skill%
	SendInput, %POWER_TREADS%
	SendInput, %POWER_TREADS%
}


