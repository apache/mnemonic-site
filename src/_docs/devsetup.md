---
layout: docs
title: Development Setup
permalink: /docs/devsetup.html
---

This document provides a best practice for general development setup and code distribution. Please practice on your computer before trying for code contribution.

***

Pre-requisites: 

* Install Git on your system - [Git-scm.](https://git-scm.com/book/en/v2/Getting-Started-Installing-Git){:target="_blank"}

* Register Github Account if you dont have one already. You can register your Github acocunt [here.](http://github.com){:target="_blank"}

* Obtain Docker on your system. You can get docker from [here.](https://www.docker.com/){:target="_blank"}

* (Optional) Install IDE on your operating system. e.g. [Visual Studio Code](https://code.visualstudio.com/download){:target="_blank"} or [IntelliJ](https://www.jetbrains.com/idea/){:target="_blank"}

***

* Step 1 - Configure Git tool if you are behind the firewall. <I>[Show Me How](https://gist.github.com/evantoli/f8c23a37eb3558ab8765){:target="_blank"}</I>

* Step 2 - Fork the following Mnemonic project to your own Github account. <I>[Project Link](https://github.com/apache/mnemonic){:target="_blank"}</I>

* Step 3 - Clone the forked Mnemonic project from your own Github account by running the command below. <I>[Show Me How](https://docs.github.com/en/free-pro-team@latest/github/creating-cloning-and-archiving-repositories/cloning-a-repository){:target="_blank"}</I>

```bash
  $ git clone git@github.com:[your account id]/mnemonic.git
```

* Step 4 - Configure a remote upstream from Github for upstream sync by running the command below. <I>[Show Me How](https://docs.github.com/en/free-pro-team@latest/github/collaborating-with-issues-and-pull-requests/configuring-a-remote-for-a-fork){:target="_blank"}</I>

```bash
  $ git remote add upstream https://github.com/apache/mnemonic.git
```

* Step 5 - Setting your commit email address and name for local Mnemonic repo by running the command below. <I>[Show Me How](https://docs.github.com/en/free-pro-team@latest/github/setting-up-and-managing-your-github-user-account/setting-your-commit-email-address){:target="_blank"}</I>


```bash
  $ cd mnemonic
  $ git config user.email “[your apache id]@ email@example.comapache.org”
  $ git config user.name “[your name]”
```

* Step 6 - Prepare Mnemonic Docker image on your own system by running one of following command below.

```bash
  $ # --------- For CentOS ---------
  $ docker build -t mnedev https://github.com/apache/mnemonic.git#:docker/docker-CentOS
  $ # --------- For Ubuntu --------- 
  $ docker build -t mnedev https://github.com/apache/mnemonic.git#:docker/docker-Ubuntu
```

* Step 7 - Mount your host repository to Docker container, this following command would hide the original Mnemonic project folder in container.

```bash
  $ docker run -it -v <mnemonic_project_folder>:/ws/mnemonic mnedev
```

<B>Congratulation!</B> You have successfully completed the development setup. You are now ready to edit the project code on your host while compiling and test in isolated Docker envinroment. Please make sure you have enough space for docker based compiling and testing (>30G for test running). 

Please refer to [Submit Changes](submitchanges.html){:target="_blank"} page if you would like to contribute to this project!