@echo off
title utFolderSwitcher
:initCheck
cls
echo Checking for user folders...
cd %appdata%
if NOT EXIST "aiden99 software" goto initialSetup
cd "aiden99 software"
if NOT EXIST utSaveManager goto initialSetup
cd utSaveManager
if NOT EXIST vRecord goto resetData
cd vRecord
if NOT EXIST Game goto resetData
if NOT EXIST Save goto resetData
cd ..
if NOT EXIST Records mkdir Records
echo Check passed.
goto main

:initialSetup
cls
echo --utSaveManager Setup-------------------------------------
echo # Welcome to utSaveManager.                              #
echo # This is a save manager for Undertale.                  #
echo # Press the number next to the button you want to press. #
echo #                                                        #
echo # 1. Migrate from utFolderSwitcher                       #
echo # 2. What is this?                                       #
echo # 3. Begin setup                                         #
echo # 4. Exit                                                #
echo -------------------------------------------------Welcome--
choice /c 1234 /n
if %ERRORLEVEL%==1 goto migrateFromOldProgram
if %ERRORLEVEL%==2 goto whatIsThis
if %ERRORLEVEL%==3 goto initialSetupStep0
if %ERRORLEVEL%==4 exit
goto initialSetup

:migrateFromOldProgram
cls
echo --utFolderSwitcher to utSaveManager-----------------------------------
echo # This will move all Records from utFolderSwitcher to utSaveManager. #
echo # You should back up utFolderSwitcher data.                          #
echo #                                                                    #
echo # 1. Begin migration                                                 #
echo # 2. Show utFolderSwitcher data in File Explorer                     #
echo # 3. Back to Setup                                                   #
echo -------------------------------------------------Migration Assistant--
choice /c 123 /n
if %ERRORLEVEL%==1 goto beginMigrationFromOldProgram
if %ERRORLEVEL%==2 start "%appdata%"\"Aiden99 Software"\utFolderSwitcher\
if %ERRORLEVEL%==3 goto initialSetup
goto migrateFromOldProgram

:beginMigrationFromOldProgram
cls
echo --utFolderSwitcher --> utSaveManager--
echo This function is not available yet.
pause >nul
goto migrationFromOldProgram

:whatIsThis
cls
echo --What is utSaveManager?-----------------------------------------------------
echo # utSaveManager is a save manager for Undertale.                            #
echo # It works using "Records".                                                 #
echo # Records are backups of your copy of Undertale's save file and game data.  #
echo # You can create a new Record from your current Undertale data, and then    #
echo # load another Record to play a different save file and/or a different mod. #
echo #                                                                           #
echo # Press any key to return to Setup.                                         #
echo -----------------------------------------------------------------------------
pause >nul
goto initialSetup

:initialSetupStep0
cls
echo --utSaveManager Setup--
echo Creating folders...
cd %appdata%
if NOT EXIST "aiden99 software" mkdir "aiden99 software"
cd "aiden99 software"
if EXIST utSaveManager goto initialSetupStep1AlreadySetUp
mkdir utSaveManager
cd utSaveManager
mkdir vRecord
mkdir Records
cd vRecord
mkdir Game
cd ..

:initialSetupStep1
cls
echo --utSaveManager Setup--------------------------------
echo # It's now time to make your first Record.          #
echo # This first record is called a vRecord, because it #
echo # will act as a fresh slate so you don't have to    #
echo # keep reinstalling Undertale when you want to      #
echo # start a new save.                                 #
echo #                                                   #
echo # Make sure Undertale is installed.                 #
echo #                                                   #
echo # Do you have mods installed for Undertale?         #
echo # Do you have a save file in Undertale right now?   #
echo #                                                   #
echo # Y. Yes                                            #
echo # N. No                                             #
echo -----------------------------------------------------
choice /c YN /n
if %ERRORLEVEL%==1 goto initialSetupStep1UndertaleModded
if %ERRORLEVEL%==2 goto initialSetupStep2
goto initialSetupStep1

:initialSetupStep1UndertaleModded
cls
echo --utSaveManager Setup
echo Creating Record...
cd %appdata%\"aiden99 software"\utSaveManager\Records
mkdir initSetupBackup
cd initSetupBackup
mkdir Save Game
cd C:\"Program Files (x86)"\Steam\steamapps\common\
copy /V /Y UNDERTALE "%appdata%"\"aiden99 software"\utSaveManager\Records\Game\
cd "%localappdata%"
copy /V /Y UNDERTALE "%appdata%"\"aiden99 software"\utSaveManager\Records\Save\
echo Record complete!
echo Wiping current data...
rmdir UNDERTALE /s /q
cd C:\"Program Files (x86)"\Steam\steamapps\common\
rmdir UNDERTALE /s /q
cls
echo --utSaveManager Setup-------------------------------------------------
echo # A Record has been created. You can load it again later.            #
echo # Please reinstall Undertale.                                        #
echo # To do so, open Steam and right click on Undertale in your library. #
echo # Click "Uninstall" and then install Undertale again.                #
echo # When you're done, press any key.                                   #
echo ----------------------------------------------------------------------
pause >nul
goto initialSetupStep2

