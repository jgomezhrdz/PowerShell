#Directorio actual -> listar -> filtrar -> ordenar por longitud
Get-ChildItem | where-object { ($_.length / 1KB) -gt 1} | Sort-Object length