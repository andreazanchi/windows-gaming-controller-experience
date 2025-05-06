#Requires AutoHotkey v2.0

TraySetIcon("speed-radar.png")
aQuickToolsModel := QuickToolsModel()
aQuickToolsController := QuickToolsController(aQuickToolsModel)
aQuickToolsWindow := QuickToolsWindow(aQuickToolsModel, aQuickToolsController)


class QuickToolsModel {
	gameTitle := ""
}


class QuickToolsWindow {
	
	myGui := ""
	quickToolsModel := ""
	gameTitleTextBox := ""
	aQuickToolController := ""

	__New(quickToolsModel, aQuickToolsController) {
		this.aQuickToolController := aQuickToolsController
		this.quickToolsModel := quickToolsModel
		this.myGui := Gui()
		this.myGui.Title := "Quick Tools"
		this.myGui.Opt("-MinimizeBox -MaximizeBox +AlwaysOnTop")
		this.myGui.Add("Picture", "XM+3 YM+3 w32 h32 Section +Disabled", "speed-up-fill_.png")
		buttonDisableFrameLimit := this.myGui.Add("Button", "XP+35 YP w181 h32", "Disable Frame Limit")
		this.myGui.Add("Picture", "XS YS+35 w32 h32 Section +Disabled", "outline-60fps-select_.png")
		button60FPSLimit := this.myGui.Add("Button", "XP+35 YP w181 h32", "60 FPS Limit")
		this.myGui.Add("Picture", "XS YS+35 w32 h32 Section +Disabled", "number-40-small_.png")
		button40FPSLimit := this.myGui.Add("Button", "XP+35 YP w181 h32", "40 FPS Limit")
		this.myGui.Add("Picture", "XS YS+35 w32 h32 Section +Disabled", "30fps-select_.png")
		FPSLimithBtnFpsLimit1 := this.myGui.Add("Button", "XP+35 YP w181 h32", "30 FPS Limit")
		this.myGui.Add("Picture", "XS YS+50 w32 h32 Section +Disabled", "off-tag_.png")
		buttonDisableOverlay := this.myGui.Add("Button", "XP+35 YP w181 h32", "Disable Overlay")
		this.myGui.Add("Picture", "XS YS+35 w32 h32 Section +Disabled", "monitor_.png")
		buttonSubtleOverlay := this.myGui.Add("Button", "XP+35 YP w181 h32", "Subtle Overlay")
		this.myGui.Add("Picture", "XS YS+35 w32 h32 Section +Disabled", "monitor_.png")
		buttonMangoOverlay := this.myGui.Add("Button", "XP+35 YP  w181 h32", "Mango Overlay")
		this.myGui.Add("Picture", "XS YS+35 w32 h32 Section +Disabled", "monitor_.png")
		buttonMangoLatencyOverlay := this.myGui.Add("Button", "XP+35 YP w181 h32", "Mango Latency Overlay")
		this.myGui.Add("Picture", "XS YS+35 w32 h32 Section +Disabled", "monitor_.png")
		buttonTopbarOverlay := this.myGui.Add("Button", "XP+35 YP w181 h32", "Topbar Overlay")
		buttonBackToGame := this.myGui.Add("Button", "XS+35 YS+50  w181 h32", "Back To Game")
		this.gameTitleTextBox := this.myGui.Add("Text", "XP YP+35  w181 h16  -Tabstop", "")
		;buttonClose := this.myGui.Add("Button", "XP XS+35  w181 h32", "Close")
		buttonDisableFrameLimit.OnEvent("Click", this)
		button60FPSLimit.OnEvent("Click", this)
		FPSLimithBtnFpsLimit1.OnEvent("Click", this)
		button40FPSLimit.OnEvent("Click", this)
		buttonDisableOverlay.OnEvent("Click", this)
		buttonSubtleOverlay.OnEvent("Click", this)
		buttonMangoOverlay.OnEvent("Click", this)
		buttonMangoLatencyOverlay.OnEvent("Click", this)
		buttonTopbarOverlay.OnEvent("Click", this)
		buttonBackToGame.OnEvent("Click", this)
		;buttonClose.OnEvent("Click", this)
		this.myGui.OnEvent('Close', (*) => 
			this.myGui.hide()
			this.aQuickToolController.Close()
		)
	}

	Call(GuiCtrlObj, Info) {
		Switch GuiCtrlObj.Text {
			Case "Disable Frame Limit":
				this.aQuickToolController.DisableFrameLimiter()
			Case "60 FPS Limit":
				this.aQuickToolController.LimitFrames60()
			Case "30 FPS Limit":
				this.aQuickToolController.LimitFrames30()
			Case "40 FPS Limit":
				this.aQuickToolController.LimitFrames40()
			Case "Disable Overlay":
				this.aQuickToolController.DisableOSD()
			Case "Subtle Overlay":
				this.aQuickToolController.ShowSubtleOSD()
			Case "Mango Overlay":
				this.aQuickToolController.ShowMangoOSD()	
			Case "Mango Latency Overlay":
				this.aQuickToolController.ShowMangoLatencyOSD()	
			Case "Topbar Overlay":
				this.aQuickToolController.ShowTopBarOSD()		
			Case "Back To Game": 
				this.myGui.hide()
				this.aQuickToolController.BackToGame()
			Case "Close":
				this.myGui.hide()
				this.aQuickToolController.Close()
			Default:
				
		}
		this.myGui.hide()
		this.aQuickToolController.Close()
	
	}

