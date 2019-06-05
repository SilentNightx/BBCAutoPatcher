@ECHO off
ECHO -------------------------------------------------------------------------------------------------------------------
ECHO BBCAutoPatcher V1.0 by SilentNightxxx and Greatness7
ECHO -------------------------------------------------------------------------------------------------------------------
ECHO This will create an auto patch for your current load order and Better Balanced Combat.
ECHO 1. Auto patches are not a replacement for hand crafted patches.
ECHO 2. Make sure to sort your load order before continuing.
ECHO 3. It cannot detect OpenMW load orders so also make sure to copy your OpenMW load order to the original Morrowind if
ECHO using OpenMW.
ECHO -------------------------------------------------------------------------------------------------------------------
PAUSE
ECHO Generating patch...
MKDIR bbcbackups || goto :errornewdir
tes3cmd modify -backup-dir bbcbackups -hide-backups -program BBCAutoPatcher.pl || goto :errormodify
tes3cmd header -backup-dir bbcbackups -hide-backups -synchronize BBC_Auto_Patch.esp || goto :errorheader
RMDIR bbcbackups /s /q || goto :errordeletedir
ECHO -------------------------------------------------------------------------------------------------------------------
ECHO Done!
ECHO Your load order patch was saved as BBC_Auto_Patch.esp.
ECHO Activate and load it after everything else.
ECHO -------------------------------------------------------------------------------------------------------------------
PAUSE
goto :EOF

:errornewdir
echo Failure. Error creating bbcbackups temporary folder.
PAUSE
EXIT

:errormodify
echo Failure. Error modifying records in patch file.
PAUSE
EXIT

:errorheader
echo Failure. Error modifying header in patch file.
PAUSE
EXIT

:errordeletedir
echo Failure. Error deleting bbcbackups temporary folder.
PAUSE
EXIT