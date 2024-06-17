# Benchmarking

To run the benchmarks, simply run `benchmark.sh`. 

This will run all but the 1m line benchmark, as mergesort will hit stack allocation limits for a sort of this size (and is extremely slow)

To run individual benchmarks, run `roc build --optimize --output=benchmark`. Then run `./benchmark <1k/10k/100k/1m>` with your choice of benchmark size.