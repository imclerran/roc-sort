# Benchmarking

To run the benchmarks, simply run `benchmark.sh`. 

This will run all but the 1m line benchmark, as mergesort will hit stack allocation limits for a sort of this size (and is extremely slow)