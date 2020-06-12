; ☞----------------------☜ [OPTIONS]
#Include %A_ScriptDir%\\Script\Options.ahk
; ☞----------------------☜ [FUNCTION] [TOOLTIP]
; #Include %A_ScriptDir%\\Script\ToolTip.ahk
; @ToolTipTimeOut_Specify_Global = -5000  ; Re-Assign value for Specified TimeOut
; @ToolTipTimeOut_Default_Global = -2000  ; Re-Assign value for Default TimeOut
; ☞----------------------☜ [FUNCTIONS]
; #Include %A_ScriptDir%\\Script\Functions.ahk
; ☞----------------------☜ [FILES]
; #Include %A_ScriptDir%\\Script\Files.ahk
; SplitPath, file_ccleaner64, 	@ccleaner64_ext
; SplitPath, file_mspaint, 		@mspaint_ext
; SplitPath, file_notepad, 		@notepad_ext
; ☞----------------------☜ [VARIABLES]
Toggle = 0
Return

#MaxThreadsPerHotkey 2
~RControl::
    Toggle := !Toggle
    While Toggle {
        SendInput, w
        Sleep, 500
    }
return


; ☞----------------------☜ [HOTKEY] [EXIT APP]
#Include %A_ScriptDir%\\Script\ExitApp.ahk
