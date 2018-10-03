# Laravel

Dockerize your laravel application 

##  Laravel Docker-example
This example combines Nginx and PHP-FPM in one package
and uses a task scheduler to instantiate the background processes \
The docker way is to seperate different services into different containers - 
in this case one container has nginx and php-fpm in another \
I ran into some issues with this approach - When deploying updates to the solution files I had to update both the nginx and php-fpm container. \
Another issue I had was the need to restart nginx / php-fpm when deploying a new updated solution. \
I felt this was a problem, so I decided to setup my own simple container with what's needed to get a laravel solution up'n'running (and working in production) 
## Prerequisites: 
 * Laravel installation
 * .env file -> this is probably an path variable in your pipeline
 * Database (using the compose should start up a mysqldatabase channge the variables to your needs)
## How to use 
 The bitbucket-pipelines.yml is an example - this could also be travis, gitlab or something alike (in their syntax), I'll probably add these later on \
 Add these files to your laravel installation, change the environment variables to fit your needs \
 execute \
 ``` bash
 docker-compose up -f docker-compose.dev.yml
 ```
For Development - 
Rather than rebuilding our images, We'll just mount the laravel application folder \
``` bash
docker build -t application-name . -f deploy/app.dev.docker 
docker run --rm -v ./var/www -p 8080:80 application-name
```
or just start the docker-compose file :-) \
## for Production - 
We copy the files into the container
``` bash
 docker build -t application-name . -f deploy/app.prod.docker 
```

