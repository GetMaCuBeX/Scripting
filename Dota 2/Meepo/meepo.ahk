
#NoEnv  ; Recommended for performance and compatibility with future AutoHotkey releases.
;#Warn  ; Enable warnings to assist with detecting common errors.
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

; ---------------------DECLARING GLOBAL VARIABLES------------------------------------------------------
Global Clones = 0

Global G_M_FX = 0
Global G_M_FY = 0
Global G_FOUND_IMAGE = False
; -----------------------------------------------------------------------------------------------------


; POP UP MENU -----------------------------------------------------------------------------------------
; Create the popup menu by adding some items to it.
#Persistent  ; Keep the script running until the user exits it.
#SingleInstance

Menu, Submenu1, Add, 1 Meepo, meepo1
Menu, Submenu1, Add, 2 Meepo, meepo2
Menu, Submenu1, Add, 3 Meepo, meepo3
Menu, Submenu1, Add, 4 Meepo, meepo4
Menu, Submenu1, Add, 5 Meepo, meepo5
Menu, Submenu1, Add  ; Add a separator line.
Menu, Submenu1, Add, 6 Meepo, meepo6
Menu, Submenu1, Add, 7 Meepo, meepo7
Menu, MyMenu, Add, Total Meepo, :Submenu1

Menu, MyMenu, Add  ; Add a separator line.
Menu, MyMenu, Add, Exit, ExitHotkey

Menu, Submenu1, Check, 1 Meepo
Return

; TRAY AND MENU HANDLER -------------------------------------------------------------------------------
meepo1:	
	Clones = 0
	submenu1_toggle_check()
Return
meepo2:
	Clones = 1	
	submenu1_toggle_check()
Return
meepo3:
	Clones = 2	
	submenu1_toggle_check()	
Return
meepo4:
	Clones = 3
	submenu1_toggle_check()
Return
meepo5:
	Clones = 4
	submenu1_toggle_check()
Return
meepo6:
	Clones = 5
	submenu1_toggle_check()
Return
meepo7:
	Clones = 6
	submenu1_toggle_check()
Return

ExitHotkey:
	ExitApp
Return

submenu1_toggle_check(){
	Menu, Submenu1, Uncheck, 1 Meepo
	Menu, Submenu1, Uncheck, 2 Meepo
	Menu, Submenu1, Uncheck, 3 Meepo
	Menu, Submenu1, Uncheck, 4 Meepo
	Menu, Submenu1, Uncheck, 5 Meepo
	Menu, Submenu1, Uncheck, 6 Meepo
	Menu, Submenu1, Uncheck, 7 Meepo
	Menu, %A_ThisMenu%, Check, %A_ThisMenuItem%
	; MsgBox, %A_ScriptDir%
}


; FUNCTIONS -------------------------------------------------------------------------------------------
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
#IfWinActive meepo.ahk - Notepad++
~^S::
	; Reload, %A_ScriptDir%\\%A_ScriptName%
	Reload, A_ScriptFullPath
Return

; NOTEPAD ---------------------------------------------------------------------------------------------
#IfWinActive meepo - Notepad
~^S::
	 ; Reload, %A_ScriptDir%\\%A_ScriptName%
	Reload, A_ScriptFullPath
Return

; SUBLIME TEXT ----------------------------------------------------------------------------------------
#IfWinActive meepo.ahk - Sublime Text
~^S::
	Reload, A_ScriptFullPath
Return

; VISUAL STUDIO CODE ----------------------------------------------------------------------------------
#IfWinActive meepo.ahk - Visual Studio Code
~^S::
	 ; Reload, %A_ScriptDir%\\%A_ScriptName%
	Reload, A_ScriptFullPath
Return



; DOTA 2 ----------------------------------------------------------------------------------------------
#IfWinActive ahk_exe dota2.exe
^XButton1::
Menu, MyMenu, Show 
Return
						
XButton2::
	Loop, %Clones%
	{
		SendInput, {TAB}
		Send w
	}
	SendInput, {TAB}
Return

XButton1::
	SendInput, q
	SendInput, {TAB}
Return

c::
	SendInput, {1}
	SendInput, c
Return

; STOP ALL ATTEMPTS
; XButton1::
; Loop, %Clones%
; {
; SendInput, {TAB}
; SendInput, s
; }
; SendInput, {TAB}
; Return
