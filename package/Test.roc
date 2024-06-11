module []

import Sort exposing [quicksort, mergesort, sortNums, sortNumsRev, sortStrs, sortStrsRev]
import Compare exposing [compareNum, compareStr, reverseNum, reverseStr]

# TESTS: quicksort, compareNum, reverseNum
expect quicksort [] compareNum == []
expect quicksort [1] compareNum == [1]
expect 
    quicksort [1, 2] compareNum == [1, 2]
    && quicksort [1, 2] reverseNum == [2, 1]
expect 
    quicksort [2, 1] compareNum == [1, 2]
    && quicksort [2, 1] reverseNum == [2, 1]
expect 
    quicksort [1, 2, 3] compareNum == [1, 2, 3]
    && quicksort [1, 2, 3] reverseNum == [3, 2, 1]
expect 
    quicksort [3, 2, 1] compareNum == [1, 2, 3]
    && quicksort [3, 2, 1] reverseNum == [3, 2, 1]
expect 
    quicksort [3, 1, 2] compareNum == [1, 2, 3]
    && quicksort [3, 1, 2] reverseNum == [3, 2, 1]
expect 
    quicksort [3, 1, 1, 2] compareNum == [1, 1, 2, 3]
    && quicksort [3, 1, 1, 2] reverseNum == [3, 2, 1, 1]
expect 
    quicksort [-1, 1, 0] compareNum == [-1, 0, 1]
    && quicksort [-1, 1, 0] reverseNum == [1, 0, -1]


# TESTS: quicksort, compareStr, reverseStr
expect quicksort [] compareStr == []
expect quicksort ["a"] compareStr == ["a"]
expect 
    quicksort ["a", "b"] compareStr == ["a", "b"]
    && quicksort ["a", "b"] reverseStr == ["b", "a"]
expect 
    quicksort ["b", "a"] compareStr == ["a", "b"]
    && quicksort ["b", "a"] reverseStr == ["b", "a"]
expect 
    quicksort ["a", "A", "!", "0"] compareStr == ["!", "0", "A", "a"]
    && quicksort ["a", "A", "!", "0"] reverseStr == ["a", "A", "0", "!"]
expect 
    sorted = quicksort ["hello world", "hello, world", "Hello, world", "Hello, World", "hello, world!", "Hello, world!", "Hello, World!", "\"Hello, World!\""] compareStr 
    sorted == ["\"Hello, World!\"", "Hello, World", "Hello, World!", "Hello, world", "Hello, world!", "hello world", "hello, world", "hello, world!"]
    && quicksort sorted reverseStr == ["hello, world!", "hello, world", "hello world", "Hello, world!", "Hello, world", "Hello, World!", "Hello, World", "\"Hello, World!\""]

# TESTS: mergesort, compareNum, reverseNum
expect mergesort [] compareNum == []
expect mergesort [1] compareNum == [1]
expect 
    mergesort [1, 2] compareNum == [1, 2]
    && mergesort [1, 2] reverseNum == [2, 1]
expect 
    mergesort [2, 1] compareNum == [1, 2]
    && mergesort [2, 1] reverseNum == [2, 1]
expect 
    mergesort [1, 2, 3] compareNum == [1, 2, 3]
    && mergesort [1, 2, 3] reverseNum == [3, 2, 1]
expect 
    mergesort [3, 2, 1] compareNum == [1, 2, 3]
    && mergesort [3, 2, 1] reverseNum == [3, 2, 1]
expect 
    mergesort [3, 1, 2] compareNum == [1, 2, 3]
    && mergesort [3, 1, 2] reverseNum == [3, 2, 1]
expect 
    mergesort [3, 1, 1, 2] compareNum == [1, 1, 2, 3]
    && mergesort [3, 1, 1, 2] reverseNum == [3, 2, 1, 1]
expect 
    mergesort [-1, 1, 0] compareNum == [-1, 0, 1]
    && mergesort [-1, 1, 0] reverseNum == [1, 0, -1]

# TESTS: mergesort, compareStr, reverseStr
expect mergesort [] compareStr == []
expect mergesort ["a"] compareStr == ["a"]
expect 
    mergesort ["a", "b"] compareStr == ["a", "b"]
    && mergesort ["a", "b"] reverseStr == ["b", "a"]
expect
    mergesort ["b", "a"] compareStr == ["a", "b"]
    && mergesort ["b", "a"] reverseStr == ["b", "a"]
expect
    mergesort ["a", "A", "!", "0"] compareStr == ["!", "0", "A", "a"]
    && mergesort ["a", "A", "!", "0"] reverseStr == ["a", "A", "0", "!"]
expect
    sorted = mergesort ["hello world", "hello, world", "Hello, world", "Hello, World", "hello, world!", "Hello, world!", "Hello, World!", "\"Hello, World!\""] compareStr
    sorted == ["\"Hello, World!\"", "Hello, World", "Hello, World!", "Hello, world", "Hello, world!", "hello world", "hello, world", "hello, world!"]
    && mergesort sorted reverseStr == ["hello, world!", "hello, world", "hello world", "Hello, world!", "Hello, world", "Hello, World!", "Hello, World", "\"Hello, World!\""]

expect 
    sortNums [2, 3, 1] == [1, 2, 3]
    && sortNumsRev [2, 3, 1] == [3, 2, 1]

expect
    sortStrs ["b", "a", "c"] == ["a", "b", "c"]
    && sortStrsRev ["b", "a", "c"] == ["c", "b", "a"]
