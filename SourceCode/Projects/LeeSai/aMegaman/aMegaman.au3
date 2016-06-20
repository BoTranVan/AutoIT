﻿#Region ;**** Directives created by AutoIt3Wrapper_GUI ****
#AutoIt3Wrapper_Icon=icon.ico
#EndRegion ;**** Directives created by AutoIt3Wrapper_GUI ****
#include-once

Opt("GUICloseOnESC",0)

;~ #include "Array.au3"
#include "UDF/GEngin.au3"

#include "GlobalVar.au3"
#include "FileInstall.au3"
#include "SaiTest.au3"
#include "GUI/GUI.au3"
#include "Tray.au3"
#include "Functions.au3"

HotKeySet("^+{del}","FToolTipDel")
HotKeySet("+{esc}","FAutoEnd")

_GEng_Start($AutoName, $CharWidth, $CharHeight,$CharBornPos[0],$CharBornPos[1], $WS_POPUP+$DS_MODALFRAME, $WS_EX_LAYERED+$WS_EX_TOOLWINDOW+$WS_EX_WINDOWEDGE)
FCharOnTop()

FAutoStart()

While 1
;~ 	_GEng_ScrFlush(-1)

	Sleep(72)
	FAutoPause()
;~ 	STShow()

	FCharGetInfo()
	FCharLiving()

	_GEng_Sprite_Draw($mm1obj)

	_GEng_ScrUpdatePNG()
WEnd


;~ Danh sách giá trị bị thiếu của hàm: _WinAPI_BitBlt
;~ SRCCOPY     = 0x00CC0020,
;~ SRCPAINT    = 0x00EE0086,
;~ SRCAND      = 0x008800C6,
;~ SRCINVERT   = 0x00660046,
;~ SRCERASE    = 0x00440328,
;~ NOTSRCCOPY  = 0x00330008,
;~ NOTSRCERASE = 0x001100A6,
;~ MERGECOPY   = 0x00C000CA,
;~ MERGEPAINT  = 0x00BB0226,
;~ PATCOPY     = 0x00F00021,
;~ PATPAINT    = 0x00FB0A09,
;~ PATINVERT   = 0x005A0049,
;~ DSTINVERT   = 0x00550009,
;~ BLACKNESS   = 0x00000042,
;~ WHITENESS   = 0x00FF0062,
;~ CAPTUREBLT  = 0x40000000 //only if WinVer >= 5.0.0 (see wingdi.h)