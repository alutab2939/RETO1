#Bloqueo de cuentas 
#Se configura para que se bloquee si se falla al intento 3.
net accounts /lockoutthreshold:3
#Duración del bloqueo 60 minutos
net accounts /lockoutduration:120
#Ventana de bloqueo (tiempo en minutos antes de que se restablezca el contador de intentos fallidos de contraseña )
net accounts /lockoutwindow:60
#Establecer los dias máximos para cambiar el password, ejempo 60 días.
net accounts /maxpwage:14
#Establecer los dias mínimos para cambiar el password, ejempo 2 días.
net accounts /minpwage:1
#Establecer la longitud mínima del password, ejemplo: 8
net accounts /minpwlen:8

#Para consultar la configuración de los parámetros establecidos
net accounts 
