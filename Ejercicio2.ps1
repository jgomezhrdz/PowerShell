#Directorio actual -> listar archivos de tipo jpg -> renombrar con el formato de fecha
Get-Location | Get-ChildItem *.jpg | Rename-Item -NewName { $(Get-Date -Format "yyyyMMdd") + "-" + $_.Name }