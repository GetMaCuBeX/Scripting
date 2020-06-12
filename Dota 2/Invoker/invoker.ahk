
#NoEnv  ; Recommended for performance and compatibility with future AutoHotkey releases.
#Warn  ; Enable warnings to assist with detecting common errors.
#InstallMouseHook

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


checkSuspend()

;---------------------DECLARING GLOBAL VARIABLES---------------------
Global CAST_POINT_TP = 3000
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


Global G_QUAX_LEVEL = 0
Global G_WEX_LEVEL = 0
Global G_EXORT_LEVEL = 0
Global G_AGHA = 0
;--------------------------------------------------------------------

; POP UP MENU -----------------------------------------------------------------------------------------
; Create the popup menu by adding some items to it.
#Persistent  ; Keep the script running until the user exits it.


Menu, QUAX, Add, 1, level_quax
Menu, QUAX, Add, 2, level_quax
Menu, QUAX, Add, 3, level_quax
Menu, QUAX, Add, 4, level_quax
Menu, QUAX, Add, 5, level_quax
Menu, QUAX, Add, 6, level_quax
Menu, QUAX, Add, 7, level_quax

Menu, WEX, Add, 1, level_wex
Menu, WEX, Add, 2, level_wex
Menu, WEX, Add, 3, level_wex
Menu, WEX, Add, 4, level_wex
Menu, WEX, Add, 5, level_wex
Menu, WEX, Add, 6, level_wex
Menu, WEX, Add, 7, level_wex

Menu, EXORT, Add, 1, level_exort
Menu, EXORT, Add, 2, level_exort
Menu, EXORT, Add, 3, level_exort
Menu, EXORT, Add, 4, level_exort
Menu, EXORT, Add, 5, level_exort
Menu, EXORT, Add, 6, level_exort
Menu, EXORT, Add, 7, level_exort


Menu, SKILLS, Add, QUAX LEVELS, :QUAX
Menu, SKILLS, Add, WEX LEVELS, :WEX
Menu, SKILLS, Add, EXORT LEVELS, :EXORT




Menu, MyMenu, Add, SKILLS, :SKILLS
Menu, MyMenu, Add  ; Add a separator line.
Menu, MyMenu, Add, AGHANIM'S YES, aga1
Menu, MyMenu, Add, AGHANIM'S NO, aga0

Menu, MyMenu, Add  ; Add a separator line.
Menu, MyMenu, Add, Exit, ExitHotkey

Menu, MyMenu, Check, AGHANIM'S NO	;SET CHECK
Return
; -----------------------------------------------------------------------------------------------------

; TRAY AND MENU HANDLER -------------------------------------------------------------------------------
level_quax:
	level_toggle_check()
	G_QUAX_LEVEL = %A_ThisMenuItem%
Return
level_wex:
	level_toggle_check()
	G_WEX_LEVEL = %A_ThisMenuItem%
Return
level_exort:
	level_toggle_check()
	G_EXORT_LEVEL = %A_ThisMenuItem%
Return

aga1:
	G_AGHA = 1
	agan_toggle_chech()
Return
aga0:
	G_AGHA = 0
	agan_toggle_chech()
Return

ExitHotkey:
	ExitApp
Return

agan_toggle_chech(){	
	Menu, %A_ThisMenu%, Uncheck, AGHANIM'S YES
	Menu, %A_ThisMenu%, Uncheck, AGHANIM'S NO
	Menu, %A_ThisMenu%, Check, %A_ThisMenuItem%
}


level_toggle_check(){
	Menu, %A_ThisMenu%, Uncheck, 1
	Menu, %A_ThisMenu%, Uncheck, 2
	Menu, %A_ThisMenu%, Uncheck, 3
	Menu, %A_ThisMenu%, Uncheck, 4
	Menu, %A_ThisMenu%, Uncheck, 5
	Menu, %A_ThisMenu%, Uncheck, 6
	Menu, %A_ThisMenu%, Uncheck, 7
	Menu, %A_ThisMenu%, Check, %A_ThisMenuItem%
}
; -----------------------------------------------------------------------------------------------------


