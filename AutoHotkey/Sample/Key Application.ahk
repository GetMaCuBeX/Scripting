; ☞----------------------☜ [LABEL]
run_mspaint:
	If (FileExist(file_mspaint)){
		Run, %file_mspaint%
		WinWait, Untitled - Paint
		WinActivate
		Sleep, 100
	}
Return
; ☞----------------------☜ [LABEL]
run_background_ccleaner:
If (FileExist(file_ccleaner64))
	Run, %file_ccleaner64% /AUTO
Return
; ☞----------------------☜ [LABEL]
run_explorer:
	Run, %A_WinDir%\explorer.exe
Return
; ☞----------------------☜ [LABEL]
hide_tray_notification_icons:
	RegWrite, REG_DWORD, HKEY_CURRENT_USER, Software\Microsoft\Windows\CurrentVersion\Policies\Explorer, NoTrayItemsDisplay, 1
Return
; ☞----------------------☜ [LABEL]
show_tray_notificaiton_icons:
	RegWrite, REG_DWORD, HKEY_CURRENT_USER, Software\Microsoft\Windows\CurrentVersion\Policies\Explorer, NoTrayItemsDisplay, 0
Return
; ☞----------------------☜ [LABEL]
toggle_view_desktop_icons:
	ControlGet, HWND_VAR, Hwnd, , SysListView321, ahk_class Progman
	IsDesktopIconVisible := DllCall("IsWindowVisible", UInt, HWND_VAR)
	If (IsDesktopIconVisible) 		; ☞----------------------☜ CHECK IF DESKTOP ICON IS VISIBLE
		WinHide, ahk_id %HWND_VAR% 	; ☞----------------------☜ HIDE DESKTOP ICON
	Else
		WinShow, ahk_id %HWND_VAR% 	; ☞----------------------☜ SHOW DESKTOP ICON
Return
; ☞----------------------☜ [LABEL]
restart_windows_explorer:
	Run, taskkill /f /im explorer.exe
	WinWaitClose, ahk_exe explorer.exe
	Sleep, 1000
	Gosub, run_explorer
Return
; ☞----------------------☜ [HOTKEY] [MULTIMEDIA CONTROLS]
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
; ☞----------------------☜ [HOTKEY] [HIDE TRAY NOTIFICATION ICONS]
~AppsKey & NumpadDot::
~AppsKey & NumpadDel::
	Gosub, hide_tray_notification_icons
	Gosub, restart_windows_explorer
Return
; ☞----------------------☜ [HOTKEY] [SHOW TRAY NOTIFICATION ICONS]
~AppsKey & Numpad0::
~AppsKey & NumpadIns::
	Gosub, show_tray_notificaiton_icons
	Gosub, restart_windows_explorer
Return
; ☞----------------------☜ [HOTKEYS] [HIDE/SHOW DESKTOP ICONS]
~MButton::
if IsMouseOver_("ahk_class Progman") Or IsMouseOver_("ahk_class Shell_TrayWnd") Or IsMouseOver_("ahk_class DV2ControlHost")
	Gosub, toggle_view_desktop_icons
Return
; ☞----------------------☜ [HOTKEY] [RESTART WINDOWS EXPLORER]
^F5::
	KeyWait, F5
	Gosub, restart_windows_explorer
Return
; ☞----------------------☜ [HOTKEY] [RUN CCLEANER APPLICATION IN BACKGROUND]
~Escape::
	if IsMouseOver_("ahk_class WorkerW") Or IsMouseOver_("ahk_class Progman") Or IsMouseOver_("ahk_class Shell_TrayWnd") Or IsMouseOver_("ahk_class Button"){
		Gosub, run_background_ccleaner
	}
Return
; ☞----------------------☜ [HOTKEY] [SWITCHING TASK VIEW] [RELATED HOTKEY AT THE BOTTOM]
; ☞----------------------☜ [HOTKEY] [TASK VIEW FORWARD]
~Alt & XButton2::
	Gosub, TaskViewLeft
	KeyWait, XButton2
Return
; ☞----------------------☜ [LABEL]
TaskViewLeft:
	SendInput, #^{Left}
Return
; ☞----------------------☜ [HOTKEY] [TASK VIEW BACKWARD]
~Alt & XButton1::
	Gosub, TaskViewRight
	KeyWait, XButton1
Return
; ☞----------------------☜ [LABEL]
TaskViewRight:
	SendInput, #^{Right}
Return
; ☞----------------------☜ [HOTKEY] [SET CURRENT WINDOW ALWAYS ON TOP] [TOGGLE]
~LButton & `::
	WinSet, AlwaysOnTop, , A
	Sleep, 200
Return
; ☞----------------------☜ [HOTKEY] [POWERTOYS] [FANCY ZONES]
~LButton & RButton::
	SendInput, {LShift Down}
	KeyWait, LButton
	SendInput, {LShift Up}
Return
