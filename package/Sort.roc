module [CompareFn, compareNum, reverseNum, compareStr, reverseStr, quicksort, mergesort]

import Unsafe exposing [unwrap]

CompareFn a : a, a -> I64

compareNum : CompareFn (Num *)
compareNum = \a, b -> if a < b then -1 else if a > b then 1 else 0

reverseNum : CompareFn (Num *)
reverseNum = \a, b -> compareNum b a

compareStr : CompareFn Str
compareStr = \a, b -> 
    if a == b then 0
    else
        bytesA = Str.toUtf8 a
        bytesB = Str.toUtf8 b
        compList = List.map2 bytesA bytesB \byteA, byteB ->
            if byteA < byteB then -1 else if byteA > byteB then 1 else 0
        (List.findFirst compList \comp -> comp != 0) |> Result.withDefault (Num.toI64 (List.len bytesA) - Num.toI64 (List.len bytesB))
    
reverseStr : CompareFn Str
reverseStr = \a, b -> compareStr b a


quicksort : List a, CompareFn a -> List a
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

mergesort : List a, CompareFn a -> List a
mergesort = \list, compare ->
    if List.len list < 2 then
        list
    else
        midpoint = (List.len list) // 2
        { before, others } = List.split list midpoint
        merge (mergesort before compare) (mergesort others compare) compare

merge : List a, List a, CompareFn a -> List a
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