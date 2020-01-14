This project creates an image from a [Docerfile](Dockerfile) that contains Java 8
development environment. The idea is that you can use this image to build and run java projects.

#### How to build the image:
```
docker build --tag java-platfrom .
```

#### How to use:
- Clone java project:
```
git clone https://github.com/yessergire/SpringApp ../spring-app
cd ../spring-app
```

- Compile the project using the created image:
```
docker run --rm -v $(pwd):/apps java-platfrom mvn package
```

- Run project using the image:
```
docker run --rm -d -v $(pwd):/apps -p 8080:8080 java-platfrom java -jar target/MyApp-1.0-SNAPSHOT.jar
```

#### Maven repository
To save the maven repositories into local machine add this argument
```
-v $HOME/.m2:/root/.m2
```
For example:
- Compile the project using the image:
```
docker run --rm -v $HOME/.m2:/root/.m2 -v $(pwd):/apps java-platfrom mvn package
```
- Run project:
```
docker run --rm -d -v $HOME/.m2:/root/.m2 -v $(pwd):/apps -p 8080:8080 java-platfrom java -jar target/MyApp-1.0-SNAPSHOT.jar
```
