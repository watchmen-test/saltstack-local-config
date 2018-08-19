powershell -noexit -File %CD%/support/salt-bootstrap.ps1 -pythonVersion 3
@elevate C:\salt\salt-call.bat --local --file-root=%CD% state.apply saltstack