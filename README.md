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

##### Configuración del repositorio local

Agregar la siguiente configuración al archivo ```.git/config```:

```
[remote "heroku"]
  url = git@heroku.com:api-dgose.git
  fetch = +refs/heads/*:refs/remotes/heroku/*
```

##### Push

**Si ya estas familiarizado con Heroku puedes saltarte esta parte.**

* Push
```$ git push heroku master``` o ```$ git push heroku master --force```
