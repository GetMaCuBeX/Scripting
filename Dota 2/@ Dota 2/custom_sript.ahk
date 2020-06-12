; ! Alt::
; +	Shift::
; ^	Ctrl::
; #	Win::
; ~Numpad0 & Numpad1::	MsgBox You pressed Numpad1 while holding down Numpad0.


; MOUSE
; LButton::
; RButton::
; MButton::
; XButton2:: or 5th mouse button or Browser_Forward
; XButton1:: or 4th mouse button or Browser_Back
; WheelUp::
; WheelDown::



; LCtrl:: or <^::
; RCtrl:: or >^::
; LWin:: or <#::
; RWin:: or >#::
; LAlt:: or <!::
; RAlt:: or >!::


; Numpad0::
; NumpadDot::
; NumLock::
; NumpadDiv::
; NumpadMult::
; NumpadAdd::
; NumpadSub::
; NumpadEnter::


#NoEnv  ; Recommended for performance and compatibility with future AutoHotkey releases.
#Warn  ; Enable warnings to assist with detecting common errors.
SendMode Input  ; Recommended for new scripts due to its superior speed and reliability.
SetWorkingDir %A_ScriptDir%  ; Ensures a consistent starting directory.

;#SingleInstance force       ;Skips the dialog box and replaces the old instance automatically, which is similar in effect to the Reload command.
#SingleInstance ignore     ;Skips the dialog box and leaves the old instance running. In other words, attempts to launch an already-running script are ignored.
;#SingleInstance off        ;Allows multiple instances of the script to run concurrently.


SetScrollLockState, On
SoundBeep, 6000, 300

;FUNCTIONS
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
#IfWinActive custom_script.ahk - Notepad++
~^S::
	; Reload, %A_ScriptDir%\\%A_ScriptName%
	Reload, A_ScriptFullPath
Return

; NOTEPAD ---------------------------------------------------------------------------------------------
#IfWinActive custom_script - Notepad
~^S::
	; Reload, %A_ScriptDir%\\%A_ScriptName%
	Reload, A_ScriptFullPath
Return

; SUBLIME TEXT ----------------------------------------------------------------------------------------
#IfWinActive custom_script.ahk - Sublime Text
~^S::
	Reload, A_ScriptFullPath
Return

; VISUAL STUDIO CODE ----------------------------------------------------------------------------------
#IfWinActive custom_script.ahk - Visual Studio Code
~^S::
	; Reload, %A_ScriptDir%\\%A_ScriptName%
	Reload, A_ScriptFullPath	
Return



; DOTA 2 ----------------------------------------------------------------------------------------------
#IfWinActive ahk_exe dota2.exe
/*
;LASTHITS
~$s:: ;This helps with button mashing the s key for timing last hits.
    While GetKeyState("s", "P"){
        If (FnChatBoxIsOn())
            Return
        Send s
        Sleep 50  ;  milliseconds
    }
return

fnChatBoxIsOn()
{   ; put in some chat box detection code.
    ; that might be done by using a fixed pixel position
    ; and color that uniquely identifies the chat box when
    ; when it's present on the screen.
    ; If it's present you can return 1 or return 0 if not present.
}
*/

/*
XButton1::
sleep,200
sendinput, {enter}
sleep,200
send, -refresh
sleep,200

keywait, XButton1
sendinput, {enter}
Return
*/






CoordMode, Mouse, Window
SendMode Input
SetTitleMatchMode 2
#WinActivateForce
SetControlDelay 1
SetWinDelay 0
SetKeyDelay -1
SetMouseDelay -1
SetBatchLines -1

WheelDown::
;---------------------------------- AUTO SKILL
;dota_health_marker_major_alpha 0
;dota_health_marker_minor_alpha 0
Loop
{
    CoordMode, Pixel, Screen
    ImageSearch, FX, FY, 97, 52, 1821, 914, C:\Users\MCBX\AppData\Roaming\MacroCreator\Screenshots\Screen_20190409105132.png
    CenterImgSrchCoords("C:\Users\MCBX\AppData\Roaming\MacroCreator\Screenshots\Screen_20190409105132.png", FX, FY)
}
Until ErrorLevel = 0
If ErrorLevel = 0
{
    Send, {s}
    FX += 50
    FY += 70
	BlockInput On
    SendEvent, {Click, %FX%, %FY%, 0}
    ;Sleep, 10
    Send, z
    Send, c
    Send, v
    ;Click, Right, 1
    /*{x}{q}
    Sleep, 400
    Send, {r}
    */
	;MouseMove, %X%, %Y%
	BlockInput Off
}
;----------------------------------
Return


CenterImgSrchCoords(File, ByRef CoordX, ByRef CoordY)
{
	static LoadedPic
	LastEL := ErrorLevel
	Gui, Pict:Add, Pic, vLoadedPic, %File%
	GuiControlGet, LoadedPic, Pict:Pos
	Gui, Pict:Destroy
	CoordX += LoadedPicW // 2
	CoordY += LoadedPicH // 2
	ErrorLevel := LastEL
}