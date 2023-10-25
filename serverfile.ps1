# Gets the computer name ;)
$Info = Get-ComputerInfo | select-object CsDNSHostName, OsVersion
$Info
# get operating system version

# get disk info
$DiskInfo = Get-Disk
$DiskInfo.count 

$obj = [PSCustomObject]@{
    ComputerName = $ComputerInfo.CsDNSHostName
    OsVersion = $ComputerInfo.OsVersion
    LogicalDiskCount = $DiskInfo.count
}
Write-Output $obj
