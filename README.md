# Windows Gaming Controller Experience
This repo aims at containing a series of tools to empower people to enjoy their gaming computer (desktop or laptop), running windows, usign only a Controller.

1. Install Steam
2. Configure the controller Desktop and Chord using the provided profiles (WIP)
3. Disable Controller input on UWP apps using this tool: https://github.com/BlueAmulet/XInputUWPFix
4. Install RTSS (The standalone version is enough). Go into the settings, in the "Plugins" tab and enable HotkeyHandler
5. Copy the RTSS/HotkeyHandler.cfg in the RTSS HotkeyHandler plgugin folder. IE: C:\Program Files (x86)\RivaTuner Statistics Server\Plugins\Client
6. Download the files from this repository: https://github.com/MonkeyCrumpets/RTSS-overlays and copy the .ovl files into the RTSS Overlay folder. IE: C:\Program Files (x86)\RivaTuner Statistics Server\Plugins\Client\Overlays
7. Install AutoHotkey v2.
8. Download the files from the AutoHotkey Folder and place them where you want (as long as you keep them together in the same folder)
9. Disable the Steam auto startup in its settings
10. Open the "Task Scheduler" Windows app and add a task for Steam selecting "Run with the highest privilege". This allows the steam desktop controller mappings to work on any application
11.  Make a link to the previously downloaded GamemMeny.ahk file and move into the Windows auto startup folder. IE: C:\ProgramData\Microsoft\Windows\Start Menu\Programs\Startup