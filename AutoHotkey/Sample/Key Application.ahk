; =========================================================================================== [OPTIONS]
; #Include %A_ScriptDir%\\Script\Options.ahk
; =========================================================================================== [FUNCTION] [TOOLTIP]
; #Include %A_ScriptDir%\\Script\ToolTip.ahk
; @ToolTipTimeOut_Specify_Global = -5000  ; Re-Assign value for Specified TimeOut
; @ToolTipTimeOut_Default_Global = -2000  ; Re-Assign value for Default TimeOut
; =========================================================================================== [FUNCTIONS]
; #Include %A_ScriptDir%\\Script\Functions.ahk
; =========================================================================================== [FILES]
; #Include %A_ScriptDir%\\Script\Files.ahk
; SplitPath, file_ccleaner64, 	@ccleaner64_ext
; SplitPath, file_mspaint, 		@mspaint_ext
; SplitPath, file_notepad, 		@notepad_ext
; =========================================================================================== [VARIABLES]
; #Include %A_ScriptDir%\\Script\Variables.ahk
; =========================================================================================== [VARIABLES]
; COUNT = 0;
; Return
; =========================================================================================== [OPTIONS] [RETURN]


; =========================================================================================== [LABEL]
run_mspaint:
If (FileExist(file_mspaint)){
	Run, %file_mspaint%
	WinWait, Untitled - Paint
	WinActivate
	Sleep, 100
}
Return
; =========================================================================================== [LABEL]
run_background_ccleaner:
If (FileExist(file_ccleaner64))
	Run, %file_ccleaner64% /AUTO
Return
; =========================================================================================== [LABEL]
run_explorer:
	Run, %A_WinDir%\explorer.exe
Return
; =========================================================================================== [LABEL]
hide_tray_notification_icons:
	RegWrite, REG_DWORD, HKEY_CURRENT_USER, Software\Microsoft\Windows\CurrentVersion\Policies\Explorer, NoTrayItemsDisplay, 1
Return
; =========================================================================================== [LABEL]
show_tray_notificaiton_icons:
	RegWrite, REG_DWORD, HKEY_CURRENT_USER, Software\Microsoft\Windows\CurrentVersion\Policies\Explorer, NoTrayItemsDisplay, 0
Return
; =========================================================================================== [LABEL]
toggle_view_desktop_icons:
ControlGet, HWND_VAR, Hwnd, , SysListView321, ahk_class Progman
IsDesktopIconVisible := DllCall("IsWindowVisible", UInt, HWND_VAR)
If (IsDesktopIconVisible) 	;CHECK IF DESKTOP ICON IS VISIBLE
	WinHide, ahk_id %HWND_VAR% 	;HIDE DESKTOP ICON
Else
	WinShow, ahk_id %HWND_VAR% 	;SHOW DESKTOP ICON
Return
; =========================================================================================== [LABEL]
restart_windows_explorer:
	Run, taskkill /f /im explorer.exe
	WinWaitClose, ahk_exe explorer.exe
	Sleep, 1000
	Gosub, run_explorer
Return
; =========================================================================================== [LABEL]
; printscreen_automatic:
; Send, !{PrintScreen} 	; Alt + PrintScreen [Focus Window]
; IfWinExist, Untitled - Paint
; 	WinActivate
; Else
; Gosub, run_mspaint
; SendInput, ^v 	;PASTE
; Sleep, 50
; SendInput, ^s 	;SAVE
; WinWait, Save As
; COUNT +=1
; SendInput, %COUNT%
; Sleep, 5
; WinActivate, Save As
; SendInput, {Enter}
; WinWait, %COUNT% - Paint
; Sleep, 5
; CLOSE PAINT APP
; Process, Exist, %@mspaint_ext%
; If ErrorLevel 				; Process is [Present].
; 	Process, Close, %@mspaint_ext%
; Return
; =========================================================================================== [HOTKEY] [MULTIMEDIA CONTROLS]
~LWin & WheelUp::
	SendInput, {Volume_Up}
Return
~LWin & WheelDown::
	SendInput, {Volume_Down}
Return
~LWin & MButton::
	SendInput, {Volume_Mute}
Return
~LWin & Home::
	SendInput, {Browser_Home}
Return
~LWin & End::
	SendInput, {Browser_Stop}
Return
~LWin & Numpad6::
	SendInput, {Media_Next}
Return
~LWin & Numpad3::
	SendInput, {Media_Prev}
Return
~LWin & Numpad8::
	SendInput, {Media_Play_Pause}
Return
~LWin & Numpad2::
	SendInput, {Media_Stop}
Return
; =========================================================================================== [HOTKEY] [HIDE TRAY NOTIFICATION ICONS]
~AppsKey & NumpadDot::
~AppsKey & NumpadDel::
	Gosub, hide_tray_notification_icons
	Gosub, restart_windows_explorer
Return
; =========================================================================================== [HOTKEY] [SHOW TRAY NOTIFICATION ICONS]
~AppsKey & Numpad0::
~AppsKey & NumpadIns::
	Gosub, show_tray_notificaiton_icons
	Gosub, restart_windows_explorer
