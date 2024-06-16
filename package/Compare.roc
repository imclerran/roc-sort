module [compareNum, reverseNum, compareStr, reverseStr]

compareNum : Num a, Num a -> [LT, EQ, GT]
compareNum = \a, b -> if a < b then LT else if a > b then GT else EQ

reverseNum : Num a, Num a -> [LT, EQ, GT]
reverseNum = \a, b -> compareNum b a

compareStr : Str, Str -> [LT, EQ, GT]
compareStr = \a, b -> 
    if a == b then EQ
    else
        bytesA = Str.toUtf8 a
        bytesB = Str.toUtf8 b
        compList = List.map2 bytesA bytesB \byteA, byteB ->
            if byteA < byteB then LT else if byteA > byteB then GT else EQ
        (List.findFirst compList \comp -> comp != EQ) 
        |> Result.withDefault (Num.toI64 (List.len bytesA) - Num.toI64 (List.len bytesB) |> numToComparator)
    
reverseStr : Str, Str -> [LT, EQ, GT]
reverseStr = \a, b -> compareStr b a

numToComparator : Num a -> [LT, EQ, GT]
numToComparator = \n -> if n < 0 then LT else if n > 0 then GT else EQ