# `roc-sort`
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
