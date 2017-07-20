# prtg-check-process
Bash script that check if a process is up. 
Multiple grep filters can be used to properly identify the process.

## Usage :
prtg-check-process.sh <filter_1> [<filter_2> ... <filter_n>]

## Some examples : 

Look for a process named "java" :  
```shell
prtg-check-process.sh java
```


Look for a Tomcat process installed in "/opt/tomcat":  
```shell
prtg-check-process.sh java tomcat
```

Look for a Java process with a command line argument "instance_name=my_app" :  
```shell
prtg-check-process.sh java "instance_name=my_app"
```
