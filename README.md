# `roc-sort`
[![Roc-Lang][roc_badge]][roc_link]
[![GitHub last commit][last_commit_badge]][last_commit_link]
[![CI status][ci_status_badge]][ci_status_link]

A collection of sorting algorithms for [roc-lang](https://github.com/roc-lang/roc), as well as compare functions for both `Num` and `Str` types.

The roc List module currently can only sort List of type `Num *`, so this package adds sorting for generic lists with a user defined compare function, as well as providing sort and compare functions for `Str` and `Num *`.

to sort any type besides `Str` or `Num *`, simply define a compare function:
```roc
compare : a, a -> U64
```
where a is:
- `0` if the elements are equal
- `< 0` if the first element sorts first
- `> 0` if the first element sorts last

## Algorithms
The currently available sorting algorithms are:
1) Quicksort
2) Mergesort

The package also provides some single argument sort functions, which do not require passing in a compare function. These use mergesort to sort numbers and strs, and have both standard and reverse sorting versions.

## Usage
Sorting a list of `Str` can be done with:

`roc repl`
```roc
import Sort exposing [sortStrs]
["world!", "Hello, "] |> sortStrs |> Str.joinWith ""

"Hello, world!" : Str
```

[roc_badge]: https://img.shields.io/endpoint?url=https%3A%2F%2Fpastebin.com%2Fraw%2FGcfjHKzb
[roc_link]: https://github.com/roc-lang/roc
[ci_status_badge]: https://img.shields.io/github/actions/workflow/status/imclerran/roc-sort/ci.yaml
[ci_status_link]: https://github.com/imclerran/roc-sort/actions/workflows/ci.yaml
[last_commit_badge]: https://img.shields.io/github/last-commit/imclerran/roc-sort
[last_commit_link]: https://github.com/imclerran/roc-sort/commits/main/
