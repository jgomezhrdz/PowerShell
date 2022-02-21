function procesarInput {
    #Permite recoger la entrada del usuario y redirigir la opcion a la funcion adecuada
    
    do {
        printMenu
        $input = Read-Host "Selecciona una opcion"
        switch($input){
            1 {
                Clear-Host
                listarServicios
            } 2 {
                Clear-Host
                mostrarFecha
            } 3 {
                Clear-Host
                ejecutarBloc
            } 4 {
                Clear-Host
                ejecutarCalculadora
            } 5 {
                Write-Host "Bye."
            } default {
                Write-Host "El valor debe estar comprendido entre 1 y 5. Escoja de nuevo la opción"
                printMenu
            }
        }
    } until ($input -eq 5)
}

function listarServicios {
    #Permite listar los procesos en ejecución en orden de uso de CPU
    
    Get-Process | Sort-Object CPU -Descending | ft Id, Handles, CPU, ProcessName, Description -auto
    pause
}

function mostrarFecha {
    #Permite mostrar la fecha actual
    
    Get-Date
    pause
}

function ejecutarBloc {
    #Permite ejecutar el bloc de notas
    
    Start-Process -FilePath "notepad" | Wait-Process
    pause
}

function ejecutarCalculadora {
    #Permite ejecutar la calculadora
    
    Start-Process -FilePath "calc" | Wait-Process
    pause
}

function printMenu {
    #Imprime por pantalla un menú propio para escoger la opción adecuada
    
    Write-Host "1. Listar los servicios arrancados."
    Write-Host "2. Mostrar la fecha del sistema."
    Write-Host "3. Ejecutar el Bloc de notas."
    Write-Host "4. Ejecutar la Calculadora."
    Write-Host "5. Salir."
}


#Llamada principal del script para ejecutar las funciones anteriores
procesarInput



