# `roc-sort`
[![Roc-Lang][roc_badge]][roc_link]
[![GitHub last commit][last_commit_badge]][last_commit_link]
[![CI status][ci_status_badge]][ci_status_link]

A collection of sorting algorithms for roc-lang, as well as compare functions for both `Num` and `Str` types.

The roc List module currently does not include sorting for strings, so this package adds that functionality.

## Algorithms
1) Quicksort
2) Mergesort

## Examle usage:
`roc repl:`
```roc
import sort.Sort exposing [mergesort]
import sort.Compare exposing [compareStr]
mergesort ["world!", "Hello, "] compareStr |> Str.joinWith ""

"Hello, world!" : Str
```

[roc_badge]: https://img.shields.io/endpoint?url=https%3A%2F%2Fpastebin.com%2Fraw%2FGcfjHKzb
[roc_link]: https://github.com/roc-lang/roc
[ci_status_badge]: https://img.shields.io/github/actions/workflow/status/imclerran/roc-sort/ci.yaml
[ci_status_link]: https://github.com/imclerran/roc-sort/actions/workflows/ci.yaml
[last_commit_badge]: https://img.shields.io/github/last-commit/imclerran/roc-sort
[last_commit_link]: https://github.com/imclerran/roc-sort/commits/main/