:initialSetupStep2
cls
echo --utSaveManager--
echo The vRecord is being created.
cd C:\"Program Files (x86)"\Steam\steamapps\common\
if NOT EXIST UNDERTALE exit
copy /V /Y UNDERTALE "%appdata%"\"aiden99 software"\utSaveManager\vRecord\
echo vRecord created.
cls
echo --utSaveManager Setup--------------------------------
echo # Setup is complete! You can now use utSaveManager. #
echo # Press any key to go to the main menu.             #
echo -----------------------------------------------------
pause >nul
goto main

:initialSetupStep1AlreadySetUp
goto resetData

:resetData
cls
echo --Error!---------------------------------------------------
echo # Data for utSaveManager was found, but it is incomplete. #
echo # You will have to wipe utSaveManager's data.             #
echo #                                                         #
echo # 1. Wipe                                                 #
echo # 2. Exit                                                 #
echo -----------------------------------------------------------
exit





:main
cls
echo --utSaveManager--------------
echo # Welcome to utSaveManager! #
echo # 1. New Record             #
echo # 2. Load Record            #
echo # 3. Load vRecord           #
echo # 4. Delete Record          #
echo # 5. List Records           #
echo # 6. Settings               #
echo # 7. Exit                   #
echo -----------------------------
choice /c 1234567 /n
if %ERRORLEVEL%==1 goto newRecord
if %ERRORLEVEL%==2 goto loadRecord
if %ERRORLEVEL%==3 goto loadvRecord
if %ERRORLEVEL%==4 goto deleteRecord
if %ERRORLEVEL%==5 goto listRecords
if %ERRORLEVEL%==6 goto settings
if %ERRORLEVEL%==7 exit
goto main

:newRecord
cls
echo --New Record-------------------------
echo # Enter a name for your new Record. #
echo -------------------------------------
set/p "recordname="
cd "%appdata%"\"aiden99 software"\utSaveManager\Records\
mdkir "%recordname%"
cd "%recordname%"
mkdir Save Game
cd "%localappdata%"
copy /V /Y UNDERTALE "%appdata%"\"aiden99 software"\utSaveManager\Records\"%recordname%"\Save\
cd C:\"Program Files (x86)"\Steam\steamapps\common\
copy /V /Y UNDERTALE "%appdata%"\"aiden99 software"\utSaveManager\Records\"%recordname%"\Game\
echo Record created! Press any key to return to the main menu...
pause >nul
goto main

:loadRecord
cls
echo --Load Record-------------------------------------
echo # Enter the name of the Record you want to load. #
echo --------------------------------------------------
set/p "recordname="
cd %appdata%\"aiden99 software"\utSaveManager\Records
if NOT EXIST "%recordname%" goto main
cd C:\"Program Files (x86)"\Steam\steamapps\common\
if EXIST UNDERTALE rmdir UNDERTALE /s /q
copy /V /Y "%appdata%"\"aiden99 software"\utSaveManager\Records\"%recordname%"\Game\UNDERTALE C:\"Program Files (x86)"\Steam\steamapps\common\
cd %localappdata%
if EXIST UNDERTALE rmdir UNDERTALE /s /q
copy /V /Y "%appdata%"\"aiden99 software"\utSaveManager\Records\"%recordname%"\Save\UNDERTALE "%localappdata%"\
echo Loading complete.
echo Press any key to return to the main menu.
pause >nul
goto main


:loadvRecord
cls
echo --Load vRecord--
echo Loading vRecord...
cd %localappdata%
if EXIST UNDERTALE rmdir UNDERTALE /s /q
cd C:\"Program Files (x86)"\Steam\steamapps\common\
if EXIST UNDERTALE rmdir UNDERTALE /s /q
copy /V /Y "%appdata%"\"aiden99 software"\utSaveManager\vRecord\UNDERTALE C:\"Program Files (x86)"\Steam\steamapps\common\
echo Done!
echo Press any key to return to the main menu.
pause >nul
goto main

:deleteRecord
cls
echo --Delete Record-------------------------------------
echo # Enter the name of the Record you want to delete. #
echo ----------------------------------------------------
set/p "recordname="
exit

:listRecords
cd "%appdata%"\"aiden99 software"\utSaveManager\Records\
cls
echo --List Records--
dir/b
echo.
echo Press any key to return to the main menu.
pause >nul
goto main

:settings
cls
echo --Settings-------------
echo # 1. Recreate vRecord #
echo # 2. Reset data       #
echo # 3. Back             #
echo -----------------------
if %ERRORLEVEL%==1 goto recreatevRecord
if %ERRORLEVEL%==2 goto resetDataB
if %ERRORLEVEL%==3 goto main
goto settings