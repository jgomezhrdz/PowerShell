<#
.SYNOPSIS
 Script que permite listar los discos con un % de ocupacion menor al dado

.DESCRIPTION
 Esta funcion imprime los discos con un porcentaje de ocupacion menor que el introducido como argumento (al ser un porcentaje debe estar acotado entre 0 y 100) en formato nombre y espacio libre en GB.
 
.EXAMPLE
    ./Ejercicio3.ps1 [-freeSpace] 25
#>

param(
    [parameter(Mandatory = $true)][ValidateRange(0, 100)]
    [Int]$freeSpace
)

#Parametro de entrada numérico que representa el porcentaje de ocupación (por eso el valor está restringido entre 0 y 100)
#Listar discos -> filtrar por % de ocupación -> listar mediante una tabla con nombre y porcentaje de ocupacion
Get-WmiObject Win32_LogicalDisk | Where-Object { $($_.FreeSpace * 100 / $_.Size) -lt $freeSpace } | ft Name, @{n = "FreeSpace"; e = { [math]::Round($_.FreeSpace / 1GB) } }