@echo off
:: ============================================================================
:: NPC System Inspector - Batch File Runner
:: Author: Moslemul Hakim
:: Version: 1.0
::
:: This batch file simplifies running the npc-system-inspector.ps1 script.
:: It performs the following actions:
:: 1. Checks for Administrator privileges.
:: 2. If not running as admin, it re-launches itself with an administrator
::    prompt (UAC).
:: 3. Executes the PowerShell script located in the same directory.
:: 4. Passes any command-line arguments from this batch file to the script.
:: 5. Keeps the window open after the script finishes to show the result.
:: ============================================================================

:: Check for Administrator privileges
>nul 2>&1 "%SYSTEMROOT%\system32\cacls.exe" "%SYSTEMROOT%\system32\config\system"
if '%errorlevel%' NEQ '0' (
    echo Requesting administrative privileges to run the system scan...
    goto UACPrompt
) else (
    goto gotAdmin
)

:UACPrompt
    echo Set UAC = CreateObject^("Shell.Application"^) > "%temp%\getadmin.vbs"
    set params = %*:"="
    echo UAC.ShellExecute "cmd.exe", "/c ""%~s0"" %params%", "", "runas", 1 >> "%temp%\getadmin.vbs"
    "%temp%\getadmin.vbs"
    del "%temp%\getadmin.vbs"
    exit /B

:gotAdmin
    :: Change the current directory to the location of the batch file
    pushd "%~dp0"
    
    echo Starting the NPC System Inspector...
    echo.
    
    :: Execute the PowerShell script, bypassing the execution policy for this process
    :: and passing all batch file arguments (e.g., -CollectedBy, -ShowReport)
    powershell.exe -NoProfile -ExecutionPolicy Bypass -File "npc-system-inspector.ps1" %*
    
    echo.
    echo Script execution finished.
    
    :: Return to the original directory
    popd
    pause
