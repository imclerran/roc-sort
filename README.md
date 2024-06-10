# `roc-sort`
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

