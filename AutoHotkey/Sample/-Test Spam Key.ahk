; =========================================================================================== [OPTIONS]
#Include %A_ScriptDir%\\Script\Options.ahk
; =========================================================================================== [FUNCTION] [TOOLTIP]
#Include %A_ScriptDir%\\Script\ToolTip.ahk
; @ToolTipTimeOut_Specify_Global = -5000  ; Re-Assign value for Specified TimeOut
; @ToolTipTimeOut_Default_Global = -2000  ; Re-Assign value for Default TimeOut
; =========================================================================================== [FUNCTIONS]
#Include %A_ScriptDir%\\Script\Functions.ahk
; =========================================================================================== [FILES]
#Include %A_ScriptDir%\\Script\Files.ahk
; SplitPath, file_ccleaner64, 	@ccleaner64_ext
; SplitPath, file_mspaint, 		@mspaint_ext
; SplitPath, file_notepad, 		@notepad_ext
; =========================================================================================== [VARIABLES]

; =========================================================================================== [INITIALIZE]/*  */
Hotkey, ~RControl,  Off 		; Disable Hotkey
Return


~RControl & RShift::
KeyWait, RShift
	SetTimer, SpamKey, 200
	Hotkey, ~RControl,  On 		; Enable Hotkey
Return


~RControl::
KeyWait, RControl
	Hotkey, ~RControl,  Off
	SetTimer, SpamKey, Off
Return


SpamKey:
SendInput, {LButton}
Return



; =========================================================================================== [HOTKEY] [EXIT APP]
#Include %A_ScriptDir%\\Script\ExitApp.ahk
