NET SESSION
IF %ERRORLEVEL% NEQ 0 GOTO ELEVATE
GOTO ADMINTASKS

:ELEVATE
CD /d %~dp0
ECHO "You need to RUN Me as administrator Right Click -> Run as Admin"
GOTO EXIT

:ADMINTASKS
cd %~dp0
timeout 10
SET EXECUTION_PATH=%CD%
powershell -File %CD%/support/startup.ps1


:EXIT




