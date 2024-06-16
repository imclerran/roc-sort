module [quicksort, mergesort, sortNums, sortNumsRev, sortStrs, sortStrsRev]

import Unsafe exposing [unwrap]
import Compare exposing [compareStr, compareNum, reverseStr, reverseNum]

quicksort : List a, (a, a -> [LT, EQ, GT]) -> List a
quicksort = \list, compare ->
    if List.len list < 2 then
        list
    else
        pivotIdx = (List.len list) // 2
        pivot = list |> List.get pivotIdx |> unwrap "quicksort: get pivot should never fail"
        before = List.walkWithIndex list [] \xs, x, i ->
            when compare x pivot is
                LT -> List.append xs x
                EQ if i != pivotIdx -> List.append xs x
                _ -> xs
        after = List.walk list [] \xs, x ->
            when compare x pivot is
                GT -> List.append xs x
                _ -> xs
        List.join [quicksort before compare, [pivot], quicksort after compare]

mergesort : List a, (a, a -> [LT, EQ, GT]) -> List a
mergesort = \list, compare ->
    if List.len list < 2 then
        list
    else
        midpoint = (List.len list) // 2
        { before, others } = List.split list midpoint
        merge (mergesort before compare) (mergesort others compare) compare

merge : List a, List a, (a, a -> [LT, EQ, GT]) -> List a
merge = \left, right, compare ->
    when (left, right) is
        ([], _) -> right
        (_, []) -> left
        ([l, .. as ls], [r, .. as rs]) ->
            when compare l r is
                GT -> List.prepend (merge left rs compare) r
                _ -> List.prepend (merge ls right compare) l
        (_,_) -> 
            crash "merge: The previous cases should be exhaustive." 

sortNums : List (Num a) -> List (Num a)
sortNums = \list -> mergesort list compareNum

sortNumsRev : List (Num a) -> List (Num a)
sortNumsRev = \list -> mergesort list reverseNum

sortStrs : List (Str a) -> List (Str a)
sortStrs = \list -> mergesort list compareStr

sortStrsRev : List (Str a) -> List (Str a)
sortStrsRev = \list -> mergesort list reverseStr