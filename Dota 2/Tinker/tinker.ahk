
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
Global G_ABBYSAL_BLADE_DURATION = 2000
Global G_BLADE_MAIL_DURATION = 4500
Global G_BLODDTHRON_DURATION = 500
Global G_DIFFUSAl_BLADE_DURATION = 4000
Global G_DRUM_OF_ENDURANCE_DURATION = 6000
Global G_EULS_SCEPTER_OF_DIVINITY_DURATION = 2500
Global G_ETHERAL_BLADE_DURATION = 500
Global G_GHOST_SCEPTER_DURATION = 500
Global G_GLIMMER_CAPE_DELAY = 600
Global G_GLIMMER_CAPE_DURATION = 5000
Global G_HEAVENS_HALBERD_DURATION_MELEE = 3000
Global G_HEAVENS_HALBERD_DURATION_RANGE = 5000
Global G_METEOR_HAMMER_CHANNEL_DURATION = 2500
Global G_METEOR_HAMMER_LANDING_TIME = 500
Global G_MJOLLNIR_DURATION = 15000
Global G_NULLIFIER_DURATION = 6000
Global G_ORCHED_MALEVOLENCE_DURATION = 5000
Global G_PHASE_BOOTS_DURATION = 3000
Global G_SILVER_EDGE_DURATION = 14000
Global G_SHADOW_BLADE_DURATION = 14000
Global G_SCYTHE_OF_VYSE_DURATION = 3500
Global G_PING = 100
Global G_TP_DURATION = 3000


Global G_CAST_POINT_LASER = 400
Global G_CAST_POINT_MARCH_OF_THE_MACHINES = 530
Global G_CAST_POINT_TIME_TO_REARM = 3000

Global G_CAST_BACKSWING_HEAL_SEEKING_MISSILE = 1200
Global G_CAST_BACKSWING_LASER = 1000
Global G_CAST_BACKSWING_MARCH_OF_THE_MACHINES = 630
Global G_CAST_BACKSWING_REARM = 530

Global G_M_FX = 0
Global G_M_FY = 0
Global G_FOUND_IMAGE = False


Global G_is_hunting = False


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
#IfWinActive tinker.ahk - Notepad++
~^S::
	; Reload, %A_ScriptDir%\\%A_ScriptName%
	Reload, A_ScriptFullPath
Return

; NOTEPAD ---------------------------------------------------------------------------------------------
#IfWinActive tinker - Notepad
~^S::
	 ; Reload, %A_ScriptDir%\\%A_ScriptName%
	Reload, A_ScriptFullPath
Return

; SUBLIME TEXT ----------------------------------------------------------------------------------------
#IfWinActive tinker.ahk - Sublime Text
~^S::
	Reload, A_ScriptFullPath
Return

; VISUAL STUDIO CODE ----------------------------------------------------------------------------------
#IfWinActive tinker.ahk - Visual Studio Code
~^S::
	 ; Reload, %A_ScriptDir%\\%A_ScriptName%
	Reload, A_ScriptFullPath
Return


; DOTA 2 ----------------------------------------------------------------------------------------------
#IfWinActive ahk_exe dota2.exe
!Numpad1::	
	G_CAST_POINT_TIME_TO_REARM := 3000
Return

!Numpad2::
	G_CAST_POINT_TIME_TO_REARM := 1500
Return

!Numpad3::
	G_CAST_POINT_TIME_TO_REARM := 750
Return


XButton2::
	; SendInput, z+
	funciton_ITEM_THEN_REARM()

Return


;XButton1::
	; SendInput, !b
	; SendInput, b
;Return

XButton1::
	; SendInput, +{XButton2}+
	; SendInput, q+
	; SendInput, !2
	; SendInput, {Escape}+
	; Sleep, 100
	SendInput, !b
Return


WheelDown::
	; SendInput, b+
	; SendInput, c+
	; SendInput, v+
	funciton_TP_TO_FOUNTAIN()
	funciton_ITEM_THEN_REARM()
Return

; `::
; 	; funciton_TP_TO_FOUNTAIN()
; 	; funciton_ITEM_THEN_REARM()
; Return


function_hunting2(){
	SendInput, {ShiftDown}
	SendInput, w
	SendInput, c
	SendInput, v
	SendInput, b

	SendInput, q
	SendInput, {ShiftUp}
}


function_hunting(){
	SendInput, w+
	SendInput, c+
	SendInput, v+
	; SendInput, b+
	; SendInput, !b+
	
	;Sleep, 400
	SendInput, q+
}

Numpad0::
	G_is_hunting := False
Return

Numpad1::
	G_is_hunting := True
Return

z::	
	if(G_is_hunting = True){
		function_hunting()		
	}

	SendInput, z
	
	; SendInput, b+
	; SendInput, !b+
Return



; `::
; 	; funciton_TP_TO_FOUNTAIN()
; 	; funciton_ITEM_THEN_REARM()
; Return

2::
	SendInput, v
Return

3::
	SendInput, b
Return

Space::
	; SendInput, t
	SendInput, n
Return

; $Space::
;  		KeyWait, Space	
; 		KeyWait, Space, D T0.1
; 		if (ErrorLevel)
; 		{
; 			SendInput, n ;SendInput, single	
; 		}
; 		else
; 		{
; 			SendInput, nn ;SendInput, double
; 			; funciton_TP_TO_FOUNTAIN()
; 			; funciton_ITEM_THEN_REARM()	
; 		}
; Return

; Space::
; 	KeyWait, Space, T0.100
; 	if (ErrorLevel) {
; 		;SendInput, n 
; 		SendInput, long
; 	}
; 	else {
; 		KeyWait, Space, D T0.100
; 		if (ErrorLevel)
; 			SendInput, n ;SendInput, single	
; 		else
; 			SendInput, nn ;SendInput, double	
; 	}
; 	;KeyWait, Space
; Return


; FUNCTIONS -------------------------------------------------------------------------------------------
funciton_TP_TO_FOUNTAIN(){
	SendInput, !n+
	; Sleep, %G_TP_DURATION%
}

funciton_ITEM_THEN_REARM(){	
	SendInput, c+
	SendInput, v+
	SendInput, b+
	SendInput, r
	; Sleep, %G_CAST_POINT_TIME_TO_REARM%
}




;---------------------------------- AUTO SKILL--------------------------------
Numpad5::
	; MouseGetPos, X, Y
	function_search_for_image()	
	if (G_FOUND_IMAGE==True){
				
		SendInput, w+

		; BlockInput, On
		; SendInput, z
		; BlockInput, Off
		; Sleep, 5

		function_search_for_image()	
		; BlockInput, On
		SendInput, z+
		; BlockInput, Off

		function_search_for_image()	
		; BlockInput, On
		SendInput, c+
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
		SoundBeep, 6000, 300
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

