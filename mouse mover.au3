#cs ----------------------------------------------------------------------------
1. control + left click = set position 1
2. control + left click = set position 2
3. control + mouse6 click = goto position 1
4. control + mouse6 click = goto position 2
5. mouse6 = rotate around the screen
#ce ----------------------------------------------------------------------------

#include <Misc.au3>
#include <AutoItConstants.au3>
#include <MsgBoxConstants.au3>
#Include <WinAPI.au3>

HotKeySet("{F1}", "Terminate")

Global $wait = 10
Global $speed = 3
Global $x = 0
Global $hDLL = DllOpen("user32.dll")
Global $aPos = MouseGetPos()
Global $lastposa = MouseGetPos()
Global $lastposb = MouseGetPos()


   While 1

	  If _IsPressed("11", $hDLL) then
		 If _IsPressed("06", $hDLL) then
			MouseMove($lastposa[0],$lastposa[1],$speed)
			Sleep($wait)
		 elseIf _IsPressed("01", $hDLL) then
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
		 elseIf _IsPressed("01", $hDLL) then
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
