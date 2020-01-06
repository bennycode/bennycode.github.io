---
title: "Virus: Boughtnote Planlone"
date: 2020/01/06 14:27:11
categories:
  - [Windows, Security]
tags:
  - Boughtnote
  - Planlone
  - Virus
  - ESET
  - NOD32
  - Windows
  - Explorer
  - Defender
  - Antivirus
---

Today I discovered a virus software named "Boughtnote Planlone" from "Boughtnote Planlone Software Limited" on one of my computers. It nested in my Windows autostart and caused high CPU usage on my "Windows Explorer" making my operating system extremely slow. 

Unfortunately Windows Defender did not detect this virus but here is how I got rid off it:

1. I restarted Windows 10 in [safe mode](https://support.microsoft.com/help/12376/windows-10-start-your-pc-in-safe-mode)
2. I deactivated "Boughtnote Planlone (32 Bit)" in my "Autostart" (using `msconfig`)
3. I restarted Windows without safe mode and installed "ESET Internet Security"
4. I scanned the file "C:\Users\bennyn\AppData\Roaming\Microsoft\Authoker\bderedDS.exe" with "ESET Internet Security" which ultimately deleted the virus

In my case the virus executables have been named "BdeHkeDS.exe" and "bderedDS.exe". Those have been identified as "ML/Augur Trojan" threat.