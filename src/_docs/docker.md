---
layout: docs
title: Docker usage
permalink: /docs/docker.html
---

This is the "Dockerfiles" that will automatically build the CentOS/Ubuntu environment of this project. 

--------------
### Features:

*What does the Dockerfile do?* 

-  Build from centos/ubuntu.
-  Default is not using proxy. Please see instruction below to set up http/https proxy.
-  Install dependency packages.
-  Set up environment variables of paths.
-  Create /ws folder.
-  Install pmalloc in /ws
-  Install nvml in /ws.
-  Set up maven proxy mvn.sh.
-  Clone mnemonic code then build/install.
-  Go to /ws fold and start bash.

#### How to set up proxy? 

Set the argument "http_proxy" for the docker option "--build-arg" as follows

```bash
  $ docker build -t NAME[:TAG] --build-arg proxy_host="<proxy_host>" proxy_port="<proxy_port>" .
```

For old version docker v1.10 below, Please replace ARG with ENV and set its value as proxy strings in Dockerfile instead

### How to build the docker image from Dockerfile in host OS?
Build from git repository

```bash
  $ docker build -t NAME[:TAG] https://github.com/apache/mnemonic.git#:docker/docker-CentOS
  $ docker build -t NAME[:TAG] https://github.com/apache/mnemonic.git#:docker/docker-Ubuntu
```

-- OR --

In the folder of Dockerfile, run: 

```bash
  $ docker build -t NAME[:TAG] .
```

* More detials please refer to [Docker build reference](https://docs.docker.com/engine/reference/commandline/build/)

#### Optional: After build, push image to dockerhub: 

```bash
  $ docker login [OPTIONS] [SERVER]  
  $ docker push [OPTIONS] NAME[:TAG]
```

* More detials please refer to [Docker login reference](https://docs.docker.com/engine/reference/commandline/login/)
 and [Docker push reference](https://docs.docker.com/engine/reference/commandline/push/)

### How to run image after build

Run image:

```bash
  $ docker run --name CONTAINER_NAME -it NAME[:TAG]
```

### Sharing host project folder to Dock container for IDEs e.g. Eclipse, Intellij IDEA

```bash
  $ docker run -v <hostdir>/mnemonic:/ws/mnemonic -it NAME[:TAG]
```

Note: this command will override the container's project folder, you can use another name to avoid it.

 * More details please refer to [Docker run reference](https://docs.docker.com/engine/reference/run/)
