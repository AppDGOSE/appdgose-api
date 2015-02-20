# API-DGOSE

### Requisitos

* Ruby version: '2.1.0'
* Rails version: '4.0.3'

### Instalación del ambiente de desarrollo
##### Linux/MacOSX

```$ bundle install```

```$ rake db:schema:load```

### Documentacion

El proyecto esta documentado con **YARD**.

```
$ yard doc
````

```
$ yard server

```
### Tests

```$ rake cucumber```

### Scheduler

Para sincronizar los becarios registrados con los usuarios de la API, se ejecuta un scheduler cada día.
El código se encuentra en: ```lib/tasks/scheduler.rake```

### Instrucciones para subir cambios

##### Bajar el repositorio de heroku

 heroku git:clone -a api-dgose

##### Push

**Si ya estas familiarizado con Heroku puedes saltarte esta parte.**

El proyecto esta hecho para que en un branch local se tengan las credenciales de la BD, no deben de estar en github.
Por ejemplo, puedes crear un branch llamado heroku y hacer deployment a la nube de heroku basta con el siguiente comando:

* Push
```$ git push heroku heroku:master```
