# Gets the computer name ;)
$Info = Get-ComputerInfo | select-object CsDNSHostName, OsVersion
$Info
# get operating system version
