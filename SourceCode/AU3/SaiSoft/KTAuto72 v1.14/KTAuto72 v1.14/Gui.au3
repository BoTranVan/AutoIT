﻿#include <ButtonConstants.au3>
#include <ComboConstants.au3>
#include <GUIConstantsEx.au3>
#include <StaticConstants.au3>
#include <TabConstants.au3>
#include <WindowsConstants.au3>
Opt("GUIOnEventMode", 1)
#Region ### START Koda GUI section ### Form=F:\Lap Trinh\AutoIT\Develop\KTAuto72\KTAuto72.kxf
$MainGUI = GUICreate("KTAuto72", 204, 268, 403, 155, BitOR($WS_SYSMENU,$WS_CAPTION,$WS_POPUP,$WS_POPUPWINDOW,$WS_BORDER,$WS_CLIPSIBLINGS), BitOR($WS_EX_TOOLWINDOW,$WS_EX_TOPMOST,$WS_EX_WINDOWEDGE))
GUISetOnEvent($GUI_EVENT_CLOSE, "ExitAuto")
$Main_T = GUICtrlCreateTab(-1, -2, 212, 238)
GUICtrlSetResizing(-1, $GUI_DOCKWIDTH+$GUI_DOCKHEIGHT)
$Mod_T = GUICtrlCreateTabItem("Mod")
$StartAuto_B = GUICtrlCreateButton("Attack", 4, 24, 69, 20, 0)
GUICtrlSetFont(-1, 9, 800, 0, "Arial")
GUICtrlSetCursor (-1, 0)
GUICtrlSetOnEvent(-1, "StartAuto_BClick")
$Skill1_CB = GUICtrlCreateCheckbox("Cách", 3, 49, 45, 17)
GUICtrlSetOnEvent(-1, "Skill1_CBClick")
$Target_L = GUICtrlCreateLabel("Kg Có", 77, 27, 33, 17)
$Mod_HPCur_L = GUICtrlCreateLabel("0000000000", 135, 27, 64, 17)
$ModHP_L = GUICtrlCreateLabel("HP:", 112, 27, 22, 17)
$Label4 = GUICtrlCreateLabel("", 115, 25, 4, 4)
$Skill1_C = GUICtrlCreateCombo("", 160, 47, 41, 25, BitOR($CBS_DROPDOWNLIST,$CBS_AUTOHSCROLL))
GUICtrlSetOnEvent(-1, "Skill1_CChange")
$Skill2_C = GUICtrlCreateCombo("", 160, 70, 41, 25, BitOR($CBS_DROPDOWNLIST,$CBS_AUTOHSCROLL))
GUICtrlSetOnEvent(-1, "Skill2_CChange")
$Skill4_C = GUICtrlCreateCombo("", 160, 115, 41, 25, BitOR($CBS_DROPDOWNLIST,$CBS_AUTOHSCROLL))
GUICtrlSetOnEvent(-1, "Skill4_CChange")
$Skill3_C = GUICtrlCreateCombo("", 160, 92, 41, 25, BitOR($CBS_DROPDOWNLIST,$CBS_AUTOHSCROLL))
GUICtrlSetOnEvent(-1, "Skill3_CChange")
$Skill5_C = GUICtrlCreateCombo("", 160, 138, 41, 25, BitOR($CBS_DROPDOWNLIST,$CBS_AUTOHSCROLL))
GUICtrlSetOnEvent(-1, "Skill5_CChange")
$Skill2_CB = GUICtrlCreateCheckbox("Cách", 3, 72, 45, 17)
GUICtrlSetOnEvent(-1, "Skill2_CBClick")
$Skill4_CB = GUICtrlCreateCheckbox("Cách", 3, 118, 45, 17)
GUICtrlSetOnEvent(-1, "Skill4_CBClick")
$Skill3_CB = GUICtrlCreateCheckbox("Cách", 3, 95, 45, 17)
GUICtrlSetOnEvent(-1, "Skill3_CBClick")
$Skill5_CB = GUICtrlCreateCheckbox("Cách", 3, 140, 45, 17)
GUICtrlSetOnEvent(-1, "Skill5_CBClick")
$Skill14_CB = GUICtrlCreateCheckbox("Cách", 25, 163, 48, 17)
GUICtrlSetFont(-1, 8, 800, 0, "MS Sans Serif")
GUICtrlSetOnEvent(-1, "Skill14_CBClick")
$Skill14_C = GUICtrlCreateCombo("", 160, 161, 41, 25, BitOR($CBS_DROPDOWNLIST,$CBS_AUTOHSCROLL))
GUICtrlSetOnEvent(-1, "Skill14_CChange")
$Skill15_CB = GUICtrlCreateCheckbox("Cách", 25, 186, 48, 17)
GUICtrlSetFont(-1, 8, 800, 0, "MS Sans Serif")
GUICtrlSetOnEvent(-1, "Skill15_CBClick")
$Skill15_C = GUICtrlCreateCombo("", 160, 183, 41, 25, BitOR($CBS_DROPDOWNLIST,$CBS_AUTOHSCROLL))
GUICtrlSetOnEvent(-1, "Skill15_CChange")
$Skill16_CB = GUICtrlCreateCheckbox("Cách", 25, 209, 48, 17)
GUICtrlSetFont(-1, 8, 800, 0, "MS Sans Serif")
GUICtrlSetOnEvent(-1, "Skill16_CBClick")
$Skill16_C = GUICtrlCreateCombo("", 160, 206, 41, 25, BitOR($CBS_DROPDOWNLIST,$CBS_AUTOHSCROLL))
GUICtrlSetOnEvent(-1, "Skill16_CChange")
$Label1 = GUICtrlCreateLabel("dùng skill", 109, 50, 48, 17)
$Label14 = GUICtrlCreateLabel("dùng skill", 109, 73, 48, 17)
$Label15 = GUICtrlCreateLabel("dùng skill", 109, 96, 48, 17)
$Label16 = GUICtrlCreateLabel("dùng skill", 109, 119, 48, 17)
$Label17 = GUICtrlCreateLabel("dùng skill", 109, 141, 48, 17)
$Label18 = GUICtrlCreateLabel("buff", 127, 164, 26, 17, $SS_RIGHT)
GUICtrlSetFont(-1, 8, 800, 0, "MS Sans Serif")
$Label19 = GUICtrlCreateLabel("buff", 127, 187, 26, 17, $SS_RIGHT)
GUICtrlSetFont(-1, 8, 800, 0, "MS Sans Serif")
$Label20 = GUICtrlCreateLabel("buff", 127, 210, 26, 17, $SS_RIGHT)
GUICtrlSetFont(-1, 8, 800, 0, "MS Sans Serif")
$Skill1Delay = GUICtrlCreateLabel("99999ms", 50, 50, 54, 17, $SS_CENTER)
GUICtrlSetFont(-1, 8, 800, 0, "MS Sans Serif")
GUICtrlSetColor(-1, 0x0000FF)
GUICtrlSetCursor (-1, 0)
GUICtrlSetOnEvent(-1, "Skill1DelayClick")
$Skill2Delay = GUICtrlCreateLabel("99999ms", 50, 73, 54, 17, $SS_CENTER)
GUICtrlSetFont(-1, 8, 800, 0, "MS Sans Serif")
GUICtrlSetColor(-1, 0x0000FF)
GUICtrlSetCursor (-1, 0)
GUICtrlSetOnEvent(-1, "Skill2DelayClick")
$Skill3Delay = GUICtrlCreateLabel("99999ms", 50, 96, 54, 17, $SS_CENTER)
GUICtrlSetFont(-1, 8, 800, 0, "MS Sans Serif")
GUICtrlSetColor(-1, 0x0000FF)
GUICtrlSetCursor (-1, 0)
GUICtrlSetOnEvent(-1, "Skill3DelayClick")
$Skill14Delay = GUICtrlCreateLabel("99999ms", 74, 164, 54, 17, $SS_CENTER)
GUICtrlSetFont(-1, 8, 800, 0, "MS Sans Serif")
GUICtrlSetColor(-1, 0x0000FF)
GUICtrlSetCursor (-1, 0)
GUICtrlSetOnEvent(-1, "Skill14DelayClick")
$Skill5Delay = GUICtrlCreateLabel("99999ms", 50, 141, 54, 17, $SS_CENTER)
GUICtrlSetFont(-1, 8, 800, 0, "MS Sans Serif")
GUICtrlSetColor(-1, 0x0000FF)
GUICtrlSetCursor (-1, 0)
GUICtrlSetOnEvent(-1, "Skill5DelayClick")
$Skill4Delay = GUICtrlCreateLabel("99999ms", 50, 119, 54, 17, $SS_CENTER)
GUICtrlSetFont(-1, 8, 800, 0, "MS Sans Serif")
GUICtrlSetColor(-1, 0x0000FF)
GUICtrlSetCursor (-1, 0)
GUICtrlSetOnEvent(-1, "Skill4DelayClick")
$Skill16Delay = GUICtrlCreateLabel("99999ms", 74, 210, 54, 17, $SS_CENTER)
GUICtrlSetFont(-1, 8, 800, 0, "MS Sans Serif")
GUICtrlSetColor(-1, 0x0000FF)
GUICtrlSetCursor (-1, 0)
GUICtrlSetOnEvent(-1, "Skill16DelayClick")
$Skill15Delay = GUICtrlCreateLabel("99999ms", 74, 187, 54, 17, $SS_CENTER)
GUICtrlSetFont(-1, 8, 800, 0, "MS Sans Serif")
GUICtrlSetColor(-1, 0x0000FF)
GUICtrlSetCursor (-1, 0)
GUICtrlSetOnEvent(-1, "Skill15DelayClick")
$BuffOn_B = GUICtrlCreateButton("X", 5, 165, 16, 60, $WS_GROUP)
GUICtrlSetFont(-1, 8, 800, 0, "MS Sans Serif")
GUICtrlSetColor(-1, 0x0000FF)
GUICtrlSetOnEvent(-1, "BuffOn_BClick")
$Char_T = GUICtrlCreateTabItem("Char")
$Skill10_C = GUICtrlCreateCombo("", 160, 138, 41, 25, BitOR($CBS_DROPDOWNLIST,$CBS_AUTOHSCROLL))
GUICtrlSetOnEvent(-1, "Skill10_CChange")
$Skill9_C = GUICtrlCreateCombo("", 160, 115, 41, 25, BitOR($CBS_DROPDOWNLIST,$CBS_AUTOHSCROLL))
GUICtrlSetOnEvent(-1, "Skill9_CChange")
$Skill8_C = GUICtrlCreateCombo("", 160, 92, 41, 25, BitOR($CBS_DROPDOWNLIST,$CBS_AUTOHSCROLL))
GUICtrlSetOnEvent(-1, "Skill8_CChange")
$Skill7_C = GUICtrlCreateCombo("", 160, 70, 41, 25, BitOR($CBS_DROPDOWNLIST,$CBS_AUTOHSCROLL))
GUICtrlSetOnEvent(-1, "Skill7_CChange")
$Skill6_C = GUICtrlCreateCombo("", 160, 47, 41, 25, BitOR($CBS_DROPDOWNLIST,$CBS_AUTOHSCROLL))
GUICtrlSetOnEvent(-1, "Skill6_CChange")
$Skill6_CB = GUICtrlCreateCheckbox("HP còn", 3, 49, 60, 17)
GUICtrlSetOnEvent(-1, "Skill6_CBClick")
$Skill7_CB = GUICtrlCreateCheckbox("HP còn", 3, 72, 60, 17)
GUICtrlSetOnEvent(-1, "Skill7_CBClick")
$Skill8_CB = GUICtrlCreateCheckbox("MP còn", 3, 94, 60, 17)
GUICtrlSetOnEvent(-1, "Skill8_CBClick")
$Skill9_CB = GUICtrlCreateCheckbox("MP còn", 3, 117, 60, 17)
GUICtrlSetOnEvent(-1, "Skill9_CBClick")
$Skill10_CB = GUICtrlCreateCheckbox("XP còn", 3, 140, 60, 17)
GUICtrlSetOnEvent(-1, "Skill10_CBClick")
$CharHP1_C = GUICtrlCreateCombo("", 65, 47, 41, 25, BitOR($CBS_DROPDOWNLIST,$CBS_AUTOHSCROLL))
GUICtrlSetOnEvent(-1, "CharHP1_CChange")
$Label7 = GUICtrlCreateLabel("dùng skill", 109, 50, 48, 17)
$Label8 = GUICtrlCreateLabel("dùng skill", 109, 71, 48, 17)
$Label9 = GUICtrlCreateLabel("dùng skill", 109, 95, 48, 17)
$Label10 = GUICtrlCreateLabel("dùng skill", 109, 118, 48, 17)
$CharMP1_C = GUICtrlCreateCombo("", 65, 92, 41, 25, BitOR($CBS_DROPDOWNLIST,$CBS_AUTOHSCROLL))
GUICtrlSetOnEvent(-1, "CharMP1_CChange")
$CharHP2_C = GUICtrlCreateCombo("", 65, 70, 41, 25, BitOR($CBS_DROPDOWNLIST,$CBS_AUTOHSCROLL))
GUICtrlSetOnEvent(-1, "CharHP2_CChange")
$CharMP2_C = GUICtrlCreateCombo("", 65, 115, 41, 25, BitOR($CBS_DROPDOWNLIST,$CBS_AUTOHSCROLL))
GUICtrlSetOnEvent(-1, "CharMP2_CChange")
$CharXP1_C = GUICtrlCreateCombo("", 65, 138, 41, 25, BitOR($CBS_DROPDOWNLIST,$CBS_AUTOHSCROLL))
GUICtrlSetOnEvent(-1, "CharXP1_CChange")
$Label11 = GUICtrlCreateLabel("dùng skill", 109, 141, 48, 17)
$CharSkillOn_CB = GUICtrlCreateCheckbox("Luon Dùng", 3, 25, 84, 17)
GUICtrlSetFont(-1, 9, 800, 0, "Arial")
GUICtrlSetCursor (-1, 0)
GUICtrlSetOnEvent(-1, "CharSkillOn_CBClick")
$CharHP_L = GUICtrlCreateLabel("HP 100%", 93, 27, 48, 17)
$CharMP_L = GUICtrlCreateLabel("MP 100%", 150, 27, 49, 17)
$Label13 = GUICtrlCreateLabel("-- Thú ------", 6, 168, 78, 20)
GUICtrlSetFont(-1, 10, 800, 0, "MS Sans Serif")
$Skill11_CB = GUICtrlCreateCheckbox("HP Thú còn", 3, 185, 80, 17)
GUICtrlSetOnEvent(-1, "Skill11_CBClick")
$Label12 = GUICtrlCreateLabel("dùng skill", 109, 186, 48, 17)
$Skill11_C = GUICtrlCreateCombo("", 160, 183, 41, 25, BitOR($CBS_DROPDOWNLIST,$CBS_AUTOHSCROLL))
GUICtrlSetOnEvent(-1, "Skill11_CChange")
$PetHP = GUICtrlCreateLabel("52%", 83, 186, 27, 17, $SS_CENTER)
GUICtrlSetFont(-1, 8, 800, 0, "MS Sans Serif")
GUICtrlSetColor(-1, 0x0000FF)
GUICtrlSetCursor (-1, 0)
GUICtrlSetOnEvent(-1, "PetHPClick")
$PetHP_L = GUICtrlCreateLabel("HP 100%", 93, 169, 48, 17)
$PetMP_L = GUICtrlCreateLabel("MP 100%", 150, 169, 49, 17)
$Skill12_CB = GUICtrlCreateCheckbox("MP Thú còn", 3, 208, 80, 17)
GUICtrlSetOnEvent(-1, "Skill12_CBClick")
$PetMP = GUICtrlCreateLabel("52%", 83, 209, 27, 17, $SS_CENTER)
GUICtrlSetFont(-1, 8, 800, 0, "MS Sans Serif")
GUICtrlSetColor(-1, 0x0000FF)
GUICtrlSetCursor (-1, 0)
GUICtrlSetOnEvent(-1, "PetMPClick")
$Label2 = GUICtrlCreateLabel("dùng skill", 109, 209, 48, 17)
$Skill12_C = GUICtrlCreateCombo("", 160, 206, 41, 25, BitOR($CBS_DROPDOWNLIST,$CBS_AUTOHSCROLL))
GUICtrlSetOnEvent(-1, "Skill12_CChange")
$Option_T = GUICtrlCreateTabItem("Option")
$GameAuto_CB = GUICtrlCreateCheckbox("Ket hop voi Auto trong Game", 8, 24, 161, 17)
GUICtrlSetState(-1, $GUI_CHECKED)
GUICtrlSetOnEvent(-1, "GameAuto_CBClick")
$CharListReload_B = GUICtrlCreateButton("Nap Lai Nhan Vat", 40, 200, 107, 25, $WS_GROUP)
GUICtrlSetOnEvent(-1, "CharListReload_BClick")
GUICtrlCreateTabItem("")
$AutoHelp = GUICtrlCreateButton("?", 179, 240, 24, 20, 0)
GUICtrlSetOnEvent(-1, "AutoHelpClick")
$HealCharState_L = GUICtrlCreateLabel("+", 43, 237, 16, 28, $SS_NOPREFIX)
GUICtrlSetFont(-1, 16, 800, 0, "MS Sans Serif")
GUICtrlSetColor(-1, 0xFF0000)
GUICtrlSetCursor (-1, 0)
GUICtrlSetOnEvent(-1, "CharSkillOn_CBClick")
$CharList_C = GUICtrlCreateCombo("", 64, 240, 70, 25, BitOR($CBS_DROPDOWNLIST,$CBS_AUTOHSCROLL))
GUICtrlSetOnEvent(-1, "CharList_CChange")
$AutoMini_B = GUICtrlCreateButton("/\", 146, 240, 28, 20, 0)
GUICtrlSetOnEvent(-1, "AutoMini_BClick")
#EndRegion ### END Koda GUI section ###