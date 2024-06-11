module [compareNum, reverseNum, compareStr, reverseStr]

compareNum : Num a, Num a -> I64
compareNum = \a, b -> if a < b then -1 else if a > b then 1 else 0

reverseNum : Num a, Num a -> I64
reverseNum = \a, b -> compareNum b a

compareStr : Str, Str -> I64
compareStr = \a, b -> 
    if a == b then 0
    else
        bytesA = Str.toUtf8 a
        bytesB = Str.toUtf8 b
        compList = List.map2 bytesA bytesB \byteA, byteB ->
            if byteA < byteB then -1 else if byteA > byteB then 1 else 0
        (List.findFirst compList \comp -> comp != 0) |> Result.withDefault (Num.toI64 (List.len bytesA) - Num.toI64 (List.len bytesB))
    
reverseStr : Str, Str -> I64
reverseStr = \a, b -> compareStr b a