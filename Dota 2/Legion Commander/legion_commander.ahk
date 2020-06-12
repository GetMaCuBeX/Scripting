
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
Global CAST_POINT_TP = 3000
Global DOTA2_PING = 100


Global G_M_FX = 0
Global G_M_FY = 0
Global G_FOUND_IMAGE = False
;--------------------------------------------------------------------


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
#IfWinActive legion_commander.ahk - Notepad++
~^S::
	; Reload, %A_ScriptDir%\\%A_ScriptName%
	Reload, A_ScriptFullPath
Return

; NOTEPAD ---------------------------------------------------------------------------------------------
#IfWinActive legion_commander - Notepad
~^S::
	 ; Reload, %A_ScriptDir%\\%A_ScriptName%
	Reload, A_ScriptFullPath
Return

; SUBLIME TEXT ----------------------------------------------------------------------------------------
#IfWinActive legion_commander.ahk - Sublime Text
~^S::
	Reload, A_ScriptFullPath
Return

; VISUAL STUDIO CODE ----------------------------------------------------------------------------------
#IfWinActive legion_commander.ahk - Visual Studio Code
~^S::
	 ; Reload, %A_ScriptDir%\\%A_ScriptName%
	Reload, A_ScriptFullPath
Return



; DOTA 2 ----------------------------------------------------------------------------------------------
#IfWinActive ahk_exe dota2.exe
XButton2::
	; KeyWait, XButton2
	SendInput, {1}
	; SendInput, c+
	SendInput, !w
Return


; z::
; 	SendInput, c+r
; Return

r::
	; SendInput, ccccr
	SendInput, c+
	; SendInput, v
	; Sleep, 80	
	SendInput, r
Return

Space::
	; SendInput, t
	; SendInput, cc
	; SendInput, !w
	SendInput, n
Return



;---------------------------------- AUTO SKILL--------------------------------
Numpad0::
	MouseGetPos, X, Y
	function_search_for_image()	
	if (G_FOUND_IMAGE==True){
				
		SendInput, c
		Sleep, 50
		SendInput, r
		Sleep, 150
		; BlockInput, Off
		
		; function_search_for_image()	
		; BlockInput, On
		; SendInput, v
		; BlockInput, Off
		; Sleep, 5	
		
		;function_search_for_image()	
		; SendInput, b
		; Sleep, 5
		
		; MouseMove, %X%, %Y%
		; SendInput, {s}
		; SendInput, r
		G_FOUND_IMAGE:=!True
	}	
Return



function_search_for_image(){
		Loop
		{
			CoordMode, Pixel, Screen
			ImageSearch, FX, FY, 0, 0, 1920, 1080,  %A_ScriptDir%\\images\\Screen_20190409105132.png
			CenterImgSrchCoords("\images\Screen_20190409105132.png", FX, FY)

		}
		Until ErrorLevel = 0
		If ErrorLevel = 0
		{
		; SoundBeep, 6000, 300
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

; ---------------------------------- AUTO SKILL--------------------------------

