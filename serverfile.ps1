# Gets the computer name ;)
$Info = Get-ComputerInfo | select-object CsDNSHostName

$Info