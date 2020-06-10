; =========================================================================================== [OPTIONS]
#Include %A_ScriptDir%\\Script\Options.ahk
; =========================================================================================== [FUNCTION] [TOOLTIP]
#Include %A_ScriptDir%\\Script\ToolTip.ahk
; =========================================================================================== [FUNCTIONS]
#Include %A_ScriptDir%\\Script\Functions.ahk
; =========================================================================================== [FILES]
#Include %A_ScriptDir%\\Script\Files.ahk
; =========================================================================================== [VARIABLES]
#Include %A_ScriptDir%\\Script\Variables.ahk
; =========================================================================================== [VARIABLES]
; =========================================================================================== [VARIABLES]
; =========================================================================================== [VARIABLES]
MOUSE_SPEED_CURRENT = null
MOUSE_SPEED_SPECIFIED = 1
TOGGLE_SECONDARY_SPEED = TRUE
Return
; =========================================================================================== [INCLUDE CODE FROM OTHER FILES]
#Include %A_ScriptDir%\Key Application.ahk
; =========================================================================================== [INCLUDE CODE FROM OTHER FILES]
#Include %A_ScriptDir%\Key Mouse Speed.ahk
; =========================================================================================== [HOTKEY] [EXIT HOTKEY APPS]
; #Include %A_ScriptDir%\\Script\ExitApp.ahk
; =========================================================================================== [INCLUDE CODE FROM OTHER FILES]
#Include %A_ScriptDir%\Key Remapping.ahk
#If IsMouseOver_("ahk_class WorkerW") or IsMouseOver_("ahk_class Progman") or IsMouseOver_("ahk_class Shell_TrayWnd") or IsMouseOver_("ahk_class Button")
; =========================================================================================== [HOTKEY] [TASK VIEW FORWARD]
WheelUp::
	Goto, TaskViewLeft
Return
WheelDown::
	Goto, TaskViewRight
Return
