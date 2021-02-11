---
layout: docs
title: Project Build
permalink: /docs/build.html
---

### How to build it?

Please see the file LICENSE for information on how this library is licensed. Below you will find descriptions for each module.

* **mnemonic-core** -- the submodule project for core
* **mnemonic-collections** -- the submodule project for generic collections
* **mnemonic-examples** -- the submodule project for examples, Please refer to the testcases of respective module as complete examples.
* **mnemonic-memory-services/mnemonic-pmalloc-service** -- the submodule project for pmalloc memory service
* **mnemonic-memory-services/mnemonic-nvml-vmem-service** -- the submodule project for vmem memory service
* **mnemonic-memory-services/mnemonic-nvml-pmem-service** -- the submodule project for pmem memory service
* **mnemonic-memory-services/mnemonic-sys-vmem-service** -- the submodule project for system vmem memory service
* **mnemonic-memory-services/service-dist** -- the location of extensive memory services (auto-generated)
* **mnemonic-computing-services/mnemonic-utilities-service** -- the submodule project for utilities computing service
* **mnemonic-computing-services/service-dist** -- the location of extensive computing services (auto-generated)
* **mnemonic-hadoop/mnemonic-hadoop-mapreduce** -- the submodule project for Apache Hadoop mapreduce computing
* **mnemonic-spark/mnemonic-spark-core** -- the submodule project for Apache Spark durable computing

To build this library without Docker image, you will need to install some required packages on the build system. Otherwise, you can build the project with Docker image generated [previously.](devsetup.html){:target="_blank"}

* **Maven** -- the building tool v3.2.1 or above. <I>Optional if you choose to use Gradle.</I>
* **Gradle** --  the building tool v6.7.1 or above. <I>Optional if you choose to use Maven.</I>
* **NVML** -- the [NVM library.](http://pmem.io){:target="_blank"} Please compile this library that was revised with 630862e82f. 
* **JDK** -- the Java Develop Kit 7-8. Please properly configure JAVA_HOME in environment variables.
* **PMFS** -- the PMFS should be properly installed and configured on Linux system if you want to simulate read latency. <I>Optional if you choose to use it for simulation purpose.</I>
* **PMalloc** -- a supported durable memory native library [here.](https://github.com/NonVolatileComputing/pmalloc.git){:target="_blank"} 


***

You can use following commmand lines to install build tools for this project.

```bash
  # ---- install build tools ----
  $ sudo apt-get -y update && \
    apt-get install -y default-jdk cmake check git pkg-config autoconf man build-essential gcc g++ uuid-dev pandoc devscripts flex doxygen maven
  $ sudo apt-get install -y libndctl-dev libpmem-dev libvmem-dev libpmemobj-dev
  $ sudo apt-get clean
  # ---- update environment variables ----
  $ export JAVA_HOME=/usr/lib/jvm/default-java
  $ export PATH=$JAVA_HOME/bin:$PATH
  $ source ~/.profile
  # ---- install pmalloc ----
  $ git clone https://github.com/NonVolatileComputing/pmalloc.git && \
    cd pmalloc && mkdir build && cd build && cmake .. && make && make install
  # ---- clone Mnemonic ----
  $ git clone https://github.com/apache/mnemonic.git && \
    cd mnemonic && mvn clean package install
```

***

Once the build system is setup, this Library is built using this command at the top level:

```bash
  $ git clean -xdf # if pull from a git repo.
  # ------ For Maven ---------
  $ mvn clean install
  # ------ For Gradle --------
  $ ./gradlew clean
  $ ./gradlew build -x test
```

To exclude a customized memory service for your platform e.g. OSX, note that if you excluded one or both memory services, some or all testcases/examples will fail since their dependent memory services are unavailable.

```bash
  $ git clean -xdf # if pull from a git repo.
  $ mvn -pl '!mnemonic-memory-services/mnemonic-nvml-vmem-service' clean package install
```

