﻿
HotKeySet("^+t","TestingSet")						;Ctrl + Shilf + T 		- Trạng Thái Thử Nghiệm

Func TestingSet()
	$Testing = Not $Testing
	ToolTip("")
EndFunc


Func DShowTest()
	If Not $Testing Then Return
	Local $Text = ""
	$Text&= @CRLF
	$Text&= "$Spining:"&$Spining&@CRLF
	$Text&= "$SpinTime:"&$SpinTime&@CRLF
	$Text&= "$Lucky1:"&$Lucky1&@CRLF
	$Text&= "$Lucky2:"&$Lucky2&@CRLF
	$Text&= "$Lucky3:"&$Lucky3&@CRLF
	$Text&= "$BetPerTime:"&$BetPerTime&@CRLF
	$Text&= "$Credits:"&$Credits&@CRLF
	$Text&= "$Bet:"&$Bet&@CRLF
	$Text&= "$Win:"&$Win&@CRLF
	

	
	
	tooltip(@sec&@msec&" "&$Text,0,0)
	
EndFunc


Func DShowArray($array)
	Local $Text = ""
	
	For $i=0 To UBound($array)-1
		$Text&=$array[$i]&" "
	Next
	
	Return $Text
EndFunc

;~ Get Coord position in game
Func GameGetPost($Pos)
    Local $GamePos = WinGetPos($GameHandle)
    Local $GameGreen = WinGetClientSize ($GameHandle)
    Local $Span[2] = [$GameGreen[0] - $GamePos[2],$GameGreen[1] - $GamePos[3]]
   
    $Pos[0]+= $GamePos[0] - $Span[0]
    $Pos[1]+= $GamePos[1] - $Span[1]
   
    Return $Pos
EndFunc
 
;~ Kiểm tra tọa Coords của Game
Func ShowTextTest()
    If Not $GameHandle Then
        tooltip(@sec&@msec&" Chưa mở game",0,0)
;~         $GameHandle = WinGetHandle($GameTitle)
        Return
    EndIf
       
    Local $Text = ""
    Local $Mouse = MouseGetPos()
    Local $GamePos = WinGetPos($GameHandle)
    Local $GameGreen = WinGetClientSize ($GameHandle)
    Local $ControlPos[2]
    $ControlPos[0] = $Mouse[0] - $GamePos[0] + ($GameGreen[0] - $GamePos[2]) +4
    $ControlPos[1] = $Mouse[1] - $GamePos[1] + ($GameGreen[1] - $GamePos[3]) +4
   
    $Text&= @CRLF
    $Text&= "MousePos: "&$Mouse[0]&"/"&$Mouse[1]&@CRLF
    $Text&= "GamePos: "&$GamePos[0]&"/"&$GamePos[1]&@CRLF
    $Text&= "GameSize: "&$GamePos[2]&"/"&$GamePos[3]&@CRLF
    $Text&= "GameGreen: "&$GameGreen[0]&"/"&$GameGreen[1]&@CRLF
    $Text&= "Coords: "&$ControlPos[0]&"/"&$ControlPos[1]&@CRLF
   
	Return $Text
EndFunc