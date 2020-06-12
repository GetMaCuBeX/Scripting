#NoEnv  ; Recommended for performance and compatibility with future AutoHotkey releases.
#Warn  ; Enable warnings to assist with detecting common errors.
SendMode Input  ; Recommended for new scripts due to its superior speed and reliability.
SetWorkingDir %A_ScriptDir%  ; Ensures a consistent starting directory.

;#SingleInstance force       ;Skips the dialog box and replaces the old instance automatically, which is similar in effect to the Reload command.
#SingleInstance ignore     ;Skips the dialog box and leaves the old instance running. In other words, attempts to launch an already-running script are ignored.
;#SingleInstance off        ;Allows multiple instances of the script to run concurrently.


Global G_M_FX = 0
Global G_M_FY = 0
Global G_FOUND_IMAGE = False

Global G_HERO_HEALTH_BAR = "Screen_20190409105132.png"
Global G_ITEM_LINKEN_ACTIVATED = "Screen_Linken_Activated.png"


; FUNCTIONS -------------------------------------------------------------------------------------------
checkSuspend()
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
#IfWinActive anti_set.ahk - Notepad++
~^S::
	; Reload, %A_ScriptDir%\\%A_ScriptName%
	Reload, A_ScriptFullPath
Return

; NOTEPAD ---------------------------------------------------------------------------------------------
#IfWinActive anti_set - Notepad
~^S::
	; Reload, %A_ScriptDir%\\%A_ScriptName%
	Reload, A_ScriptFullPath
Return

; SUBLIME TEXT ----------------------------------------------------------------------------------------
#IfWinActive anti_set.ahk - Sublime Text
~^S::
	Reload, A_ScriptFullPath
Return

; VISUAL STUDIO CODE ----------------------------------------------------------------------------------
#IfWinActive anti_set.ahk - Visual Studio Code
~^S::
	; Reload, %A_ScriptDir%\\%A_ScriptName%
	Reload, A_ScriptFullPath
Return


; FUNCTIONS -------------------------------------------------------------------------------------------
function_execute_auto_skill(){
	; SendInput, c+
	; SendInput, w		

	; SendInput, !x
	; Sleep, 50
	; SendInput, {s}
	; SendInput, r

	; MouseMove, %X%, %Y%
	G_FOUND_IMAGE:=!True	
	Reload, A_ScriptFullPath
}

function_linken_activated(){	
	SendInput, w
}

; DOTA 2 ----------------------------------------------------------------------------------------------
#IfWinActive ahk_exe dota2.exe
; z::
; 	SendInput, v+b+r
; Return

; RUNNING BACKGROUND
Numpad1::
	if(function_loop_is_item_activated(G_ITEM_LINKEN_ACTIVATED)==true)
	function_linken_activated()
	Reload, A_ScriptFullPath
Return

; RESET SCRIPT
Numpad0::
	Reload, A_ScriptFullPath
Return

; Space::
; 	; MouseGetPos, X, Y
; 	function_is_hero_health_bar_found()	
; 	if (G_FOUND_IMAGE==True){
; 		function_execute_auto_skill()
; 	}	
; Return

; AUTO SKILL ------------------------------------------------------------------------------------------
function_loop_is_item_activated(item){
		Loop
		{	
			; 1107, 937, 1308, 1041 ;ITEM 6 SLOTS
			CoordMode, Pixel, Screen
			ImageSearch, FX, FY, 1107, 937, 1308, 1041,  %A_ScriptDir%\\images\\%item%
		}
		Until ErrorLevel = 0
		If ErrorLevel = 0
		{
			Return true
		}
}


