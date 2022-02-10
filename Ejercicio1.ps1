#1024*1024 --> 1 MG
Get-ChildItem | where-object { ($_.length / 1MB) -lt 1} | Sort-Object length