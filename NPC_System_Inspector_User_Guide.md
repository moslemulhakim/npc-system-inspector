**NPC System Inspector - User Guide**

==============================



**INTRODUCTION**

================

Welcome to the NPC System Inspector! This tool is a powerful diagnostic script designed to quickly and efficiently gather comprehensive information about a Windows computer. It collects details on hardware, software, security settings, and system configuration, then compiles everything into a single, professional HTML report.



This guide will walk you through the requirements, different ways to run the tool, and how to interpret the generated report.



**REQUIREMENTS**

================

Before running the tool, please ensure the following requirements are met:

Operating System: Windows 10 or newer (including Windows 11).

Permissions: The script MUST be run with Administrator privileges. This is necessary to access detailed system information from the Windows Management Instrumentation (WMI) and other system areas. The provided batch file handles this automatically.



**HOW TO RUN THE TOOL**

========================

The NPC System Inspector is designed to be flexible and can be run in several ways.



**Method 1: Using the Batch File (Easiest Method)**

This is the simplest and recommended method for all users.

1. Ensure both run-inspector.bat and npc-system-inspector.ps1 are in the same folder.
2. Double-click the run-inspector.bat file.
3. A User Account Control (UAC) prompt will appear asking for administrator permissions. Click Yes.
4. A console window will open and prompt you to enter your name (unless you use command-line parameters). Type your name and press Enter.
5. The script will run, and the final HTML report will be saved in the same folder.



**Method 2: Interactive Mode (Directly with PowerShell)**

This method is for users who are comfortable with PowerShell and prefer to run the script directly.

1. Right-click on the npc-system-inspector.ps1 script file.
2. Select "Run with PowerShell".
3. The script will open a PowerShell window and ask for one piece of information:
     Enter the name of the person collecting this report:
4. Type your name and press Enter.
5. The script will now run, and you will see progress messages in the window. Once it's finished, it will display the full path to the generated HTML report and wait for you to press Enter before closing.



**Method 3: Automated Mode (Using Command-Line Parameters)**

For more advanced use cases, you can run the script from a command prompt (cmd.exe) or PowerShell terminal and use parameters to automate its execution. This works with both the .bat and .ps1 files.



Available Parameters:

\- -CollectedBy <string>: Sets the "Collected By" field in the report.

\- -ShowReport: Automatically opens the generated HTML report in your default web browser.

\- -Silent: Runs the script without showing any progress messages or prompts (except for the final report path).



How to Use:

* Open a Command Prompt or PowerShell terminal as an Administrator.
* Navigate to the directory where you saved the files. For example:

&nbsp;     cd C:\\Users\\Administrator\\Desktop

* Run the script with the desired parameters.



Example Scenarios:

To run the report for a user named "Jane Doe" and open it immediately:

&nbsp; .\\run-inspector.bat -CollectedBy "Jane Doe" -ShowReport

&nbsp; (Using the batch file is recommended)



To run the report completely silently for use in an automation script:

&nbsp; .\\npc-system-inspector.ps1 -CollectedBy "Automated Task" -Silent

&nbsp; (In this case, the script will run without any interactive prompts and simply output the final report path.)



**THE HTML REPORT**

==================

The final output is a single HTML file named \[ComputerName]\_PC\_Full\_Inventory\_Report.html. This file is self-contained and can be easily shared or archived.



The report is organized into collapsible sections. Click on any section header (e.g., "Operating System", "Storage (Drives)") to expand or collapse it.



Key Sections:

* System Summary: An at-a-glance overview of the most critical system components. This section is always visible.
* Operating System: Details about the Windows version, installation date, and activation status.
* Motherboard \& BIOS: Information about the mainboard, BIOS/UEFI version, and security settings like Secure Boot.
* Storage (Drives): A detailed list of all physical storage devices, including their category (SSD, HDD, USB), health status, and size. It also includes a breakdown of all disk partitions.
* Security Status: A crucial overview of the system's security posture, including the active antivirus and firewall, Windows Update status, and BitLocker encryption status.
* Mapped Network Drives \& Shared Folders: Important for security audits, these sections show connections to network resources and what is being shared from the local machine.
* Startup Programs: A list of applications that are configured to run automatically at login.
* Installed Software: A comprehensive list of all installed programs on the system.
* Recent System Errors: A log of the last 20 critical errors from the Windows Event Log, which is invaluable for troubleshooting.



**TROUBLESHOOTING**

==================

Error: "This script requires Administrator privileges..."

Solution: You must run the script as an Administrator. The run-inspector.bat file does this for you automatically. If running the .ps1 file directly, right-click it and choose "Run with PowerShell" (if you are logged in as an admin) or open a PowerShell terminal as an Administrator first.



Storage Health is "N/A" or Category is "Unknown"

Solution: This can happen on some very old hardware or systems with non-standard storage controllers. The script uses the most reliable methods available, but some hardware may not report its S.M.A.R.T. health status or media type correctly.



The script window closes immediately.

Solution: The run-inspector.bat file includes a pause command to prevent this. If running the .ps1 file directly in a non-interactive way, you can ensure the window stays open by running it from an existing PowerShell terminal.



