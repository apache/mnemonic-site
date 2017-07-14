---
layout: docs
title: Development Setup
permalink: /docs/devsetup.html
---

This document provides a best practice for general development setup, 
we suggest to use this practice on your first try for code contribution.

It is based on Docker and simple for preparation, no root privilege needed except for Docker and Git installation. 

* Install Git on your system [Git-scm](https://git-scm.com/book/en/v2/Getting-Started-Installing-Git){:target="_blank"}
* [First-Time Git Setup](https://git-scm.com/book/en/v2/Getting-Started-First-Time-Git-Setup){:target="_blank"}
```bash
  $ git config --global user.name "<Your Name>"
  $ git config --global user.email "<Your Email Address>"
```
* Install Docker on your system [Docker Official Website](https://www.docker.com/){:target="_blank"}
* Install IDE on your Linux/MacOS/Windows box [IntelliJ IDEA Official Website](https://www.jetbrains.com/idea/){:target="_blank"}
* Register an account on Github for yourself if not yet have one
* Log into Github and fork [Apache Incubator Mnemonic repository](https://github.com/apache/incubator-mnemonic){:target="_blank"}.
  [Fork and Set up Git](https://help.github.com/articles/fork-a-repo/){:target="_blank"}
* Configure Apache incubator Mnemonic repo. as upstream remote in your local repository
```bash
  $ cd <your_project_folder>
  $ git remote add upstream https://github.com/apache/incubator-mnemonic.git
```
* Prepare Mnemonic Docker image on you system
```bash
  $ docker build -t mnedev https://github.com/apache/incubator-mnemonic.git#:docker/docker-CentOS
  $ # --------- OR --------- 
  $ docker build -t mnedev https://github.com/apache/incubator-mnemonic.git#:docker/docker-Ubuntu
```
* Mount your host repo. to Docker container, this following command would hide the original Mnemonic project folder in container 
```bash
  $ docker run -it -v <mnemonic_project_folder>:/ws/incubator-mnemonic mnedev
```
* Open Mnemonic project in the IDE 

After setup, you are able to edit project code on your host while compiling and test your code in isolated Docker environment.
Please leave enough space for docker based compiling and testing (>30G for test running)
