#Requires AutoHotkey v2.0
Persistent
A_TrayMenu.TraySetIcon("speed-radar.png")
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
	Send "^+2" ;Ctrl+Shift+1
}

LimitFrames60(*)
{
	Send "^+1"
	Send "^+6" ;Ctrl+Shift+6
}

LimitFrames40(*)
{
	Send "^+6"
	Send "^+4" ;Ctrl+Shift+4
}

LimitFrames30(*)
{
	Send "^+6"
	Send "^+3" ;Ctrl+Shift+3
}

DisableOSD(*)
{
	Send "^+{F11}" ;Ctrl+Shift+F11
}

ShowSubtleOSD(*)
{
	Send "^+{F10}"
	Send "^+{F1}" ;Ctrl+Shift+F1
}

ShowMangoOSD(*)
{
	Send "^+{F10}"
	Send "^+{F2}" ;Ctrl+Shift+F2
} 

ShowMangoLatencyOSD(*)
{
	Send "^+{F10}"
	Send "^+{F3}" ;Ctrl+Shift+F3
} 

ShowTopBarOSD(*)
{
	Send "^+{F10}"
	Send "^+{F4}" ;Ctrl+Shift+F4
}