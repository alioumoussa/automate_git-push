## Automating Git Commands with `git_push.bat`

### Overview

This script automates the process of adding, committing, and pushing changes to a Git repository. It allows you to quickly execute these commands from any directory by running a single command.

### Setup Instructions

1. **Create the Script:**
   - Create a file named `git_push.bat` and add the following content:

     ```bat
     @echo off
     setlocal enabledelayedexpansion

     if "%~1"=="" (
       echo You must provide a commit message.
       exit /b 1
     )

     set "commit_message=%~1"
     shift
     :loop
     if "%~1" neq "" (
       set "commit_message=!commit_message! %~1"
       shift
       goto :loop
     )

     git add .
     git commit -m "%commit_message%"
     git push
     ```

   - Save this file in a directory, for example, `C:\Scripts`.

2. **Add the Script Directory to PATH:**
   - To run the script from any directory, add the directory containing `git_push.bat` to the system's PATH environment variable:

     - **Windows 10/11:**
       1. Press `Win + R`, type `sysdm.cpl`, and press `Enter`.
       2. In the System Properties window, go to the "Advanced" tab and click on "Environment Variables".
       3. Under "System variables", find the "Path" variable, select it, and click "Edit".
       4. Click "New" and add the path to the directory where you saved `git_push.bat` (e.g., `C:\Scripts`).
       5. Click "OK" to close all dialogs.

   - **Note:** Restart any open Command Prompt windows to apply the changes.

3. **Usage:**
   - Navigate to any Git repository in Command Prompt and run the script with your commit message:

     ```cmd
     git_push "Your commit message"
     ```

   - The script will automatically add all changes, commit them with the provided message, and push them to the remote repository.

### Example Usage

```cmd
git_push "Added a new feature to improve performance"
