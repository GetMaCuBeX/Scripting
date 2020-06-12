
#NoEnv  ; Recommended for performance and compatibility with future AutoHotkey releases.
#Warn  ; Enable warnings to assist with detecting common errors.
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


;---------------------DECLARING GLOBAL VARIABLES---------------------

Global G_CONSOLE_dota_hud_hide = true
Global G_CONSOLE_KEY = "/"

;--------------------------------------------------------------------


; POP UP MENU -----------------------------------------------------------------------------------------
; Create the popup menu by adding some items to it.
#Persistent  ; Keep the script running until the user exits it.
#SingleInstance
; Menu, MyMenu, Add, Dota Health Marker Hide, dhm_0
; Menu, MyMenu, Add, Dota HUD Toggle Visibility, dhud_1
; Menu, MyMenu, Add  ; Add a separator line.

Menu, Submenu1, Add, Hide, dhm_hide
Menu, Submenu1, Add, Default, dhm_default

Menu, Submenu2, Add, Hide, dhud_hide
Menu, Submenu2, Add, Show, dhud_show


Menu, Console, Add, Dota Health Marker, :Submenu1
Menu, Console, Add, Dota HUD, :Submenu2

; Menu, MyMenu, Add, Dota 2 Console, :Console

; Menu, MyMenu, Add  ; Add a separator line.
; Menu, MyMenu, Add, Exit, ExitHotkey


; MESSAGE MENU ----------------------------------------------------------------------------------------
Menu, Positioning, Add, Careful, Message_Team
Menu, Positioning, Add, Get Back, Message_Team
Menu, Positioning, Add, Stun now, Message_Team
Menu, Positioning, Add, Push now, Message_Team
Menu, Positioning, Add, Go, Message_Team
Menu, Positioning, Add, Follow me, Message_Team
Menu, Positioning, Add, Group Up, Message_Team
Menu, Positioning, Add, Split up and farm, Message_Team
Menu, Positioning, Add, Attack now, Message_Team
Menu, Positioning, Add, Be right back, Message_Team
Menu, Positioning, Add, Dive, Message_Team
Menu, Positioning, Add, On my way, Message_Team
Menu, Positioning, Add, Get ready, Message_Team
Menu, Positioning, Add, I'm retreating, Message_Team

Menu, Status, Add, Help, Message_Team
Menu, Status, Add, Heal, Message_Team
Menu, Status, Add, Mana, Message_Team
Menu, Status, Add, Out of mana, Message_Team
Menu, Status, Add, Skills on cooldown, Message_Team

Menu, Enemy, Add, All enemy heroes missing!, Message_Team
Menu, Enemy, Add, Enemy incoming!, Message_Team
Menu, Enemy, Add, Invisible enemy nearby, Message_Team
Menu, Enemy, Add, Enemy has rune, Message_Team

Menu, Lane, Add, Split push, Message_Team
Menu, Lane, Add, Coming to gank, Message_Team
Menu, Lane, Add, Requesting a gank, Message_Team
Menu, Lane, Add, Fight under the tower, Message_Team
Menu, Lane, Add, Destroy the tower then get back, Message_Team
Menu, Lane, Add, Destroy the barracks then get back, Message_Team

Menu, Items, Add, We need wards, Message_Team
Menu, Items, Add, Buy a courier please, Message_Team
Menu, Items, Add, We need detection, Message_Team
Menu, Items, Add, They have detection, Message_Team
Menu, Items, Add, Buy a Town Portal Scroll, Message_Team
Menu, Items, Add, Re-use courier, Message_Team
Menu, Items, Add, Deward please, Message_Team
Menu, Items, Add, Building Mekansm, Message_Team
Menu, Items, Add, Building Pipe of Insight, Message_Team
Menu, Items, Add, Let's smoke gank!, Message_Team
Menu, Items, Add, What should I buy?, Message_Team
Menu, Items, Add, Ward the buttom rune, Message_Team
Menu, Items, Add, Ward the top rune, Message_Team

Menu, Neutrals, Add, Stack and pull please, Message_Team
Menu, Neutrals, Add, Pull creeps please, Message_Team
Menu, Neutrals, Add, Stack neutrals, Message_Team
Menu, Neutrals, Add, Jungling, Message_Team
Menu, Neutrals, Add, Roshan, Message_Team

Menu, MSC, Add, Okay, Message_Team
Menu, MSC, Add, Affirmative, Message_Team
Menu, MSC, Add, Wait, Message_Team
Menu, MSC, Add, Please pause, Message_Team
; Menu, MSC, Add, Current Game Time, Message_Team
Menu, MSC, Add, Check runes please, Message_Team

Menu, Flavor, Add, Well played, Message_Team
Menu, Flavor, Add, Good luck. have fun, Message_Team
Menu, Flavor, Add, Nice, Message_Team
Menu, Flavor, Add, Thanks, Message_Team
Menu, Flavor, Add, Sorry, Message_Team
Menu, Flavor, Add, Don't give up, Message_Team
Menu, Flavor, Add, That just happened, Message_Team
Menu, Flavor, Add, Game is hard, Message_Team
Menu, Flavor, Add, New meta, Message_Team
Menu, Flavor, Add, My bad, Message_Team
Menu, Flavor, Add, I immediately regret my decision, Message_Team
Menu, Flavor, Add, Relax. you're doing fine, Message_Team
Menu, Flavor, Add, Good game, Message_Team
Menu, Flavor, Add, Good game. well played, Message_Team
Menu, Flavor, Add, Space Created, Message_Team
Menu, Flavor, Add, Whoops, Message_Team


