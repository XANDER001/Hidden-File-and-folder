cls
@echo off
setlocal DisableDelayedExpansion
color b & title Admin Access
::banner
mode 90,30
Set /a num=(%Random% %%9)+1
color %num%
timeout /t 3 >null
echo 			    :::::::::::::::::::::::::::::::::::
echo 			    ::       Created By Xander       ::
echo 			    ::              V1.0             ::
echo 		            :: Please Don't remove copyright ::
echo 			    :::::::::::::::::::::::::::::::::::
echo.
timeout /t 3 >null
echo.
echo   ::   .:  ::::::::::-. :::::::-.  .,:::::::::.    :::..-:::::'::: :::    .,::::::
echo  ,;;   ;;, ;;; ;;,   `';,;;,   `';,;;;;''''`;;;;,  `;;;;;;'''' ;;; ;;;    ;;;;''''
echo ,[[[,,,[[[ [[[ `[[     [[`[[     [[ [[cccc   [[[[[. '[[[[[,,== [[[ [[[     [[cccc
echo "$$$"""$$$ $$$  $$,    $$ $$,    $$ $$""""   $$$ "Y$c$$`$$$"`` $$$ $$'     $$""""
echo  888   "88o888  888_,o8P' 888_,o8P' 888oo,__ 888    Y88 888    888o88oo,.__888oo,__
echo  MMM    YMMMMM  MMMMP"`   MMMMP"`   """"YUMMMMMM     YM "MM,   MMM""""YUMMM""""YUMMM
echo.
echo.
::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::
::this code was create to Check if the file has been created or not / kode ini dibuat untuk memeriksa apakah file telah dibuat atau tidak
if EXIST pwddtbs.dll goto login
if not EXIST pwddtbs.dll goto register
::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::

::register system
:register
title Register System
echo please enter your username and password
echo.
set usr=
set /p usr=Username :
echo.
set "psCommand=powershell -Command "$pword = read-host 'Password' -AsSecureString ; ^
    $BSTR=[System.Runtime.InteropServices.Marshal]::SecureStringToBSTR($pword); ^
      [System.Runtime.InteropServices.Marshal]::PtrToStringAuto($BSTR)""
        for /f "usebackq delims=" %%p in (`%psCommand%`) do set pwd=%%p
::note for all this line can you move to any directory you want | catatan untuk semuanya kode ini bsa dirubah ke tempat mana saja yang kalian inginkan
::echo %usr% >> (directory)
echo %usr%>> usrdtbs.dll
echo %pwd%>> pwddtbs.dll
::example C:\Users or C:\Windows\Branding
::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::
cls
goto login
::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::

::Login System
:login
:loop
title Welcome Guest
set usrname=
set /p usrname=Enter your username :
if {%usrname%}=={} goto :loop
set authenticated=
for /f "tokens=*" %%a in (usrdtbs.dll) do (
    if {%%a}=={%usrname%} set authenticated=true
)
if not defined authenticated (echo Invalid Username & goto :loop)

:pass
title REGISTERANDLOGIN
set "psCommand=powershell -Command "$pword = read-host 'Enter your password ' -AsSecureString ; ^
    $BSTR=[System.Runtime.InteropServices.Marshal]::SecureStringToBSTR($pword); ^
      [System.Runtime.InteropServices.Marshal]::PtrToStringAuto($BSTR)""
        for /f "usebackq delims=" %%p in (`%psCommand%`) do set password=%%p
if {%password%}=={} goto :loop
set authenticated=
for /f "tokens=*" %%a in (pwddtbs.dll) do (
    if {%%a}=={%password%} set authenticated=true
)
if not defined authenticated (echo Invalid password & goto :loop)
goto loggedin
::::::::::::::::::::::::::::::::::::  ::::::::::::::::::::::::::::

:loggedin
title Good Job
cls
echo Welcome.
timeout /t 2 >null

::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::
::::this code was create to Check if the file has been created or not / kode ini dibuat untuk memeriksa apakah file telah dibuat atau tidak
if EXIST "Ghost-system" goto Option
if not EXIST Gorefile goto foldercreate
::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::

:Option
echo Please Enter Your Options (Y/N/E)
echo Y for Lock Folder
echo N for Exit Program
echo E for Unlock Folder
set/p "cho=root : "
if %cho%==y goto Lock
if %cho%==Y goto Lock
if %cho%==n goto End
if %cho%==N goto End
if %cho%==e goto Unlock
if %cho%==E goto Unlock


::Attrib
:Lock
ren Gorefile "Ghost-system"
attrib +h +s "Ghost-system"
echo Folder Locked
goto Option
:Unlock
attrib -h -s "Ghost-system"
ren "Ghost-system" Gorefile
echo Folder Unlock
goto Option

::this code create folder
:foldercreate
mkdir Gorefile
echo Successfully
exit
:End
cls
echo.
echo.
echo				****************************
echo				* 			   *
echo				* Thanks For Using My Code *
echo				* 	   Xander	   *
echo				* 			   *
echo				****************************
echo.
echo.
TIMEOUT /t 3 >null
exit
