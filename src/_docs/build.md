---
layout: docs
title: Project Build
permalink: /docs/build.html
---

### How to build it ?

Please see the file LICENSE for information on how this library is licensed.


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

To build this library, you may need to install some required packages on the build system:

* **Maven** -- the building tool v3.2.1 or above [Required]
* **NVML** -- the NVM library (Please compile this library that was revised with 630862e82f) (http://pmem.io) [Optional if mnemonic-nvml-vmem-service/mnemonic-nvml-pmem-service are excluded, e.g. on MacOSX]
* **JDK** -- the Java Develop Kit 1.6 or above (please properly configure JAVA_HOME) [Required]
* **PMFS** -- the PMFS should be properly installed and configured on Linux system if you want to simulate read latency [Optional]
* **PMalloc** -- a supported durable memory native library(Latest) at https://github.com/NonVolatileComputing/pmalloc.git [Optional if mnemonic-pmalloc-service is excluded]


Once the build system is setup, this Library is built using this command at the top level:
```bash
  $ git clean -xdf # if pull from a git repo.
  $ mvn clean package install
```


To exclude a customized memory service for your platform e.g. OSX, note that if you excluded one or both memory services, some or all testcases/examples will fail since their dependent memory services are unavailable.
```bash
  $ git clean -xdf # if pull from a git repo.
  $ mvn -pl '!mnemonic-memory-services/mnemonic-nvml-vmem-service' clean package install
```


To install this package to local repository (required to run examples and testcases):
```bash
  $ mvn clean install
```


To run an example:
```bash
  $ # requires 'vmem' memory service to run, please refer to the code of test cases for more examples.
  $ mvn exec:exec -Pexample -pl mnemonic-examples
```


To run several test cases:
```bash
  $ # a testcase for module "mnemonic-core" that requires 'pmalloc' memory service to pass
  $ mvn -Dtest=DurablePersonNGTest test -pl mnemonic-core -DskipTests=false
  
  $ # a testcase for module "mnemonic-core" that requires 'pmalloc' memory service to pass
  $ mvn -Dtest=NonVolatileMemAllocatorNGTest test -pl mnemonic-core -DskipTests=false
  
  $ # a testcase for module "mnemonic-core" that requires 'vmem' memory service to pass
  $ mvn -Dtest=VolatileMemAllocatorNGTest test -pl mnemonic-core -DskipTests=false
  
  $ # a testcase for module "mnemonic-core" that requires 'vmem memory service to pass
  $ mvn -Dtest=MemClusteringNGTest test -pl mnemonic-core -DskipTests=false
  
  $ # a testcase for module "mnemonic-collection" that requires 'pmalloc' memory service to pass
  $ mvn -Dtest=DurableSinglyLinkedListNGTest  test -pl mnemonic-collections -DskipTests=false
  
  $ # a testcase for module "mnemonic-collection" that requires 'pmalloc' memory service to pass
  $ mvn -Dtest=DurablePersonNGTest  test -pl mnemonic-collections -DskipTests=false
  
  $ # a testcase for module "mnemonic-computing-services/mnemonic-utilities-service" that requires 'pmalloc' memory service to pass
  $ mvn -Dtest=DurableSinglyLinkedListNGPrintTest test -pl mnemonic-computing-services/mnemonic-utilities-service -DskipTests=false
  
  $ # a testcase for module "mnemonic-computing-services/mnemonic-utilities-service" that requires 'pmalloc' memory service to pass
  $ mvn -Dtest=DurableSinglyLinkedListNGSortTest test -pl mnemonic-computing-services/mnemonic-utilities-service -DskipTests=false
  
  $ # a testcase for module "mnemonic-hadoop/mnemonic-hadoop-mapreduce" that requires 'pmalloc' memory service to pass
  $ mvn -Dtest=MneMapreducePersonDataTest test -pl mnemonic-hadoop/mnemonic-hadoop-mapreduce -DskipTests=false
```

