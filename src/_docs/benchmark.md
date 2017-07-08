---
layout: docs
title: Run Benchmark
permalink: /docs/benchmark.html
---


### How to benchmark ?
To run sort bench workloads.
```bash
  $ # generate some input data files with a count parameter that indicates how many random numbers to be generated
  $ mnemonic-benches/mnemonic-sort-bench/bin/gen_data.py 20000
  $ # create a configure file that contains all the absolute paths of generated input data files to work on in a batch
  $ # call the run.py to run the bench workloads with the configure file
  $ mnemonic-benches/mnemonic-sort-bench/bin/run.py ./sort-files.conf
  $ # after finished, you can find the result data from the sort_bench_result.log
  $ less mnemonic-benches/mnemonic-sort-bench/sort_bench_result.log
```
