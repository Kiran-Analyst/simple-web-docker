
#### Build and run using Docker File

1. build the docker image
```
docker build -f Dockefile.dev .
```
2. run the image  container 
```
docker run -it -p 3000:3000 <image id>
```

3. mount the code to reflect code changes

```
docker run -it -p 3000:3000 -v $(pwd):/app/ <image id>
```
 node js gives error while running like this. "sh: react-scripts: not found"

4. update node_modules which is dependencies directory as placeholder (not refer from local)
```
docker run -it -p 3000:3000 -v $(pwd):/app/ -v /app/node_modules f00078ba8a6e
```

5. override the default command
Run test instead of start 
```
# build and tag the image
docker build --rm -f Dockerfile.dev -t react-web .

# run image with override command
docker run -it -p 3000:3000 react-web npm run test

# mount volumes to reflect test updates as well
docker run -it -p 3000:3000 -v $(pwd):/app/ -v /app/node_modules react-web npm run test
```

6. Attach running container command with override command 

```
docker exec -it <container id> npm run test
```

#### Building docker compose file and run

1. run docker compose file
``` 
docker-compose up
```

2. Add Test service with override command
```
# copy react service and name as test and add command 
command: ["npm, "run","test"]

# run docker-compose
docker-compose up
```

#### Multi Step Build process

1. Use node:alpine to build the application
2. Use nginx to host the web application

**Refer the docker file for information**

```
docker build --rm -t react-web-nginx .

#nginx default port 80
docker run -p 8080:80 react-web-nginx
```



