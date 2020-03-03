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

<b>bcdedit.exe /set nointegritychecks on</b> // 不管用

<b>BCDEDIT -SET LOADOPTIONS DISABLE_INTEGRITY_CHECKS</b>

<b>BCDEDIT -SET TESTSIGNING ON</b>

<b>重新启动 Windows</b>



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
