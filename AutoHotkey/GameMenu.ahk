#Requires AutoHotkey v2.0

;BuildTrayMenu()
;BuildMenu()
myGui := BuildQuickToolsGUi()

BuildQuickToolsGUi(*)
{	
	global myGui := Gui()
	myGui.Opt("-MinimizeBox -MaximizeBox +AlwaysOnTop")
    myGui.Add("Picture", "XM+3 YM+3 w32 h32 Section +Disabled", "speed-up-fill_.png")
	ButtonDisableFrameLimit := myGui.Add("Button", "XP+35 YP w181 h32", "Disable Frame Limit")
    myGui.Add("Picture", "XS YS+35 w32 h32 Section +Disabled", "outline-60fps-select_.png")
	Button60FPSLimit := myGui.Add("Button", "XP+35 YP w181 h32", "60 FPS Limit")
    myGui.Add("Picture", "XS YS+35 w32 h32 Section +Disabled", "number-40-small_.png")
	Button40FPSLimit := myGui.Add("Button", "XP+35 YP w181 h32", "40 FPS Limit")
    myGui.Add("Picture", "XS YS+35 w32 h32 Section +Disabled", "30fps-select_.png")
    FPSLimithBtnFpsLimit1 := myGui.Add("Button", "XP+35 YP w181 h32", "30 FPS Limit")
    myGui.Add("Picture", "XS YS+50 w32 h32 Section +Disabled", "off-tag_.png")
	ButtonDisableOverlay := myGui.Add("Button", "XP+35 YP w181 h32", "Disable Overlay")
    myGui.Add("Picture", "XS YS+35 w32 h32 Section +Disabled", "monitor_.png")
	ButtonSubtleOverlay := myGui.Add("Button", "XP+35 YP w181 h32", "Subtle Overlay")
    myGui.Add("Picture", "XS YS+35 w32 h32 Section +Disabled", "monitor_.png")
	ButtonMangoOverlay := myGui.Add("Button", "XP+35 YP  w181 h32", "Mango Overlay")
    myGui.Add("Picture", "XS YS+35 w32 h32 Section +Disabled", "monitor_.png")
	ButtonMangoLatencyOverlay := myGui.Add("Button", "XP+35 YP w181 h32", "Mango Latency Overlay")
    myGui.Add("Picture", "XS YS+35 w32 h32 Section +Disabled", "monitor_.png")
	ButtonTopbarOverlay := myGui.Add("Button", "XP+35 YP w181 h32", "Topbar Overlay")
	ButtonBackToGame := myGui.Add("Button", "XS+35 YS+50  w181 h32", "Back To Game")
	ButtonClose := myGui.Add("Button", "XP XS+35  w181 h32", "Close")
	ButtonDisableFrameLimit.OnEvent("Click", OnEventHandler)
	Button60FPSLimit.OnEvent("Click", OnEventHandler)
	FPSLimithBtnFpsLimit1.OnEvent("Click", OnEventHandler)
	Button40FPSLimit.OnEvent("Click", OnEventHandler)
	ButtonDisableOverlay.OnEvent("Click", OnEventHandler)
	ButtonSubtleOverlay.OnEvent("Click", OnEventHandler)
	ButtonMangoOverlay.OnEvent("Click", OnEventHandler)
	ButtonMangoLatencyOverlay.OnEvent("Click", OnEventHandler)
	ButtonTopbarOverlay.OnEvent("Click", OnEventHandler)
	ButtonBackToGame.OnEvent("Click", OnEventHandler)
	ButtonClose.OnEvent("Click", (*) => myGui.Hide())
	myGui.OnEvent('Close', (*) => myGui.Hide())
	myGui.Title := "Quick Tools"
	return myGui
}

OnEventHandler(GuiCtrlObj, Info)
{
	Switch GuiCtrlObj.Text
	{
		Case "Disable Frame Limit":
			DisableFrameLimiter()
		Case "60 FPS Limit":
			LimitFrames60()
		Case "30 FPS Limit":
			LimitFrames30()
		Case "40 FPS Limit":
			LimitFrames40()
		Case "Disable Overlay":
			DisableOSD()
		Case "Subtle Overlay":
			ShowSubtleOSD()
		Case "Mango Overlay":
			ShowMangoOSD()	
		Case "Mango Latency Overlay":
			ShowMangoLatencyOSD()	
		Case "Topbar Overlay":
			ShowTopBarOSD()		
		Case "Back To Game":
			BackToGame()
		Default:
	}
}

