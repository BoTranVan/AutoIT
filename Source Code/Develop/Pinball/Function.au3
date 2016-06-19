﻿

;~ Hiệu chỉnh chế độ thử nghiệm
Func TestingSet()
	$Testing = Not $Testing
EndFunc

;~ Lưu các thông số trên GUI
Func SaveSetting()
	SaveGUIPos()
EndFunc

;~ Lưu vị trí GUI
Func SaveGUIPos()
	Local $Pos = WinGetPos($MainGUI)
	If $Pos[0] < 0 Or $Pos[1] < 0 Then Return
	IniWrite($DataFileName,"AutoPos","x",$Pos[0])
	IniWrite($DataFileName,"AutoPos","y",$Pos[1])
	Return $Pos
EndFunc

;~ Nạp các thông số của Auto lưu ở file
Func LoadSetting()
	LoadGUIPos()
EndFunc

;~ Nạp vị trí GUI
Func LoadGUIPos()
	$AutoPos[0] = IniRead($DataFileName,"AutoPos","x",$AutoPos[0])
	$AutoPos[1] = IniRead($DataFileName,"AutoPos","y",$AutoPos[1])
EndFunc


;~ Xóa ToolTip
Func ToolTipDel()
	ToolTip("")
EndFunc


;~ Mở vùng nhớ của Game
Func GameOpenMemory()
	Global $GameHandle
	$iv_Pid = WinGetProcess($GameHandle)
	$GameMem = _MemoryOpen($iv_Pid)
EndFunc

;~ Kiểm sự tồn tại của Game
Func CheckGame()
	If $GameHandle Then 
		If WinExists($GameTitle) Then Return
	EndIf
		
	If WinExists($GameTitle) Then
		$GameHandle = WinGetHandle($GameTitle)
		GameOpenMemory()
		Waring_LSet("Đã tìm thấy game")
		
		;Cái này giúp game luôn Active khi send
		SendKeepActive ($GameHandle )
	Else
		$GameHandle = 0
		$GameMem = 0
		Waring_LSet("Không tìm thấy game")
	EndIf
EndFunc


;~ Lấy số vàng trong Game
Func GameGetScores()
	If Not $GameHandle Then Return "#"
	Return _MemoryRead($GoldAd, $GameMem)
EndFunc
	
;~ Lấy chỉ số CurHP của Nhân Vật trong Game
Func GameGetCurHP()
	If Not $GameHandle Then Return "#"
	Return _MemoryRead($CurHPAd, $GameMem)
EndFunc

	
;~ Lấy chỉ số MaxHP của Nhân Vật trong Game
Func GameGetMaxHP()
	If Not $GameHandle Then Return "#"
	Return _MemoryRead($MaxHPAd, $GameMem)
EndFunc

;Tự send 1 phím vào Windown đang active
Func GameSend($Key)
	Send("{"&$Key&"}")
EndFunc

;Tự chơi game pinball
Func GameAutoPlay()
	If Not $GameHandle Then Return
	GameSend("/")
	GameSend("z")
EndFunc




