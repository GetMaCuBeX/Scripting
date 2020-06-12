; ☞----------------------☜ [OPTIONS]
#Include %A_ScriptDir%\\Script\Options.ahk
; ☞----------------------☜ [FUNCTION] [TOOLTIP]
#Include %A_ScriptDir%\\Script\ToolTip.ahk
@ToolTipTimeOut_Specify_Global = -5000  ; Re-Assign value for Specified TimeOut
@ToolTipTimeOut_Default_Global = -2000  ; Re-Assign value for Default TimeOut
; ☞----------------------☜ [FUNCTIONS]
#Include %A_ScriptDir%\\Script\Functions.ahk
; ☞----------------------☜ [VARIABLES]
; ☞----------------------☜ [FILES]
Return
; ☞----------------------☜ [OPTIONS] [RETURN]




; ~^WheelDown::return
; ~^WheelUp::return
; #MaxHotkeysPerInterval 1000

; :*:11::
; FormatTime, OutputVar, , h:mm:ss tt
; MsgBox, %OutputVar%
; Return


; ☞----------------------☜ [HOTKEY] [PICHON COPY PASTE]
; ; PICHON COPY AND PASTE
; ;XButton2::
; Up::
; SendInput, {F2}
; SendInput, ^c
; SendInput, {Esc}
; Return

; ;XButton1::
; Down::
; SendInput, {F2}
; SendInput, ^v
; SendInput, {Enter}
; Return
; ☞----------------------☜ [HOTKEY] [THREADS]
; #MaxThreadsBuffer on
; #x::MsgBox, This hotkey will use this type of buffering.
; #y::MsgBox, And this one too.
; #MaxThreadsBuffer off
; #z::MsgBox, But not this one.
; ☞----------------------☜ [HOTKEY] [RUN FILE] [NETBEANS PROJECT]
; ~LButton & r::
; SendInput, +{F6}
; KeyWait, r
; Return
; ☞----------------------☜ [HOTKEY] [POWERTOYS] [SNAPPING]
; ~LButton & RButton::
; SendInput, {LShift Down}
; KeyWait, LButton
; SendInput, {LShift Up}
; Return
; ☞----------------------☜ [HOTKEY] [TASK VIEW] [MOVE ACTIVE WINDOW]
~LButton & XButton2::
  WinGetTitle, Title, A
  WinSet, ExStyle, ^0x80, %Title%
  SendInput, #^{Left}
  ; KeyWait, XButton2
  WinSet, ExStyle, ^0x80, %Title%
  WinActivate, %Title%
Return

~LButton & XButton1::
  WinGetTitle, Title, A
  WinSet, ExStyle, ^0x80, %Title%
  SendInput, #^{Right}
  ; KeyWait, XButton1
  WinSet, ExStyle, ^0x80, %Title%
  WinActivate, %Title%
Return
; ☞----------------------☜ [HOTKEY] []
; ☞----------------------☜ [HOTKEY] []
; ☞----------------------☜ [HOTKEY] []
; ☞----------------------☜ [HOTKEY] []
; ☞----------------------☜ [HOTKEY] []
; ☞----------------------☜ [HOTKEY] []
; ☞----------------------☜ [HOTKEY] []
; ☞----------------------☜ [HOTKEY] []
; ☞----------------------☜ [HOTKEY] []
; ☞----------------------☜ [HOTKEY] []
; ☞----------------------☜ [HOTKEY] []
; ☞----------------------☜ [HOTKEY] []
; ☞----------------------☜ [HOTKEY] []
; ===========================================================================================




; ===========================================================================================

; ===========================================================================================

; ===========================================================================================

; ===========================================================================================

; ===========================================================================================

; ===========================================================================================

; ===========================================================================================

; ===========================================================================================

; ===========================================================================================


; ☞----------------------☜ [HOTKEY] [EXIT APP]
#Include %A_ScriptDir%\\Script\ExitApp.ahk
