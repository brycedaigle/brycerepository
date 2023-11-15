# Gets the computer name ;)
$ComputerInfo = Get-ComputerInfo 
# get operating system version

# get disk info
$DiskInfo = Get-Disk

$FreeSpace = Get-PSDrive | Where-Object {$_.Name -eq 'C'}

#Get number of cores
$CPUCore = Get-CimInstance CIM_Processor

# get total memory capacity
$Memory = Get-CimInstance CIM_PhysicalMemory 
$MemorySum = 0
foreach ($item in $Memory) {
    $MemorySum = $MemorySum + $item.Capacity
}
Write-Output $MemorySum

# get cpu usage
$CPUsage = Get-WmiObject Win32_Processor | Select-LoadPercentage

$obj = [PSCustomObject]@{
    ComputerName = $ComputerInfo.CsDNSHostName
    OsVersion = $ComputerInfo.OsVersion
    LogicalDiskCount = $DiskInfo.count
    FreeSpace_GB = $FreeSpace.Free  / 1gb
    CPUCore = $CPUCore.NumberOfCores
    TotalMemory = $MemorySum / 1gb
    CPUsage = $$CPUsage.
}
Write-Output $obj
