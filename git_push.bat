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
