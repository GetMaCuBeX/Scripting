; ☞----------------------☜ [OPTIONS]
#Include %A_ScriptDir%\\Script\Options.ahk
; ☞----------------------☜ [FUNCTION] [TOOLTIP]
#Include %A_ScriptDir%\\Script\ToolTip.ahk
; @ToolTipTimeOut_Specify_Global = -5000  ; Re-Assign value for Specified TimeOut
; @ToolTipTimeOut_Default_Global = -2000  ; Re-Assign value for Default TimeOut
; ☞----------------------☜ [FUNCTIONS]
#Include %A_ScriptDir%\\Script\Functions.ahk
; ☞----------------------☜ [FILES]
#Include %A_ScriptDir%\\Script\Files.ahk
; SplitPath, file_ccleaner64, 	@ccleaner64_ext
; SplitPath, file_mspaint, 		@mspaint_ext
; SplitPath, file_notepad, 		@notepad_ext
; ☞----------------------☜ [VARIABLES]

; ☞----------------------☜ [INITIALIZE]
SetTimer, MenuShow, On

Return

MenuShow:
	if IsMouseOver_("ahk_class Button") {
		ControlGet, HWND_VAR, Hwnd, , SysListView321, ahk_class DV2ControlHost
		IsDV2ControlHostVisible := DllCall("IsWindowVisible", UInt, HWND_VAR)
		If (!IsDV2ControlHostVisible) { 	;CHECK IF IT'S NOT VISIBLE
			SendInput, {LWin} 			;SHOW UP
		}
	}
Return


; ☞----------------------☜ [HOTKEY] [EXIT APP]
#Include %A_ScriptDir%\\Script\ExitApp.ahk

