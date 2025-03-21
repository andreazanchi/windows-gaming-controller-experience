# Windows Gaming Controller Experience

## The vision
This repo aims at containing a series of tools and a guide to empower people to enjoy their gaming computer (desktop or laptop), running windows, using only a Controller.
It is loosely inspired by how SteamOS and the distros inspired to it (like Bazzite or ChimeraOS) work.

**The idea is to have a system that boots up into Steam Big Picture Mode and allow you to go straight into your games. But also allows you to switch to Desktop mode with full Controller Support to consume media, boot up games and perform other tasks. 
Frame limiting and performance OSD are provided by Riva Tuner Statistics Server.
A handy tray menu to easily switch between Riva tuner settings is built using AutoHotkey. 
Customised Steam Desktop and Chord Controller configurations are provided with good sensitivity settings and shortcuts.**

Peripherals configuration (like pairing bluetooth controllers and headset, connecting to wifi, toggling HDR, etc) should still be possible thanks to steam Desktop Controller support and the configuration provided in this repository.

## Security considerations
As you know, Windows is not a strictly gaming platform ad is supposed to have strong security features to prevent it from being compromised.
I found some of those features to clash with the vision of this project. 
For instance: Steam desktop Controller and keyboard don't work on the windows login page (either with PIN or Password); installing some applications requires to click a Windows popup with Admin priviliges; Steam desktop Controller can't interact with apps running with elevated priviliges (like Riva Tuner Statistics)

**Any action that lowers (or potentially lowers) Windows security is marked with an asterisk * in the guide and you are free to not follow them.** That's based on my own knowledge and if unsure, you should make your own research.
None of this is made with any malicious intent. None of the linked repositories are made with any malicious intent. Anyways, they are all open source and relatively simple.

## Guide
1. Install Steam
2. Configure the controller Desktop and Chord using the provided profiles (WIP)
3. Disable Controller input on UWP apps using this tool: https://github.com/BlueAmulet/XInputUWPFix
4. Install RTSS (The standalone version is enough, no need for Afterburner). Go into the settings, in the "Plugins" tab and enable HotkeyHandler
5. Copy the RTSS/HotkeyHandler.cfg in the RTSS HotkeyHandler plgugin folder. IE: C:\Program Files (x86)\RivaTuner Statistics Server\Plugins\Client
6. Download the files from this repository: https://github.com/MonkeyCrumpets/RTSS-overlays and copy the .ovl files into the RTSS Overlay folder. IE: C:\Program Files (x86)\RivaTuner Statistics Server\Plugins\Client\Overlays
7. Install AutoHotkey v2.
8. Download the files from the AutoHotkey Folder and place them where you want (as long as you keep them together in the same folder)
9. Disable the Steam auto startup in its settings
10.  Make a link to the previously downloaded GamemMenu.ahk file and move into the Windows auto startup folder. IE: C:\ProgramData\Microsoft\Windows\Start Menu\Programs\Startup
11. \* Open the "Task Scheduler" Windows app and add a task for Steam selecting "Run with the highest privilege". This allows the steam desktop controller mappings to work on any application 
12. \* Switch to a local user and disable PIN and Password on login. This allows you to jump straight into the OS and Steam. https://www.google.com/search?q=windows+11+how+to+disable+password. You probably need to convert your user to a local one before doing that: https://www.google.com/search?q=convert+windows+user+to+local
13. \* Disable Windows UAC popup to be able to install applications with just Steam Desktop Controller support (and avoid the admin popup): https://www.google.com/search?q=windows+disable+UAC 