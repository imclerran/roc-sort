module []

import Sort exposing [quicksort, mergesort, sort_nums, sort_nums_rev, sort_strs, sort_strs_rev]
import Compare

expect quicksort([], Compare.num) == []
expect quicksort([1], Compare.num) == [1]
expect
    quicksort([1, 2], Compare.num)
    == [1, 2]
    and quicksort([1, 2], Compare.num_reverse)
    == [2, 1]
expect
    quicksort([2, 1], Compare.num)
    == [1, 2]
    and quicksort([2, 1], Compare.num_reverse)
    == [2, 1]
expect
    quicksort([1, 2, 3], Compare.num)
    == [1, 2, 3]
    and quicksort([1, 2, 3], Compare.num_reverse)
    == [3, 2, 1]
expect
    quicksort([3, 2, 1], Compare.num)
    == [1, 2, 3]
    and quicksort([3, 2, 1], Compare.num_reverse)
    == [3, 2, 1]
expect
    quicksort([3, 1, 2], Compare.num)
    == [1, 2, 3]
    and quicksort([3, 1, 2], Compare.num_reverse)
    == [3, 2, 1]
expect
    quicksort([3, 1, 1, 2], Compare.num)
    == [1, 1, 2, 3]
    and quicksort([3, 1, 1, 2], Compare.num_reverse)
    == [3, 2, 1, 1]
expect
    quicksort([-1, 1, 0], Compare.num)
    == [-1, 0, 1]
    and quicksort([-1, 1, 0], Compare.num_reverse)
    == [1, 0, -1]

# TESTS: quicksort, compareStr, reverseStr
expect quicksort([], Compare.str) == []
expect quicksort(["a"], Compare.str) == ["a"]
expect
    quicksort(["a", "b"], Compare.str)
    == ["a", "b"]
    and quicksort(["a", "b"], Compare.str_reverse)
    == ["b", "a"]
expect
    quicksort(["b", "a"], Compare.str)
    == ["a", "b"]
    and quicksort(["b", "a"], Compare.str_reverse)
    == ["b", "a"]
expect
    quicksort(["a", "A", "!", "0"], Compare.str)
    == ["!", "0", "A", "a"]
    and quicksort(["a", "A", "!", "0"], Compare.str_reverse)
    == ["a", "A", "0", "!"]
expect
    quicksort(["A", "a", "a", "A"], Compare.str)
    == ["A", "A", "a", "a"]
    and quicksort(["A", "a", "a", "A"], Compare.str_reverse)
    == ["a", "a", "A", "A"]
expect
    sorted = quicksort(["hello world", "hello, world", "Hello, world", "Hello, World", "hello, world!", "Hello, world!", "Hello, World!", "\"Hello, World!\""], Compare.str)
    sorted
    == ["\"Hello, World!\"", "Hello, World", "Hello, World!", "Hello, world", "Hello, world!", "hello world", "hello, world", "hello, world!"]
    and quicksort(sorted, Compare.str_reverse)
    == ["hello, world!", "hello, world", "hello world", "Hello, world!", "Hello, world", "Hello, World!", "Hello, World", "\"Hello, World!\""]

# TESTS: mergesort, compareNum, reverseNum
expect mergesort([], Compare.num) == []
expect mergesort([1], Compare.num) == [1]
expect
    mergesort([1, 2], Compare.num)
    == [1, 2]
    and mergesort([1, 2], Compare.num_reverse)
    == [2, 1]
expect
    mergesort([2, 1], Compare.num)
    == [1, 2]
    and mergesort([2, 1], Compare.num_reverse)
    == [2, 1]
expect
    mergesort([1, 2, 3], Compare.num)
    == [1, 2, 3]
    and mergesort([1, 2, 3], Compare.num_reverse)
    == [3, 2, 1]
expect
    mergesort([3, 2, 1], Compare.num)
    == [1, 2, 3]
    and mergesort([3, 2, 1], Compare.num_reverse)
    == [3, 2, 1]
expect
    mergesort([3, 1, 2], Compare.num)
    == [1, 2, 3]
    and mergesort([3, 1, 2], Compare.num_reverse)
    == [3, 2, 1]
expect
    mergesort([3, 1, 1, 2], Compare.num)
    == [1, 1, 2, 3]
    and mergesort([3, 1, 1, 2], Compare.num_reverse)
    == [3, 2, 1, 1]
expect
    mergesort([-1, 1, 0], Compare.num)
    == [-1, 0, 1]
    and mergesort([-1, 1, 0], Compare.num_reverse)
    == [1, 0, -1]

# TESTS: mergesort, compareStr, reverseStr
expect mergesort([], Compare.str) == []
expect mergesort(["a"], Compare.str) == ["a"]
expect
    mergesort(["a", "b"], Compare.str)
    == ["a", "b"]
    and mergesort(["a", "b"], Compare.str_reverse)
    == ["b", "a"]
expect
    mergesort(["b", "a"], Compare.str)
    == ["a", "b"]
    and mergesort(["b", "a"], Compare.str_reverse)
    == ["b", "a"]
expect
    mergesort(["a", "A", "!", "0"], Compare.str)
    == ["!", "0", "A", "a"]
    and mergesort(["a", "A", "!", "0"], Compare.str_reverse)
    == ["a", "A", "0", "!"]
expect
    mergesort(["A", "a", "a", "A"], Compare.str)
    == ["A", "A", "a", "a"]
    and mergesort(["A", "a", "a", "A"], Compare.str_reverse)
    == ["a", "a", "A", "A"]
expect
    sorted = mergesort(["hello world", "hello, world", "Hello, world", "Hello, World", "hello, world!", "Hello, world!", "Hello, World!", "\"Hello, World!\""], Compare.str)
    sorted
    == ["\"Hello, World!\"", "Hello, World", "Hello, World!", "Hello, world", "Hello, world!", "hello world", "hello, world", "hello, world!"]
    and mergesort(sorted, Compare.str_reverse)
    == ["hello, world!", "hello, world", "hello world", "Hello, world!", "Hello, world", "Hello, World!", "Hello, World", "\"Hello, World!\""]

expect
    sort_nums([2, 3, 1])
    == [1, 2, 3]
    and sort_nums_rev([2, 3, 1])
    == [3, 2, 1]

expect
    sort_strs(["b", "a", "c"])
    == ["a", "b", "c"]
    and sort_strs_rev(["b", "a", "c"])
    == ["c", "b", "a"]
