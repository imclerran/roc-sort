# `roc-sort`
[![Roc-Lang][roc_badge]][roc_link]
[![GitHub last commit][last_commit_badge]][last_commit_link]
[![CI status][ci_status_badge]][ci_status_link]

A collection of sorting algorithms for roc-lang, as well as compare functions for both `Num` and `Str` types.

The roc List module currently can only sort List of type `Num *`, so this package adds the ability to sort `Str` as well as `Num *`. Additionally, these sort functions can sort a list of any type, and simply require the user to provide a compare function which returns:
- `0` if equal
- `< 0` if the first arg sorts first
- `> 0` if the first arg sorts last

## Algorithms
The currently available sorting algorithms are:
1) Quicksort
2) Mergesort

The package also provides some single argument sort functions, which do not require passing in a compare function. These use mergesort to sort numbers and strs, and have both standard and reverse sorting versions.

[roc_badge]: https://img.shields.io/endpoint?url=https%3A%2F%2Fpastebin.com%2Fraw%2FGcfjHKzb
[roc_link]: https://github.com/roc-lang/roc
[ci_status_badge]: https://img.shields.io/github/actions/workflow/status/imclerran/roc-sort/ci.yaml
[ci_status_link]: https://github.com/imclerran/roc-sort/actions/workflows/ci.yaml
[last_commit_badge]: https://img.shields.io/github/last-commit/imclerran/roc-sort
[last_commit_link]: https://github.com/imclerran/roc-sort/commits/main/
