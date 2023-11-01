# Gets the computer name ;)
$ComputerInfo = Get-ComputerInfo 
# get operating system version

# get disk info
$DiskInfo = Get-Disk

$FreeSpace = Get-PSDrive | WhereObject {$_.Name -eq 'C'}

$obj = [PSCustomObject]@{
    ComputerName = $ComputerInfo.CsDNSHostName
    OsVersion = $ComputerInfo.OsVersion
    LogicalDiskCount = $DiskInfo.count
    FreeSpace = $FreeSpace.Free 
}
Write-Output $obj
