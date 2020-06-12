
#NoEnv  ; Recommended for performance and compatibility with future AutoHotkey releases.
#Warn  ; Enable warnings to assist with detecting common errors.
SendMode Input  ; Recommended for new scripts due to its superior speed and reliability.
SetWorkingDir %A_ScriptDir%  ; Ensures a consistent starting directory.

;#SingleInstance force       ;Skips the dialog box and replaces the old instance automatically, which is similar in effect to the Reload command.
#SingleInstance ignore     ;Skips the dialog box and leaves the old instance running. In other words, attempts to launch an already-running script are ignored.
;#SingleInstance off        ;Allows multiple instances of the script to run concurrently.

#WinActivateForce
SetTitleMatchMode 2
SetControlDelay 1
SetWinDelay 0
SetKeyDelay -1
SetMouseDelay -1
SetBatchLines -1


;---------------------DECLARING GLOBAL VARIABLES---------------------
Global G_TP_DURATION = 3000
Global G_ABBYSAL_BLADE_DURATION = 2000
Global G_BLADE_MAIL_DURATION = 4500
Global G_BLODDTHRON_DURATION = 500
Global G_DIFFUSAl_BLADE_DURATION = 4000
Global G_DRUM_OF_ENDURANCE_DURATION = 6000
Global G_EULS_SCEPTER_OF_DIVINITY_DURATION = 2500
Global G_ETHERAL_BLADE_DURATION = 500
Global G_GHOST_SCEPTER_DURATION = 500
Global G_GLIMMER_CAPE_DELAY = 600
Global G_GLIMMER_CAPE_DURATION = 5000
Global G_HEAVENS_HALBERD_DURATION_MELEE = 3000
Global G_HEAVENS_HALBERD_DURATION_RANGE = 5000
Global G_METEOR_HAMMER_CHANNEL_DURATION = 2500
Global G_METEOR_HAMMER_LANDING_TIME = 500
Global G_MJOLLNIR_DURATION = 15000
Global G_NULLIFIER_DURATION = 6000
Global G_ORCHED_MALEVOLENCE_DURATION = 5000
Global G_PHASE_BOOTS_DURATION = 3000
Global G_SILVER_EDGE_DURATION = 14000
Global G_SHADOW_BLADE_DURATION = 14000
Global G_SCYTHE_OF_VYSE_DURATION = 3500
Global G_PING = 100


Global G_M_FX = 0
Global G_M_FY = 0
Global G_FOUND_IMAGE = False


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
~MButton & Ins::s
	Edit
	checkSuspend()
Return





; NOTEPAD++ -------------------------------------------------------------------------------------------
#IfWinActive lion.ahk - Notepad++
~^S::
	; Reload, %A_ScriptDir%\\%A_ScriptName%
	Reload, A_ScriptFullPath
Return

; NOTEPAD ---------------------------------------------------------------------------------------------
#IfWinActive lion - Notepad
~^S::
	 ; Reload, %A_ScriptDir%\\%A_ScriptName%
	Reload, A_ScriptFullPath
Return

; SUBLIME TEXT ----------------------------------------------------------------------------------------
#IfWinActive lion.ahk - Sublime Text
~^S::
	Reload, A_ScriptFullPath
Return

; VISUAL STUDIO CODE ----------------------------------------------------------------------------------
#IfWinActive lion.ahk - Visual Studio Code
~^S::
	 ; Reload, %A_ScriptDir%\\%A_ScriptName%
	Reload, A_ScriptFullPath
Return


; DOTA 2 ----------------------------------------------------------------------------------------------
#IfWinActive ahk_exe dota2.exe