Return
; =========================================================================================== [HOTKEYS] [HIDE/SHOW DESKTOP ICONS]
~MButton::
if IsMouseOver_("ahk_class Progman") Or IsMouseOver_("ahk_class Shell_TrayWnd") Or IsMouseOver_("ahk_class DV2ControlHost")
	Gosub, toggle_view_desktop_icons
Return
; =========================================================================================== [HOTKEY] [RESTART WINDOWS EXPLORER]
^F5::
	KeyWait, F5
	Gosub, restart_windows_explorer
Return
; =========================================================================================== [HOTKEY] [PRINTSCREEN ACTIVE WINDOW]
; LWin & PrintScreen::
	; Gosub, printscreen_automatic
; Return
; =========================================================================================== [HOTKEY] [RUN CCLEANER APPLICATION IN BACKGROUND]
~Escape::
; IfWinActive, ahk_class Progman
if IsMouseOver_("ahk_class WorkerW") Or IsMouseOver_("ahk_class Progman") Or IsMouseOver_("ahk_class Shell_TrayWnd") Or IsMouseOver_("ahk_class Button"){
	Gosub, run_background_ccleaner
	; clipboard = ; CLEAR CLIPBOARD
}
Return
; =========================================================================================== [HOTKEY] [SWITCHING TASK VIEW] [RELATED HOTKEY AT THE BOTTOM]
; =========================================================================================== [HOTKEY] [TASK VIEW FORWARD]
~Alt & XButton2::
	Gosub, TaskViewLeft
	KeyWait, XButton2
Return
; LABEL <<------------------------<<<<
TaskViewLeft:
	SendInput, #^{Left}
Return
; =========================================================================================== [HOTKEY] [TASK VIEW BACKWARD]
~Alt & XButton1::
	Gosub, TaskViewRight
	KeyWait, XButton1
Return
; LABEL <<------------------------<<<<
TaskViewRight:
	SendInput, #^{Right}
Return
; =========================================================================================== [HOTKEY] [SET CURRENT WINDOW ALWAYS ON TOP] [TOGGLE]
~LButton & `::
; ~LControl & MButton::
	WinSet, AlwaysOnTop, , A
	Sleep, 200
Return
; =========================================================================================== [HOTKEY] [POWERTOYS] [FANCY ZONES]
~LButton & RButton::
	SendInput, {LShift Down}
	KeyWait, LButton
	SendInput, {LShift Up}
Return
; #MaxThreadsPerHotkey 2
; =========================================================================================== [HOTKEY] [DELETE PROCESS UNDER MOUSE CURSOR]
; ~MButton & Delete::
; 	Gosub, processclose_mousecursor
; 	KeyWait, Delete
; Return
; LABEL
; processclose_mousecursor:
; getval_W_ID_MC := GetWindowID_MC()
; If (getval_W_ID_MC != "") {
; 	wintitle_W_ID := " ahk_id " . getval_W_ID_MC

; 	wgetProcessName		:= GetWinGetCmd_(WinGet_ProcessName , wintitle_W_ID)
; 	wgetPID				:= GetWinGetCmd_(WinGet_PID , wintitle_W_ID)
; 	wgetID				:= GetWinGetCmd_(WinGet_ID , wintitle_W_ID)
;  	getval_WinTitle 	:= GetWindowTitle_IDorIDLast(wgetID)

; 	If not (IsProcessNameFound_List(wgetProcessName)) {
; 	; Delete process if it's not found in the exception list
; 		If (wgetProcessName != "") {
; 			ProcessClose_PN(wgetProcessName)	; Close all process with = to PN
; 		}
; 	; Else don't delete the process
; 	}
; }
; Return
; =========================================================================================== [HOTKEY] [PAUSE/RESUME]
; F12::
	; Pause
; Return
; =========================================================================================== [HOTKEY] [EXIT SCRIPT]
; F8::
	; ExitApp
; Return
; =========================================================================================== [HOTKEY] [EXIT APP]
; #Include %A_ScriptDir%\\Script\ExitApp.ahk

; =========================================================================================== [HOTKEY] [SWITCHING TASK VIEW]
; IsMouseOver_("ahk_class DV2ControlHost") or IsMouseOver_("ahk_class WorkerW") or IsMouseOver_("ahk_class Progman") or IsMouseOver_("ahk_class Shell_TrayWnd") or IsMouseOver_("ahk_class Button")
; #If IsMouseOver_("ahk_class WorkerW") or IsMouseOver_("ahk_class Progman") or IsMouseOver_("ahk_class Shell_TrayWnd") or IsMouseOver_("ahk_class Button")
; ; =========================================================================================== [HOTKEY] [TASK VIEW FORWARD]
; WheelUp::
; 	Gosub, TaskViewLeft
; Return
; WheelDown::
; 	Gosub, TaskViewRight
; Return
; =========================================================================================== [HOTKEY] [SET CURRENT WINDOW ALWAYS ON TOP] [TOGGLE]







