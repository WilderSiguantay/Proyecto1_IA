# Proyecto1_IA
 Proyecto 1 de Inteligencia Artificial 1


## INSTALAMOS EXPRESS
Lo instalamos de tal forma que aparezca en nuestras dependencias, para eso se usa el -D
`npm install express -D`
`npm install express-generator -D`
tambien hay que instalarlo de forma global para que se pueda utilizar sin necesidad de instalarlo una y otra vez.

### Creamos nuestro proyecto Express
`express <<Nombre_del_proyecto>>` 
Esto nos va a crear todos los archivos necesarios y carpetas para iniciar el proyecto



## Instalar Nodemon (ya no se hace)

`npm install nodemon -D`

Esto sirve para no estar deteniendo e iniciando el servidor cuando hacemos un cambio. 

despues de instalar nodemon agregamos al package.json

`"npx nodemon src/index.js" `

e iniciamos con 

`npm start`

## INSTALAMOS NODE
Entramos a la carpeta que se creo, con el comando anterior e instalamos express

`npm install`
## INSTALAMOS MANEJADOR DE PLANTILLAS EJS
Por defecto trae el manejador jade, pero vamos a cambiarlo y usar ejs por motivos de tiempo
para instalar este manejador de plantillas necesitamos los siguientes comandos
`npm install ejs -D`
`npm install ejs-mate -D`
