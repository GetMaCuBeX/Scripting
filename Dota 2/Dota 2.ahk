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

; TO EXIT THE SCRIPT HOTKEY
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
#IfWinActive Dota 2.ahk - Notepad++
~^S::
	; Reload, %A_ScriptDir%\\%A_ScriptName%
	Reload, A_ScriptFullPath
Return

; NOTEPAD ---------------------------------------------------------------------------------------------
#IfWinActive Dota 2 - Notepad
~^S::
	; Reload, %A_ScriptDir%\\%A_ScriptName%
	Reload, A_ScriptFullPath
Return

; SUBLIME TEXT ----------------------------------------------------------------------------------------
#IfWinActive Dota 2.ahk - Sublime Text
~^S::
	Reload, A_ScriptFullPath
Return

; VISUAL STUDIO CODE ----------------------------------------------------------------------------------
#IfWinActive Dota 2.ahk - Visual Studio Code
~^S::
	; Reload, %A_ScriptDir%\\%A_ScriptName%
	Reload, A_ScriptFullPath
Return


; DOTA 2 ----------------------------------------------------------------------------------------------
#IfWinActive ahk_exe dota2.exe
; XButton2::
	; SendInput, !c
	; SendInput, !v
	; SendInput, !z
	; SendInput, !n
	; SendInput, {F9}
; Return

; XButton1::
; 	SendInput, !c
; Return


Space::
	; SendInput, {Space}	
	; SendInput, !n	
	; SendInput, n	
	; SendInput, q
	; SendInput, t
	 SendInput, f
Return


; ITEM -------------------------------------

; z::
	; SendInput, !c
	; SendInput, z
; Return

; c::
; 	SendInput, cvb
; Return

; SKILL -------------------------------------

; q::
; 	SendInput, cqv	
; Return

; w::
; 	SendInput, wcvb	
; 	SendInput, !w
; Return

; e::
; 	SendInput, nn
; 	SendInput, cve
; Return

; r::
; 	SendInput, wr
; Return


