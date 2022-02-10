param(
    [parameter(Mandatory=$true)][ValidateRange(0, 100)]
    [Int]$freeSpace
)

Get-WmiObject Win32_LogicalDisk | Where-Object { $($_.FreeSpace * 100 / $_.Size) -lt $freeSpace } | ft Name, @{n="FreeSpace"; e={[math]::Round($_.FreeSpace/1GB)}}