;FUNCTIONS
checkSuspend(){
	If(A_IsSuspended=0){
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



; FUNCTIONS -------------------------------------------------------------------------------------------

set_qwe(){
	 SendInput, www
	; SendInput, eee
	; SendInput, eew
}

set_sleep(){
	Sleep, 300
}

set_Alacrity(){
	;SendInput, {1}
	SendInput, w
	SendInput, w
	SendInput, e
	SendInput, r
	;set_sleep()
}

set_Cataclysm(){
	SendInput, {1}
	SendInput, eee
	SendInput, r
	;set_sleep()
	set_qwe()
}

set_Cold_Snap(){
	;SendInput, {1}
	SendInput, qqq
	SendInput, r
	set_qwe()
}

set_Defeaning_Blast(){
	SendInput, {1}
	SendInput, qwe
	SendInput, r
	set_qwe()
}

set_EMP(){
	SendInput, {1}
	SendInput, w
	SendInput, w
	SendInput, w
	SendInput, r
	set_qwe()
}

set_Ghost_Walk(){
	SendInput, {1}
	SendInput, qqw
	SendInput, r
	SendInput, www
	set_sleep()
}

set_Ice_Wall(){
	SendInput, {1}
	SendInput, qqe
	SendInput, r
	set_qwe()
}

set_Meteor(){
	SendInput, {1}
	SendInput, eew
	SendInput, r
	set_qwe()
}

set_Summon(){
	SendInput, {1}
	SendInput, eeq
	SendInput, r
	set_sleep()
}

set_Sunstrike(){
	;SendInput, {1}
	SendInput, eee
	SendInput, r
	set_qwe()
}

set_Tornado(){
	SendInput, {1}
	SendInput, wwq
	SendInput, r
	set_qwe()
}





; NOTEPAD++ -------------------------------------------------------------------------------------------
#IfWinActive invoker.ahk - Notepad++
~^S::
	; Reload, %A_ScriptDir%\\%A_ScriptName%
	Reload, A_ScriptFullPath
Return

; NOTEPAD ---------------------------------------------------------------------------------------------
#IfWinActive invoker - Notepad
~^S::
	 ; Reload, %A_ScriptDir%\\%A_ScriptName%
	Reload, A_ScriptFullPath
Return

; SUBLIME TEXT ----------------------------------------------------------------------------------------
#IfWinActive invoker.ahk - Sublime Text
~^S::
	Reload, A_ScriptFullPath
Return

; VISUAL STUDIO CODE ----------------------------------------------------------------------------------
#IfWinActive invoker.ahk - Visual Studio Code
~^S::
	 ; Reload, %A_ScriptDir%\\%A_ScriptName%
	Reload, A_ScriptFullPath
Return




; DOTA 2 ----------------------------------------------------------------------------------------------
#IfWinActive ahk_exe dota2.exe
;^XButton1::Menu, MyMenu, Show 
;Return

;GHOST WALK
~RButton & LButton::
	set_Ghost_Walk()
	KeyWait, LButton
	SendInput, d
Return


;SUMMON 50ms
Tab::
	set_Summon()
	KeyWait, Tab
	;SendInput, d
	set_qwe()
Return


;DEFEANING BLAST 50ms
`::
	set_Defeaning_Blast()
Return


;TORNADO 50ms
2::
	set_Tornado()
	KeyWait, 2
Return


;METEOR 50ms
3::
	set_Meteor()
	KeyWait, 3
Return


;ALACRITY 50ms
WheelUp::
	set_Alacrity()
	Sleep, 50
	SendInput, !d
	Sleep, 50
	set_qwe()
Return
; ^XButton1::
; 	set_Alacrity()
; 	Sleep, 50
; 	SendInput, !d
; 	Sleep, 50
; 	set_qwe()
; Return



;ICE WALL 50ms
WheelDown::
	set_Ice_Wall()
	set_qwe()
Return
; ^XButton2::
; 	set_Ice_Wall()
; 	set_qwe()
; Return



;SUNSTRIKE 50ms
MButton::
	set_Sunstrike()
	KeyWait, MButton
Return
;SUNSTRIKE-AUTO 50ms
; ~LButton & d::
; 	set_Sunstrike()
; 	KeyWait, LButton	
; 	SendInput, d
; Return


;COLD SNAP 50ms
XButton2::
	set_Cold_Snap()
	KeyWait, XButton2
	Sleep, 50
	;SendInput, d
Return


;EMP 50ms
XButton1::
	set_EMP() 
	KeyWait, XButton1
	Sleep, 50
	;SendInput, d
Return


;CATACLYSM 50ms
~LButton & SPACE::
	set_Cataclysm()
	; KeyWait, SPACE
	Sleep, 50
	SendInput, !d	
	;set_Defeaning_Blast()
return


;REFRESHER
Numpad0::
	set_Cataclysm()
	KeyWait, Numpad0
	SendInput, !d	
	Sleep, 50
	SendInput, c ;REFRESHER ITEM
	Sleep, 100
	SendInput, !d ;CATACLYSM AGAIN
	Sleep, 50
	set_qwe()
	KeyWait, Numpad0
Return

/*
Space::
	SendInput, n
Return
*/

;CUSTOMIZED--------------------------------------------------------------------------------
/*
 $g::


; 	;set_Cold_Snap()
; 	;set_Defeaning_Blast()
; 	;set_Meteor()
; 	;set_Sunstrike()
; 	;set_Tornado()
 	SendInput, {c}

 	SendInput, {d}
; 	; Sleep, 400
 	SendInput, {f}
; 	; Sleep, 700
; 	; Sleep, 300
; 	; set_Defeaning_Blast()
; 	; Sleep, 100
; 	; SendInput, {d}
; 	; SendInput, {r}
; 	;  SendInput, {d}
 Return
*/

/*
;SINGLE, DOUBLE, LONG PRESSED
$g::
	KeyWait, g, T0.1
	if (ErrorLevel) {
		;SendInput, long
		SendInput, r
	}
	else {
		KeyWait, g, D T0.1
		if (ErrorLevel)
			;SendInput, single	
			SendInput, g	
		else
			;SendInput, double	
			SendInput, gg
	}
	KeyWait, r
	KeyWait, g
Return
*/

