# `roc-sort`
[![Roc-Lang][roc_badge]][roc_link]
[![GitHub last commit][last_commit_badge]][last_commit_link]
[![CI status][ci_status_badge]][ci_status_link]

A collection of sorting algorithms for [roc-lang](https://github.com/roc-lang/roc), as well as compare functions for both `Num` and `Str` types. Mostly written for proof of concept. Merge sort is baaaaad... see benchmarks below.

To sort any type besides `Str` or `Num *`, simply define a compare function:
```roc
compare : a, a -> [LT, EQ, GT]
```
Where the return is:
- `EQ` if the elements are equal
- `LT` if the first element sorts first
- `GT` if the first element sorts last

## Algorithms
The currently available sorting algorithms are:
1) Quicksort
2) Mergesort

The package also provides some single argument sort functions, which do not require passing in a compare function. These use mergesort to sort numbers and strs, and have both standard and reverse sorting versions.

## Usage
Sorting a list of `Str` can be done with:

`roc repl`
```roc
import Sort exposing [sort_strs]
["world!", "Hello, "] |> sort_trs |> Str.joinWith("")

"Hello, world!" : Str
```

## Benchmarks
Below are benchmarks of my sort functions against the builtin List.sortWith function:
```
benchmark $ ./benchmark.sh
--------------------------------------------------
> List.sortWith, str: sorted 1k elements in 0ms
--------------------------------------------------
> Sort.quicksort, str: sorted 1k elements in 1ms
--------------------------------------------------
> Sort.mergesort, str: sorted 1k elements in 1ms


--------------------------------------------------
> List.sortWith, str: sorted 10k elements in 8ms
--------------------------------------------------
> Sort.quicksort, str: sorted 10k elements in 13ms
--------------------------------------------------
> Sort.mergesort, str: sorted 10k elements in 51ms


--------------------------------------------------
> List.sortWith, str: sorted 100k elements in 104ms
--------------------------------------------------
> Sort.quicksort, str: sorted 100k elements in 157ms
--------------------------------------------------
> Sort.mergesort, str: sorted 100k elements in 4,660ms
```

As can be seen here, quicksort is slightly behind the built in sort function. While not shown here, the best case for quicksort is about an order of magnitude better the built in function. However mergesort is at least an order of magnitude (or several) worse than the builtin sort_with function.

[roc_badge]: https://img.shields.io/endpoint?url=https%3A%2F%2Fpastebin.com%2Fraw%2FcFzuCCd7
[roc_link]: https://github.com/roc-lang/roc

[ci_status_badge]: https://img.shields.io/github/actions/workflow/status/imclerran/roc-sort/ci.yaml?logo=github&logoColor=lightgrey
[ci_status_link]: https://github.com/imclerran/roc-sort/actions/workflows/ci.yaml

[last_commit_badge]: https://img.shields.io/github/last-commit/imclerran/roc-sort?logo=git&logoColor=lightgrey
[last_commit_link]: https://github.com/imclerran/roc-sort/commits/main/
