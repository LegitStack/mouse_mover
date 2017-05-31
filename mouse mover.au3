#cs ----------------------------------------------------------------------------
1. q = dash melee
2. c = turn around
3. 05 mouse = turn left 90 degress
4. 06 mouse = melee, dash forward, turn around, shoot
#ce ----------------------------------------------------------------------------

#include <Misc.au3>
#include <AutoItConstants.au3>
#include <MsgBoxConstants.au3>
#Include <WinAPI.au3>

HotKeySet("{F1}", "Terminate")

;ResetTimer()
Global $wait = 10
Global $speed = 3
Global $x = 0
Global $hDLL = DllOpen("user32.dll")
Global $aPos = MouseGetPos()
Global $lastposa = MouseGetPos()
Global $lastposb = MouseGetPos()


   While 1
;	  If _IsPressed("01", $hDLL) Then ;leftshift
;		 If _IsPressed("44", $hDLL) Then ;d
;			MouseMove((@desktopwidth*.75),(@desktopheight/2),0)
;		 elseIf _IsPressed("41", $hDLL) Then ;a
;			MouseMove((@desktopwidth*.10),(@desktopheight/10),0)
;		 elseIf _IsPressed("53", $hDLL) Then ;s
;			MouseMove((@desktopwidth/4),(@desktopheight/2),0)
; 		 elseIf _IsPressed("46", $hDLL) Then ;f
;			MouseMove((@desktopwidth*.90),(@desktopheight/10),0)
;		 EndIf
;	  else
	  If _IsPressed("11", $hDLL) then
		 If _IsPressed("06", $hDLL) then
			MouseMove($lastposa[0],$lastposa[1],$speed)
			Sleep($wait)
		 elseIf _IsPressed("01", $hDLL) then ;left
			$aPos = MouseGetPos()
			If $lastposa[0] < $aPos[0] + 50 and $lastposa[0] > $aPos[0] - 50 and $lastposa[1] < $aPos[1] + 50 and $lastposa[1] > $aPos[1] - 50 Then
			Else
			   $lastposa = MouseGetPos()
			EndIf
			Sleep($wait)
		 EndIf

	  elseIf _IsPressed("12", $hDLL) then
		 If _IsPressed("06", $hDLL) then
			MouseMove($lastposb[0],$lastposb[1],$speed)
			Sleep($wait)
		 elseIf _IsPressed("01", $hDLL) then ;left
			$aPos = MouseGetPos()
			If $lastposb[0] < $aPos[0] + 50 and $lastposb[0] > $aPos[0] - 50 and $lastposb[1] < $aPos[1] + 50 and $lastposb[1] > $aPos[1] - 50 Then
			Else
			   $lastposb = MouseGetPos()
			EndIf
			Sleep($wait)
		 EndIf
	  ElseIf _IsPressed("06", $hDLL) then
		 $aPos = MouseGetPos()
		 If $aPos[0] > @desktopwidth*.55 and $aPos[1] > @DesktopHeight*.55 then
			MouseMove((@desktopwidth/2),(@desktopheight/2),$speed)

		 elseif $aPos[0] <= @desktopwidth*.45 and $aPos[1] > @DesktopHeight*.55 then
			MouseMove((@desktopwidth*.05),(@desktopheight*.10),$speed)

		 elseIf $aPos[0] <= @desktopwidth*.45 and $aPos[1] <= @DesktopHeight*.45 then
			MouseMove((@desktopwidth*.95),(@desktopheight*0.10),$speed)

		 elseIf $aPos[0] > @desktopwidth*.55 and $aPos[1] <= @DesktopHeight*.45 then
			MouseMove((@desktopwidth*.95),(@desktopheight*0.90),$speed)

		 ;elseIf $aPos[0] > @desktopwidth*.55 and $aPos[1] > @DesktopHeight*.5 then
		 else
			MouseMove((@desktopwidth*.05),(@desktopheight*0.90),$speed)

		 endif
		 Sleep($wait)
	  EndIf
   WEnd

Func Terminate()
 DllClose($hDLL)
   Exit
EndFunc

;Func ResetTimer()
;   Global $hTimer = TimerInit()
;EndFunc

;Func FindTimer()
;   Return TimerDiff($hTimer)
;EndFunc



;		 If FindTimer() < 5000 then
;			if $x == 0 Then
;			   MouseMove((@desktopwidth/2),(@desktopheight/2),$speed)
;			   $x = 1
;			elseif $x == 1 Then
;			   MouseMove((@desktopwidth*.05),(@desktopheight*.10),$speed)
;			   $x = 2
;			elseIf $x == 2 Then
;			   MouseMove((@desktopwidth*.95),(@desktopheight*0.10),$speed)
;			   $x = 3
;			elseIf $x == 3 Then
;			   MouseMove((@desktopwidth*.95),(@desktopheight*0.90),$speed)
;			   $x = 4
;			elseIf $x == 4 Then
;			   MouseMove((@desktopwidth*.05),(@desktopheight*0.90),$speed)
;			   $x = 0
;			endif
;			Sleep($wait)
;		 else
;			MouseMove((@desktopwidth/2),(@desktopheight/2),$speed)
;			$x = 1
;			Sleep($wait)
;		 EndIf
;		 ResetTimer()
