rem	------------------------------------------------------------------------------------------------------------------------------------------------
rem		Step 1: Refer "1.	Managing Your Server Code" part at Kii_Specifications\Kii_Configurations\Kii_Configurations.docx file
rem		Step 2: put your configurations with your application for getting log
rem		Step 3: run this .bat file
rem	------------------------------------------------------------------------------------------------------------------------------------------------
rem 	Refer: 
rem			-	http://docs.kii.com/en/guides/commandlinetools/devlog/#usage

@ECHO OFF
CLS

rem ================================
rem  	Initialize: please fill "your_" parameters with your data
rem ================================

rem Your notepadd++ on Window system
set notepadPlusPlusAppLocation="C:\Program Files (x86)\Notepad++\notepad++.exe"

set kiiDeveloperLogFodder=%cd%\kii-cli 
set KiiLogFile="D:\KiiServerCodeLogFile.txt"		
set ServerCodeFilePath="D:\your_server_code_path\servercode.js"
set HookConfigFilePath="D:\your_hookConfig_path\hookConfig\hookConfig.json"

echo %kiiDeveloperLogFodder%

del %KiiLogFile%

set APP_ID=your_app_id
set APP_KEY=your_app_key
set CLIENT_ID=your_client_id
set CLIENT_SECRET=your_client_secret

set KiiSite=jp
set dateFrom=2015-11-18
set dateTo=2018-11-18
set codeVersion=your_code_version
set userId=your_user_id

set expectedLogLinesNumber=1500

set appKeys=--site %KiiSite% --app-id %APP_ID% --app-key %APP_KEY%  --client-id %CLIENT_ID%  --client-secret %CLIENT_SECRET% 
set fromDateToDate=--date-from %dateFrom% --date-to %dateTo%
set userIdCommand=--user-id %userId%
set expectedLogLinesCommand=--num %expectedLogLinesNumber%
set infoLevelCommand=--level INFO
set debugLevelCommand=--level DEBUG
set errorLevelCommand=--level ERROR


rem ================================
rem  	WORKING: un-command your expected command line
rem ================================

rem Try to delete the file only if it exists
IF EXIST %KiiLogFile% del /F %KiiLogFile%

rem Go to Kii Developer Log folder
cd /d %kiiDeveloperLogFodder%

rem -----------------------------------------------------------------------------------

set currProjectName="Script for Kii Cloud Server Code"

set option_1="Get Kii log"
set option_2="Deploy Server Code"
set option_3="List the Available Versions"
set option_4="Get your Server Code"
set option_5="Get Server Hook Config File"
set option_6="List Server Code Execution Results"
set option_7="Get the Detailed Execution Result"
set option_8="NA"
set option_9="NA"

title %currProjectName% project

ECHO 1) %option_1%
ECHO 2) %option_2%
ECHO 3) %option_3%
ECHO 4) %option_4%
ECHO 5) %option_5%
ECHO 6) %option_6%
ECHO 7) %option_7%
ECHO 8) %option_8%
ECHO 9) %option_9%

ECHO.

CHOICE /C 123456789 /M "Enter your choice:"

:: Note - list ERRORLEVELS in decreasing order
IF ERRORLEVEL 9 GOTO option_9
IF ERRORLEVEL 8 GOTO option_8
IF ERRORLEVEL 7 GOTO option_7
IF ERRORLEVEL 6 GOTO option_6
IF ERRORLEVEL 5 GOTO option_5
IF ERRORLEVEL 4 GOTO option_4
IF ERRORLEVEL 3 GOTO option_3
IF ERRORLEVEL 2 GOTO option_2
IF ERRORLEVEL 1 GOTO option_1


:option_1
ECHO %option_1%
rem Get Kii log
node bin/kii-logs.js -t %appKeys% > %KiiLogFile%
GOTO End

:option_2
ECHO %option_2%
rem Deploy Server Code ==> Make sure that you update 2 files: KiiServerCode/servercode.js & KiiHookConfig/hookConfig.json
node bin/kii-servercode.js deploy-file --file %ServerCodeFilePath% %appKeys% --hook-config %HookConfigFilePath%
GOTO End

:option_3
ECHO %option_3%
start "" %folderLocation_3%
rem List the Available Versions
node bin/kii-servercode.js list %appKeys% > %KiiLogFile%
GOTO End

:option_4
ECHO %option_4%
rem Get your Server Code
node bin/kii-servercode.js get --code-version %codeVersion% %appKeys% --output-file %KiiLogFile%
GOTO End

:option_5
ECHO %option_5%
rem Get Server Hook Config File
node bin/kii-servercode.js get-hook-config --code-version %codeVersion% %appKeys% --output-file %KiiLogFile%
GOTO End


:option_6
ECHO %option_6%
rem List Server Code Execution Results
node bin/kii-servercode.js list-scheduled-execution  --client-secret %appKeys% %fromDateToDate% --utc-time > %KiiLogFile%
GOTO End

:option_7
ECHO %option_7%
rem Get the Detailed Execution Result
node bin/kii-servercode.js get-scheduled-execution %appKeys% --id %codeVersion% > %KiiLogFile%
GOTO End


:option_8
ECHO %option_8%

GOTO End


:option_9
ECHO %option_9%

GOTO End


:End


rem ================================
rem  	READ OUTPUT FILE
rem ================================

rem Open %KiiLogFile% by Notepad++
%notepadPlusPlusAppLocation% %KiiLogFile%


