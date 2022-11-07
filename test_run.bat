@echo off
set mypath=%cd%
:: Section 1: Activate Python Virtual environment
echo ==========================
echo Activating Python Virtual environment
echo ============================
call %mypath%/ui_test/Scripts/activate
:: Section 2: run robot test scripts
echo ==========================
echo run robot test scripts
echo ============================
call  %mypath%/dependency.bat
call robot -d Results/%date:~-10,2%_%date:~-7,2%_%date:~-4,4%_Result %mypath%/TestCases/Login_Page.robot