function_is_hero_health_bar_found(){
		Loop
		{
			; 219, 27, 1713, 1071
			; 0, 0, 1920, 1080
			CoordMode, Pixel, Screen
			ImageSearch, FX, FY, 0, 0, 1920, 1080,  %A_ScriptDir%\\images\\%G_HERO_HEALTH_BAR%
			CenterImgSrchCoords("\images\Screen_20190409105132.png", FX, FY)
		}
		Until ErrorLevel = 0
		If ErrorLevel = 0
		{
			; SET G_FOUND_IMAGE IF IMAGE IS FOUND
			G_FOUND_IMAGE := True

			SendInput, {s}

			G_M_FX := FX
			G_M_FY := FY

			If(G_M_FX > 960)
			{
				If(G_M_FX > 1080)
				{
					if(G_M_FX > 1200)
					{
						If(G_M_FX > 1320)
						{
							if(G_M_FX > 1440)
							{
								If(G_M_FX > 1560)
								{					
									if(G_M_FX > 1680)				
									{
											G_M_FX -= 25
									}else{
										G_M_FX -= 25
									}
								}else{
									G_M_FX -= 15
								}
							}else{
								G_M_FX += (G_M_FX // 250)
							}	
						}else{
							G_M_FX += (G_M_FX // 187.5)
						}
					}else{
						G_M_FX += (G_M_FX // 125)
					}
				}else{			
					G_M_FX += (G_M_FX // 63)
				}
			}else{
				if(G_M_FX < 840)
				{
					if(G_M_FX < 720)
					{
						if(G_M_FX < 600)
						{
							if(G_M_FX < 480)
							{
								if(G_M_FX < 360)
								{
									if(G_M_FX < 240)
									{
										if(G_M_FX < 120)
										{
												G_M_FX += 100
										}else{
											G_M_FX += (G_M_FX // 1.5)
										}
									}else{
										G_M_FX += (G_M_FX // 3)
									}	
								}else{						
									G_M_FX += (G_M_FX // 4.5)
								}			
							}else{
								G_M_FX += (G_M_FX // 6)
							}
						}else{
							G_M_FX += (G_M_FX // 9)
						}
					}else{
						G_M_FX += (G_M_FX // 12)
					}
				}else{
					G_M_FX += (G_M_FX // 18)
				}		
			}

			
			If(G_M_FY > 540)
			{
				if(G_M_FY > 607)
				{
					if(G_M_FY > 675)
					{
						if(G_M_FY > 742)
						{
							if(G_M_FY > 810)
							{			
								if(G_M_FY > 877)
								{
									if(G_M_FY > 945)				
									{
										G_M_FY += (G_M_FY // 64)
									}else{
										G_M_FY += (G_M_FY // 26)
									}
								}else{
									G_M_FY += (G_M_FY // 20)
								}
							}else{
								G_M_FY += (G_M_FY // 14)
							}	
						}else{
							G_M_FY += (G_M_FY // 12)
						}
					}else{
						G_M_FY += (G_M_FY // 7.5)
					}
				}else{
					G_M_FY += (G_M_FY // 7)
				}
			}else{
				if(G_M_FY < 472)
				{
					if(G_M_FY < 405)
					{
						if(G_M_FY < 337)
						{
							if(G_M_FY < 270)
							{
								if(G_M_FY < 202)
								{
									if(G_M_FY < 135)
									{
										if(G_M_FY < 68)
										{
											G_M_FY += (G_M_FY // 0.4)	
										}else{
											G_M_FY += (G_M_FY // 1)	
										}
									}else{
										G_M_FY += (G_M_FY // 1.7)
									}	
								}else{
									G_M_FY += (G_M_FY // 2.35)
								}
							}else{
								G_M_FY += (G_M_FY // 3)
							}
						}else{
							G_M_FY += (G_M_FY // 4)
						}
					}else{
						G_M_FY += (G_M_FY // 5)
					}
				}else{
					G_M_FY += (G_M_FY // 6)
				}		
			}	
			
			;SET THE MOUSE POSITION WHERE THE IMAGES IS FOUND
			SendEvent, {Click, %G_M_FX%, %G_M_FY%, 0}		
		}
}

CenterImgSrchCoords(File, ByRef CoordX, ByRef CoordY)
{
	static LoadedPic
	LastEL := ErrorLevel
	Gui, Pict:Add, Pic, vLoadedPic, %A_ScriptDir%%File%
	GuiControlGet, LoadedPic, Pict:Pos
	Gui, Pict:Destroy
	CoordX += LoadedPicW // 2
	CoordY += LoadedPicH // 2
	ErrorLevel := LastEL
}

; AUTO SKILL ------------------------------------------------------------------------------------------