	showRight(*) {
		this.myGui.show("Hide Autosize")
		this.myGui.GetPos(&X, &Y, &Width, &Height)
		scaledWidth := A_ScreenWidth/(A_ScreenDPI/96)
		scaledHeight := A_ScreenHeight/(A_ScreenDPI/96)
		xPos := scaledWidth - Width
		yPos := scaledHeight - Height - 100
		this.myGui.Move(xPos, yPos)
		this.myGui.Show()
		this.updateViewWithModel()
	}

	updateViewWithModel(*) {
		this.gameTitleTextBox.text := this.quickToolsModel.gameTitle
	}

	hide(*) {
		this.myGui.hide()
	}
}

class QuickToolsController {
	
	quickToolsModel := ""

	__New(quickToolsModel) {
		this.quickToolsModel := quickToolsModel
		
	}

	DisableFrameLimiter(*) {
		Send "^+2" ;Ctrl+Shift+1
	}

	LimitFrames60(*) {
		Send "^+1"
		Send "^+6" ;Ctrl+Shift+6
	}

	LimitFrames40(*) {
		Send "^+1"
		Send "^+4" ;Ctrl+Shift+4
	}

	LimitFrames30(*) {
		Send "^+1"
		Send "^+3" ;Ctrl+Shift+3
	}

	DisableOSD(*) {
		Send "^+{F6}" ;Ctrl+Shift+F6
	}

	ShowSubtleOSD(*) {
		Send "^+{F5}"
		sleep 100
		Send "^+{F1}" ;Ctrl+Shift+F1
	}

	ShowMangoOSD(*) {
		Send "^+{F5}"
		sleep 100
		Send "^+{F2}" ;Ctrl+Shift+F2
	} 

	ShowMangoLatencyOSD(*) {
		Send "^+{F5}"
		sleep 100
		Send "^+{F3}" ;Ctrl+Shift+F3
	} 

	ShowTopBarOSD(*) {
		Send "^+{F5}"
		sleep 100
		Send "^+{F4}" ;Ctrl+Shift+F4
	}

	BackToGame(*) {
		this.restoreActiveWindow()
	}

	Close(*) {
		
	}

	ShowTaskbar(*) {
		Send "#t"
	}

	storeActiveWindow(*) {
		this.quickToolsModel.gameTitle := WinGetTitle("A")
	}

	restoreActiveWindow(*) {
		if WinExist(this.quickToolsModel.gameTitle) 
			WinActivate this.quickToolsModel.gameTitle
	
	}
}

#+b::
{
	aQuickToolsController.storeActiveWindow()
	aQuickToolsWindow.showRight()
}


MoveMouseToTrayIconCenter(*) 
{
	TrayIconRect := GetTrayIconRECT(A_ScriptHwnd)
	CoordMode "Mouse", "Screen"
	IconCenterX := (TrayIconRect.Left+TrayIconRect.Right)/2
	IconCenterY := (TrayIconRect.Top+TrayIconRect.Bottom)/2
	MouseMove IconCenterX, IconCenterY
}

MoveMouseCloseToTrayIcon(*) 
{
	TrayIconRect := GetTrayIconRECT(A_ScriptHwnd)
	CoordMode "Mouse", "Screen"
	IconCenterX := TrayIconRect.Left-1
	IconCenterY := TrayIconRect.Top-1
	MouseMove IconCenterX, IconCenterY
}

GetTrayIconRECT(hwnd) {
   static AHK_NOTIFYICON := 0x0404
   static Size := 16 + 3 * A_PtrSize
   NOTIFYICONIDENTIFIER := Buffer(Size, 0)
   NumPut 'UInt', Size, NOTIFYICONIDENTIFIER, 0
   NumPut 'Ptr',  hwnd, NOTIFYICONIDENTIFIER, A_PtrSize
   NumPut 'UInt', AHK_NOTIFYICON, NOTIFYICONIDENTIFIER, 2 * A_PtrSize
   if !DllCall('Shell32\Shell_NotifyIconGetRect', 'Ptr', NOTIFYICONIDENTIFIER, 'Ptr', RECT := Buffer(16), 'HRESULT')
      return {Left: NumGet(RECT, 0, 'Int'), Top: NumGet(RECT, 4, 'Int'), Right: NumGet(RECT, 8, 'Int'), Bottom: NumGet(RECT, 12, 'Int')}
}
