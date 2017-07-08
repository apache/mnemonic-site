---
layout: docs
title: Durable Memory Service Comparison
permalink: /docs/memsrvcmp.html
---

#### Durable Memory Service Comparison Table


|    Features                     |    NVML-VMEM    |    PMALLOC    |    NVML-PMEM    |     SYS-VMEM    |
|---------------------------------|:---------------:|:-------------:|:---------------:|:---------------:|
|    Fixed   Durable K-V Store    |        NA       |       O       |        O        |        NA       |
|    Support DOM                  |        O        |       O       |        O        |        O        |
|    Support DNCM                 |        O        |       O       |        O        |        O        |
|    Support OS X                 |        NA       |       O       |        NA       |        O        |
|    Memory Map Sync.             |        NA       |       O       |        O        |        NA       |
|    PM Flush                     |        NA       |       NA      |        O        |        NA       |
|    PM Drain                     |        NA       |       NA      |        O        |        NA       |
|    PM Persist                   |        NA       |       NA      |        O        |        NA       |
|    PM Atomic Ops.               |        NA       |       NA      |        O        |        NA       |
|    Expected Performance         |       Average   |     Average   |  Slow(on Disk)  |       Fast      |

