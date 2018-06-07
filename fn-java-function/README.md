


# Function deployment instruction
Login to dockerhub with command `docker login` to get permission to push

**Name paramater** in `func.yaml` need to be in format `<dockerhub-username>/<repos-name>` for docker image push

### Setup context file:
```sh
# provider and registry is optional
sudo fn context create <context-name> --provider <value> --api-url <fnlb-or-node-ipaddress> --registry <value>

sudo fn context use <context-name>
```
#### Example:
```sh
sudo fn context create prod --provider aws --api-url http://18.207.112.196:8081/v1
sudo fn context use prod
```

### Deploy:
```sh
# in function directory
sudo fn deploy -app <app-name> --no-bump # --no-bump for prevending version increment
```

### Call:
```sh
sudo fn call <app-name> /<function-directory-name>

## via curl
curl http://<ipaddress>:<port-number>/r/<app-name>/<function-directory-name>
```

## Some commands:
```sh
# in function directory
sudo fn build # only build docker
sudo fn run # build and run docker
mvn clean package # build a jar

# fn commands
sudo fn context list
sudo fn routes list <app-name>
```

## Links:
Local quickstart:
[https://github.com/fnproject/fn#quickstart](https://github.com/fnproject/fn#quickstart)

[https://github.com/fnproject/fdk-java](https://github.com/fnproject/fdk-java)
