1. In the virtual machine, in cmd command line.

<b>bcdedit /debug on</b>

<b>bcdedit /dbgsettings serial debugport:n baudrate:115200</b>

<b>windbg -k com:pipe,port=\\.\pipe\PipeName,resets=0,reconnect</b>

<b>windbg -k com:pipe,port=\\VMHost\pipe\PipeName,resets=0,reconnect</b>

<b>kd -k com:pipe,port=\\\\.\pipe\PipeName,resets=0,reconnect</b>

<b>kd -k com:pipe,port=\\\\VMHost\pipe\PipeName,resets=0,reconnect</b>

*VMHost*
Specifies the name of the computer that the virtual machine is running on.

*PipeName*
Specifies the name of the pipe that you created on the virtual machine



关闭检查驱动数字签名
# shutdown checking signature on windows 10.

<b>bcdedit.exe /set nointegritychecks on</b> // 不管用

# disable "Driver Signing"
# 0. BIOS
Security -> Secure Boot -> Secure Boot Control -> Disabled
# 1. disable "integrity checks"
<b>BCDEDIT -SET LOADOPTIONS DISABLE_INTEGRITY_CHECKS</b>
# 2. Enable "Test mode"
<b>BCDEDIT -SET TESTSIGNING ON</b>
# 3. restart windows
<b>重新启动 Windows</b>
shutdown /r /t 0
# 4. add start options
msconfig
# 5. add a boot entry
bcdedit /copy {current} /d "DebugEntry"

# Enable "Driver Signing"
# 1. Enable "integrity checks"
bcdedit -set loadoptions enable_integrity_checks
# 2. disable "test mode"
bcdedit -set testsigning off
# 3. restart system
shutdown /r /t 0


1. find process PID

   <b>!process [PID] 0



create start stop and delete drivers on cmd

```
sc create FsFilter type= filesys binPath= c:\FsFilter.sys sc start FsFilter pause sc stop FsFilter sc delete FsFilter pause
```



inf2cat produce cat file

 <b>inf2Cat.exe /driver:C:\Users\m1882\source\repos\minispy\filter\x64\Debug\minispy /os:2000,XP_X86,XP_X64,Server2003_X86,Server2003_X64,Vista_X86,Vista_X64,7_X86,7_X64 </b>


# install minispy driver.
1.Make sure that filtername.sys and filtername.inf are in the same directory
2.In Windows Explorer, right-click filtername.inf, and click install
3.To load the minifilter, run <fltmc load filtername> or <net start filtername>

# Using an INF file to uninstall a file system filter driver.
# Command-Line
RUNDLL32.EXE SETUPAPI.DLL,InstallHinfSection DefaultUninstall 132 path-to-uninstall-dir\infname.inf
# Powershell Uninstall
Get-CimInstance Win32_SystemDriver -Filter "name='your_driver_name'" | Invoke-CimMethod -MethodName Delete


# Installing Unsigned Drivers in Windows 7
1.Press the keyboard shortcut Windows Logo Key + R to open the Run dialog.
2.Type gpedit.msc in the Run dialog and press Enter
3.In the Group Policy Editor, navigate to User Configuration → Administrative Templates → System → Driver Installation.
4.Double-click on Code signing for device drivers in the right-side pane as shown above.
5.In the windows that opens, choose Enabled. In the Options, choose Ignore as shown. Then click on the OK button to save the settings.
6.Restart your computer for changes to take effect.

Method 2 :
1.Open an elevated command prompt in Windows 7 as previously mentioned in this article.
2.In the elevated command prompt, type the following in it and press Enter :
bcdedit -set loadoptions DDISABLE_INTEGRITY_CHECKS
bcdedit -set TESTSIGNING ON
3.Reboot your computer and proceed to installing any unsigned drivers. After the installation of the drivers is complete, you can revert the changes again. Again open an elevated command prompt, type the following in it and press Enter :
bcdedit.exe -set loadoptions DENABLE_INTEGRITY_CHECKS
bcdedit.exe -set TESTSIGNING OFF
4.Reboot your computer again.

1.Open an elevated command prompt in Windows 7 as shown in this article : how to open an elevated command prompt.
2.In the elevated command prompt, type the following in it and press Enter :
bcdedit /set nointegritychecks ON
3.Reboot your computer and proceed to installing any unsigned drivers. After the installation of the drivers is complete, you should turn on integrity check as it was before. Again open an elevated command prompt, type the following in it and press Enter :
bcdedit /set nointegritychecks OFF
4.Reboot your computer again.