Menu, message_team, Add, Position, :Positioning
Menu, message_team, Add, Status, :Status
Menu, message_team, Add, Enemy, :Enemy
Menu, message_team, Add, Lane, :Lane
Menu, message_team, Add, Items, :Items
Menu, message_team, Add, Neutrals, :Neutrals
Menu, message_team, Add  ; Add a separator line.
Menu, message_team, Add, MSC, :MSC
Menu, message_team, Add, Flavor, :Flavor

Menu, MessageMenu, Add, Message Team, :message_team


Menu, MyMenu, Add, Message Team, :message_team
Menu, MyMenu, Add  ; Add a separator line.
Menu, MyMenu, Add, Dota 2 Console, :Console

Menu, MyMenu, Add  ; Add a separator line.
Menu, MyMenu, Add, Exit, ExitHotkey



Return
; -----------------------------------------------------------------------------------------------------

; ~MButton & r::Reload
; Return


; TRAY AND MENU HANDLER -------------------------------------------------------------------------------
dhm_hide:
	set_dota_health_marker(0,0,0,0)
Return

dhm_default:
	set_dota_health_marker(128,0,225,96)
Return

dhud_hide:
	set_G_CONSOLE_dota_hud_hide(1)
Return
dhud_show:
	set_G_CONSOLE_dota_hud_hide(0)
Return

ExitHotkey:
	ExitApp
Return


; FUNCTIONS -------------------------------------------------------------------------------------------
set_dota_open_console(){
	SendInput, {ESC}
	Sleep, 50
	SendInput, %G_CONSOLE_KEY%	
	Sleep, 1000
	SendInput, ^{a}
	Sleep, 50
}
set_dota_console_delay(){
	Sleep, 50
	SendInput, {Enter}
}
set_dota_close_console(){
	Sleep, 500
	SendInput, {ESC}
}


set_dota_health_marker(a,b,c,d){
	set_dota_open_console()
	SendInput, dota_health_high_marker_major_alpha %a%
	set_dota_console_delay()
	SendInput, dota_health_high_marker_minor_alpha %b%
	set_dota_console_delay()
	SendInput, dota_health_marker_major_alpha %c%
	set_dota_console_delay()
	SendInput, dota_health_marker_minor_alpha %d%
	set_dota_console_delay()
	set_dota_close_console()
}

set_dota_dead_unit(){
	set_dota_open_console()
	SendInput, dota_dead_unit_disappear_time 0	;4.0 
	set_dota_console_delay()
	SendInput, dota_dead_unit_delete_time 0	;1
	set_dota_console_delay()
	set_dota_close_console()
}


set_G_CONSOLE_dota_hud_hide(num){
	set_dota_open_console()
	SendInput, dota_hud_hide_topbar %num%
	set_dota_console_delay()
	SendInput, dota_hud_hide_mainhud %num%
	set_dota_console_delay()
	SendInput, dota_hud_hide_minimap %num%
	set_dota_console_delay()
	set_dota_close_console()
	G_CONSOLE_dota_hud_hide:=!num
}



; NOTEPAD++ -------------------------------------------------------------------------------------------
#IfWinActive Dota 2 Console.ahk - Notepad++
~^S::
	; Reload, %A_ScriptDir%\\%A_ScriptName%
	Reload, A_ScriptFullPath
Return

; NOTEPAD ---------------------------------------------------------------------------------------------
#IfWinActive Dota 2 Consoles - Notepad
~^S::
	 ; Reload, %A_ScriptDir%\\%A_ScriptName%
	Reload, A_ScriptFullPath
Return

; SUBLIME TEXT ----------------------------------------------------------------------------------------
#IfWinActive Dota 2 Console.ahk - Sublime Text
~^S::
	Reload, A_ScriptFullPath
Return

; VISUAL STUDIO CODE ----------------------------------------------------------------------------------
#IfWinActive Dota 2 Consoles.ahk - Visual Studio Code
~^S::
	 ; Reload, %A_ScriptDir%\\%A_ScriptName%
	Reload, A_ScriptFullPath
Return


; DOTA 2 ----------------------------------------------------------------------------------------------
#IfWinActive ahk_exe dota2.exe
AppsKey::Menu, MyMenu, Show 
Return

; #LButton::Menu, MessageMenu, Show  ; i.e. press the Win-C hotkey to show the menu.
Message_Team:	
    ; SendInput, say_team %A_ThisMenuItem%
    SendInput, {Escape}  
    SendInput, %G_CONSOLE_KEY%
    SendInput, ^a 
    Sleep, 50
    SendInput, say_team %A_ThisMenuItem%{SPACE}
    Sleep, 50
    SendInput, {Enter}  
    SendInput, {Escape}  
Return


; ^Numpad1::
; 	if(G_CONSOLE_dota_hud_hide==true)
; 	set_G_CONSOLE_dota_hud_hide(1)
; 	else
; 	set_G_CONSOLE_dota_hud_hide(0)
; Return

; ^Numpad0::
; 	; set_dota_health_marker(128,0,225,96) ;default
; 	set_dota_health_marker(0,0,0,0)
; Return

; ^g::
; 	KeyWait, g, T0.1
; 	if (ErrorLevel) {
; 		SendInput, long
; 	}
; 	else {
; 		KeyWait, g, D T0.1
; 		if (ErrorLevel)
; 			SendInput, single	
; 		else
; 			SendInput, double	
; 	}
; 	KeyWait, g
; Return
  
  
  




	