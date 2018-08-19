"Inventorying the system..."
$nat_switches =  get-vmswitch | where-object -property Name -eq NATSwitch
$net_ipaddress = get-netipaddress | where-object -Property InterfaceAlias -like '*NATSwitch*'
$net_nat = Get-NetNat
"Removing config required.."
$nat_switches | remove-vmswitch -Force | Out-Null
$net_ipaddress | Remove-NetIPAddress -AsJob | Out-Null
$net_nat | Remove-NetNat -AsJob | Out-Null
start-sleep -Seconds 5
"Adding back in config..."
New-VMSwitch -SwitchName "NATSwitch" -SwitchType Internal | Out-Null
$nat_adapter = Get-NetIPAddress -AddressFamily IPv4 | where-object -property InterfaceAlias -like '*NATSwitch*'
New-NetIPAddress -IPAddress 192.168.0.1 -PrefixLength 24 -InterfaceAlias "vEthernet (NATSwitch)" | Out-Null
New-NetNat -Name "NATSwitch" -InternalIPInterfaceAddressPrefix 192.168.0.1/24 | Out-Null
"Done."
""
"changed=yes comment='Updated'"