BuildTrayMenu(*)
{
	Persistent
	TraySetIcon("speed-radar.png")
	A_TrayMenu.Delete()
	A_TrayMenu.Add()
	A_TrayMenu.Add("Disable Frame Limiter", DisableFrameLimiter)
	A_TrayMenu.Add("Frame limiter 60", LimitFrames60)
	A_TrayMenu.Add("Frame limiter 40", LimitFrames40)
	A_TrayMenu.Add("Frame limiter 30", LimitFrames30)
	A_TrayMenu.Add()
	A_TrayMenu.Add("Disable Overlay", DisableOSD)
	A_TrayMenu.Add("Show Subtle Overlay", ShowSubtleOSD)
	A_TrayMenu.Add("Show Mango Overlay", ShowMangoOSD)
	A_TrayMenu.Add("Show Mango_Latency Overlay", ShowMangoLatencyOSD)
	A_TrayMenu.Add("Show TopBar Overlay", ShowTopBarOSD)
	A_TrayMenu.Add()
	A_TrayMenu.Add("Show Taskbar", ShowTaskbar)
	SetIconsForTrayMenu()
	A_TrayMenu.Add()
}

SetIconsForTrayMenu(*) 
{
	A_TrayMenu.setIcon("Disable Frame Limiter", "speed-up-fill_.png",, 0)
	A_TrayMenu.setIcon("Frame limiter 60", "outline-60fps-select_.png",, 0)
	A_TrayMenu.setIcon("Frame limiter 40", "number-40-small_.png",, 0)
	A_TrayMenu.setIcon("Frame limiter 30", "30fps-select_.png",, 0)
	A_TrayMenu.setIcon("Disable Overlay", "off-tag_.png",, 0)
	A_TrayMenu.setIcon("Show Subtle Overlay", "monitor_.png",, 0)
	A_TrayMenu.setIcon("Show Mango Overlay", "monitor_.png",, 0)
	A_TrayMenu.setIcon("Show Mango_Latency Overlay", "monitor_.png",, 0)
	A_TrayMenu.setIcon("Show TopBar Overlay", "monitor_.png",, 0)
	A_TrayMenu.setIcon("Show Taskbar", "table-alt-fill_.png",, 0)
}

BuildMenu(*)
{
	Persistent
	; Create the popup menu by adding some items to it.
	MyMenu := Menu()
	MyMenu.Add("Item 1", MenuHandler)
	MyMenu.Add("Item 2", MenuHandler)
	MyMenu.Add()  ; Add a separator line.

	; Create another menu destined to become a submenu of the above menu.
	Submenu1 := Menu()
	Submenu1.Add("Item A", MenuHandler)
	Submenu1.Add("Item B", MenuHandler)

	; Create a submenu in the first menu (a right-arrow indicator). When the user selects it, the second menu is displayed.
	MyMenu.Add("My Submenu", Submenu1)

	MyMenu.Add()  ; Add a separator line below the submenu.
	MyMenu.Add("Item 3", MenuHandler)  ; Add another menu item beneath the submenu.
	MyMenu.show()

}

MenuHandler(Item, *) {
  ;  MsgBox("You selected " Item)
}

DisableFrameLimiter(*)
{
	Send "^+2" ;Ctrl+Shift+1
	;RestoreActiveWindow()
}

LimitFrames60(*)
{
	Send "^+1"
	Send "^+6" ;Ctrl+Shift+6
	;RestoreActiveWindow()
}

LimitFrames40(*)
{
	Send "^+1"
	Send "^+4" ;Ctrl+Shift+4
	;RestoreActiveWindow()
}

LimitFrames30(*)
{
	Send "^+1"
	Send "^+3" ;Ctrl+Shift+3
	;RestoreActiveWindow()
}

DisableOSD(*)
{
	Send "^+{F6}" ;Ctrl+Shift+F6
	;RestoreActiveWindow()
}

ShowSubtleOSD(*)
{
	Send "^+{F5}"
	sleep 100
	Send "^+{F1}" ;Ctrl+Shift+F1
	;RestoreActiveWindow()
}

ShowMangoOSD(*)
{
	Send "^+{F5}"
	sleep 100
	Send "^+{F2}" ;Ctrl+Shift+F2
	;RestoreActiveWindow()
} 

ShowMangoLatencyOSD(*)
{
	Send "^+{F5}"
	sleep 100
	Send "^+{F3}" ;Ctrl+Shift+F3
	;RestoreActiveWindow()
} 

ShowTopBarOSD(*)
{
	Send "^+{F5}"
	sleep 100
	Send "^+{F4}" ;Ctrl+Shift+F4
	;RestoreActiveWindow()
}

BackToGame(*)
{
	myGui.Hide()
	RestoreActiveWindow()
}

ShowTaskbar(*)
{
	Send "#t"
}

#+b::
{
	StoreActiveWindow()
	;MoveMouseCloseToTrayIcon()
	;A_TrayMenu.show()
	;myGui.show(" y386 w205 h476")
	myGui.show("Hide Autosize")
	myGui.GetPos(&X, &Y, &Width, &Height)
	scaledWidth := A_ScreenWidth/(A_ScreenDPI/96)
	scaledHeight := A_ScreenHeight/(A_ScreenDPI/96)
	xPos := scaledWidth - Width
	yPos := scaledHeight - Height - 100
	myGui.Move(xPos, yPos)
	myGui.Show()
}

StoreActiveWindow(*)
{
	global activeWindowTitle := WinGetTitle("A")
}

RestoreActiveWindow(*) 
{
	if WinExist(activeWindowTitle) 
		WinActivate activeWindowTitle
	
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