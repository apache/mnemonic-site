---
layout: docs
title: Run tests
permalink: /docs/runtest.html
---

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

