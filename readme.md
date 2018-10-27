# Docker file to build image containing ubuntu 18.04 with php7.2-fpm, nginx and supervisor
This is specially designed to run laravel

## Instructions
Go to your laravel directory and run

```
docker run -v $(pwd):/var/www/html/ -p 81:80 -d afzal22/ubuntu-laravel-server 
```

Then go to `http://localhost:81`