﻿
;~ == Auto Var =========================================
Global $GUIVersion = "2.0.5.4"
Global $AutoName = "MelonUpdate"
Global $AutoVersion = "1.0"
Global $AutoShow = 1
Global $AutoPos[2] = [0,0]
Global $AutoPause = 0
Global $Testing = 0
Global $DataFolder = "data"
Global $DataFile = $DataFolder&"\data.ini"
Global $LangFile = $DataFolder&"\lang.txt"
Global $CommandList[1] = [-1]
Global $CommandCurrent[2] = [0,0]

Global $SaveLog = 1
Global $LogFile = 0
Global $LogDate = @YEAR &"-"& @MON &"-"& @MDAY &" "& @HOUR
Global $LogFileName = "log\"&$LogDate&".ini"

;~ ===================================================
Global $Start = 0
Global $FileAccount = "account.txt"
Global $FileAccWron = "acc-wrong.txt"
Global $FileAccDone = "acc-done.txt"
Global $LineCurrent = ""
Global $DoneNumber = 0
Global $FAcc = FileOpen($FileAccount)
Global $URL = "http://www.melon.com/static/cds/main/web/main_list.html"
Global $oIE
