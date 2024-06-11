module [quicksort, mergesort, sortNums, sortNumsRev, sortStrs, sortStrsRev]

import Unsafe exposing [unwrap]
import Compare exposing [compareStr, compareNum, reverseStr, reverseNum]

quicksort : List a, (a, a -> I64) -> List a
quicksort = \list, compare ->
    if List.len list < 2 then
        list
    else
        pivotIdx = (List.len list) // 2
        pivot = list |> List.get pivotIdx |> unwrap "quicksort: get pivot should never fail"
        before = List.walkWithIndex list [] \xs, x, i ->
            if i == pivotIdx || compare x pivot > 0 then xs else List.append xs x
        after = List.walkWithIndex list [] \xs, x, i ->
            if i == pivotIdx || compare x pivot <= 0 then xs else List.append xs x
        List.join [quicksort before compare, [pivot], quicksort after compare]

mergesort : List a, (a, a -> I64) -> List a
mergesort = \list, compare ->
    if List.len list < 2 then
        list
    else
        midpoint = (List.len list) // 2
        { before, others } = List.split list midpoint
        merge (mergesort before compare) (mergesort others compare) compare

merge : List a, List a, (a, a -> I64) -> List a
merge = \left, right, compare ->
    when (left, right) is
        ([], _) -> right
        (_, []) -> left
        ([l], [r]) -> if compare l r <= 0 then [l, r] else [r, l]
        ([l], [r, .. as rs]) -> 
            if compare l r <= 0 then
                List.prepend right l
            else
                List.prepend (merge left rs compare) r
        ([l, .. as ls], [r]) ->
            if compare l r <= 0 then
                List.prepend (merge ls right compare) l
            else
                List.prepend left r
        ([l, .. as ls], [r, .. as rs]) ->
            if compare l r <= 0 then
                List.prepend (merge ls right compare) l
            else
                List.prepend (merge left rs compare) r
        (_,_) -> 
            # The previous cases should be exhaustive, but the compiler complains without this.
            crash "merge: The previous cases should be exhaustive." 

sortNums : List (Num a) -> List (Num a)
sortNums = \list -> mergesort list compareNum

sortNumsRev : List (Num a) -> List (Num a)
sortNumsRev = \list -> mergesort list reverseNum

sortStrs : List (Str a) -> List (Str a)
sortStrs = \list -> mergesort list compareStr

sortStrsRev : List (Str a) -> List (Str a)
sortStrsRev = \list -> mergesort list reverseStr