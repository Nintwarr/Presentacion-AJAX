# Pull Requests
Acepto PR en la rama **enhance**, por si alguien quiere.

If you wanto to PR, switch ro branch **enhance**

# Ejemplo de la presentación

En la carpeta **código** están los archivos esenciales para reproducir mi ejemplo
usando AJAX.

Se trata de un chat muy, muy simple que utiliza llamadas AJAX para actualizar
mensajes (todos en cada llamada) y enviar mensajes. Es un chat global de todos
hablando con todos.

También tiene un sistema muy, muy, muy simple de inicio de sesión:

* Introduces un usuario.
	* Si está en la base de datos, se te guarda en la sesión.
	* Si no está en la base de datos se crea uno nuevo y se guarda en la sesión.


## Puntualizaciones

* El chat se actualiza cada 8 segundos y cuando envías un mensaje.
* Al actualizarse recoge todos los mensajes. Es ineficiente.
* La respuesta de las llamadas AJAX son directamente HTML. Es cutre. Podría recibir sólo la información estrictamente necesaria.
* Algo más que se me escapará.

# Para reproducir el ejemplo

Lo más rápido es hacerlo sobre **Docker**.

### Si no tienes **Docker**
* Averigua cómo instalar **Docker** para tu sistema.
* Descárgate un stack XAMP. Yo descargué [este LAMP](https://github.com/sprintcube/docker-compose-lamp).

### Si tienes **Docker**
* Antes de arrancarlo es conveniete instalarle el motor de plantillas Twig.
	* Para ello copiamos el contenido del fichero del repositorio *`./código/bin/webserver/Dockerfile`* y lo copiamos **al final** de nuestro fichero *`docker-compose-lamp/bin/webserver/Dockerfile`*
	* Si ya habéis arrancado con la orden `docker-compose-up`:
		* Si lo habéis hecho con la opción `-d`, ejecutad `sudo docker-compose down`,
		* Si **NO** habéis utilizado la opción `-d`, parad la ejecución con `ctrl + c` o `ctrl + d` y esperad a que se pare.
		* Ahora hacer `sudo docker-compose build`.

* Para enterarnos mejor de la comunicación entre contenedores, he creado una red virtual y le he asignado una ip a cada contenedor. Fíjate en el archivo *`./código/docker-compose.yml`* y haz los cambios pertinentes en tu fichero fijándote al inicio del archivo y cuando se use el campo `networks`.

### Configuración de la base de datos

Si queremos que phpmyadmin tenga la página de login y, por tanto, podamos acceder
como root (por defecto en este LAMP el usuario es `root` y la contraseña `tiger`),
tenemos que cambiar la configuración de phpmyadmin.

Para ello hay creado un volúmen a un archivo de configuración en el *`docker-compose.yml`*.
Para que esto funcione debemos copiar el contenido del directorio
*`./código/config`* a nuestro *`docker-compose-lamp/config`*.
Y también copiamos la variable *LPWD* que se declara en *`./código/.env`* al final de nuestro
fichero *`docker-compose-lamp/.env`*.

No nos podemos olvidar de copiar la declaración del volúmen que se encuentra en el fichero `docker-compose.yml` para el contenedor de phpmyadmin.

Así podremos crear bases de datos o manipular la existente.

### Importar la base de datos

Vamos a usar *phpmyadmin* así que toca arrancar el *docker-compose*.

Arrancamos con:
```
# Este comando toma control de la terminal
sudo docker-compose up

# Este se queda en segundo plano
sudo docker-compose up -d

# Para ver el log si lo dejamos en segundo plano
sudo docker-compose logs
```

Ahora accedemos a *phpmyadmin* a través de:

	localhost:8080

El usuario root y contraseña por defecto en este LAMP son:
```
# Usuario
root
# Contraseña
tiger
```

Nos fijamos en la opción *import* o *importar* del panel superior.

Buscamos el arhivo `./código/chat_prueba.sql`, aceptamos y le damos a *go* al final de la página.

### El código de la página

La chicha, el código, está en:

	./código/www

Podemos copiar esa carpeta a nuestro *docker-compose-lamp* o la subcarpeta *www/Presentacion-AJAX*.

Lo importante es que se mantenga la ruta:

	docker-compose-lamp/www/Presentacion-AJAX

## Abrir el chat

Una vez esté todo andando ponemos en el navegador:

	localhost/presentacion-AJAX/index.php

Y ya estaría
