if ( -not (test-path  C:/salt) ) {
    "Installing Saltstack Python3"
    &'.\salt-bootstrap.ps1' -pythonVersion 3
}
$env:CURRENT_USER = "$(get-location)"
"current location: $env:CURRENT_USER"
"Executing SaltStack"
&'C:\salt\salt-call.bat' --local --file-root=%CD% state.highstate