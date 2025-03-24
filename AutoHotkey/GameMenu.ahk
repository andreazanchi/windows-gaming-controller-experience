#Requires AutoHotkey v2.0
Persistent
TraySetIcon("speed-radar.png")
A_TrayMenu.Delete()
A_TrayMenu.Add()
A_TrayMenu.Add("Disable Frame Limiter", DisableFrameLimiter)
A_TrayMenu.Add("Frame limiter 60", LimitFrames60)
A_TrayMenu.Add("Frame limiter 40", LimitFrames40)
A_TrayMenu.Add("Frame limiter 30", LimitFrames30)
A_TrayMenu.Add()
A_TrayMenu.Add()
A_TrayMenu.Add("Disable OSD", DisableOSD)
A_TrayMenu.Add("Show Subtle OSD", ShowSubtleOSD)
A_TrayMenu.Add("Show Mango OSD", ShowMangoOSD)
A_TrayMenu.Add("Show Mango_Latency OSD", ShowMangoLatencyOSD)
A_TrayMenu.Add("Show TopBar OSD", ShowTopBarOSD)
A_TrayMenu.Add()

DisableFrameLimiter(*)
{
	Send "^+1" ;Ctrl+Shift+1
}

LimitFrames60(*)
{
	Send "^+6" ;Ctrl+Shift+6
}

LimitFrames40(*)
{
	Send "^+4" ;Ctrl+Shift+4
}

LimitFrames30(*)
{
	Send "^+3" ;Ctrl+Shift+3
}

DisableOSD(*)
{
	Send "^+F10" ;Ctrl+Shift+F10
}

ShowSubtleOSD(*)
{
	Send "^+F1" ;Ctrl+Shift+F1
}

ShowMangoOSD(*)
{
	Send "^+F2" ;Ctrl+Shift+F2
} 

ShowMangoLatencyOSD(*)
{
	Send "^+F3" ;Ctrl+Shift+F3
} 

ShowTopBarOSD(*)
{
	Send "^+F4" ;Ctrl+Shift+F4
}

#b::
{
	Send "#b"
	MoveMouseToTray()
}

MoveMouseToTray(*) 
{
	TrayIconRect := GetTrayIconRECT(A_ScriptHwnd)
	CoordMode "Mouse", "Screen"
	IconCenterX := (TrayIconRect.Left+TrayIconRect.Right)/2
	IconCenterY := (TrayIconRect.Top+TrayIconRect.Bottom)/2
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