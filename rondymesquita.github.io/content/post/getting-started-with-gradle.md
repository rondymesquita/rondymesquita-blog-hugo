---
title: "Getting Started With Gradle"
date: 2014-09-06T17:46:18-03:00
tags: ["gradle","java"]
categories: ["getting-stated"]
---

### The content of this post it deprecated for now, because its tests against an old version of Gradle. It could be updated in the future. It is here for history purposes.

Gradle is a automation tool for building, testing and software deployment. Gradle also performs dependency management of your application. As Maven, it downloads the dependencies and add them to your project. One of the advantages that I particularlly like on Gradle is its ease to create tasks. Tasks are block of codes as functions which perform a step of whole build.

The example addressed here could be downloaded on [https://github.com/rondymesquita/SimpleJavaProject-Gradle](https://github.com/rondymesquita/SimpleJavaProject-Gradle)

## Installing

First, get Gradle zip file and unzip in a folder.
[http://www.gradle.org](http://www.gradle.org)

After that, you should configure the environment variables according with you SO. Something like this:
```bash
GRADLE_HOME=/usr/local/gradle-1.8
export GRADLE_HOME
export PATH=$PATH:$GRADLE_HOME/bin
```

Just to be sure, go to a terminal and type:
```
gradle -v
```

You should see the Gradle version printed and other informations.

## Configuring

First, create you java project as usual. In this example, a simple project was created using the maven command:
```
mvn archetype:generate
```

At root folder of your project, you should create a file called **build.gradle** and put the following content on it.
```
apply plugin:'java'
apply plugin:'eclipse'

repositories {
    mavenCentral()
}

dependencies {
    testCompile 'junit:junit:4.11'
}
```

## Explaining

The code above shows the build file structure. At lines 1 and 2, the plugins were added giving to Gradle support to work with Java and Eclipse IDE. There are a lot of plugins to work with other tools. They can be consulted on [http://www.gradle.org/docs/current/userguide/standard__plugins.html](http://www.gradle.org/docs/current/userguide/standard__plugins.html)

In **repositories** block are declared from were Gradle should get the dependencies, but we are not going to focus on this for now.

In **dependencies** block are declared the dependencies of your project. This example is using JUnit on version 4.11 for testing scope.

The verify if the file is correct, just run:
```
gradle tasks
```
This command will list all tasks that can be executed for this project. To configure the project to be able to run on Eclipse IDE, run:
```
gradle clean eclipse
```

Gradle will generate the necessary files.

## Tasks

If you want to run the unit tests of your project, run:
```
gradle test
```

The tests will be executed and a report will be generated.
Fine, but where the reports are being generated? At root folder of your project, you should see a folder called **build**. The test reports should be available on **build/reports/tests**.

To generate the jar of your application, run:

```
gradle jar
```
The jar will be available on **build/libs**

## Dependency Management

Until now, the only used dependency was JUnit. If you go look the build path, it should be there. If you want to add a new dependency, just add the dependency reference on **dependencies** block.

Say that I want to use Spring: You can simply add this **dependencies** block.
```
compile 'org.springframework:spring-core:4.1.0.RELEASE'
compile 'org.springframework:spring-context:4.1.0.RELEASE'
```

On the terminal, run:
```
gradle eclipse
```
Gradle will download the jars and add them to your project.

The final file should look like:
```
apply plugin:'java'
apply plugin:'eclipse'

repositories {
    mavenCentral()
}

dependencies {
    testCompile 'junit:junit:4.11'
    compile 'org.springframework:spring-core:4.1.0.RELEASE'
    compile 'org.springframework:spring-context:4.1.0.RELEASE'
}
```

This makes easier to add new dependencies or change their version. To fiund other dependencies, I usually go to [http://mvnrepository.com](http://mvnrepository.com) where you search for the dependency, get the code and inserto into you build file.
