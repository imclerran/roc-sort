module [CompareFn, compareNum, reverseNum, compareStr, reverseStr]

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