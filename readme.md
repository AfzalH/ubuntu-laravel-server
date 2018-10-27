# docker file to build image containing ubuntu 18.04 with php7.2-fpm, nginx and supervisor
This is specially designed to run latest laravel

## instructions
Go to your laravel directory and run

```
docker run -v $(pwd):/var/www/html/ -p 81:80 -d afzalh/ubuntu-laravel-server 
```

Then go to http://localhost:81