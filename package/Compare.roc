module [num, num_reverse, str, str2, str_reverse]

num : Num a, Num a -> [LT, EQ, GT]
num = |a, b| if a < b then LT else if a > b then GT else EQ

num_reverse : Num a, Num a -> [LT, EQ, GT]
num_reverse = |a, b| num(b, a)

str : Str, Str -> [LT, EQ, GT]
str = |a, b|
    if a == b then
        EQ
    else
        bytes_a = Str.to_utf8(a)
        bytes_b = Str.to_utf8(b)
        comp_list = List.map2(
            bytes_a,
            bytes_b,
            |byte_a, byte_b|
                if byte_a < byte_b then LT else if byte_a > byte_b then GT else EQ,
        )
        (List.find_first(comp_list, |comp| comp != EQ))
        |> Result.with_default((Num.to_i64(List.len(bytes_a)) - Num.to_i64(List.len(bytes_b)) |> num_to_comparator))

str2 : Str, Str -> [LT, EQ, GT]
str2 = |str_a, str_b|
    bytes_a = Str.to_utf8(str_a)
    bytes_b = Str.to_utf8(str_b)
    ns = List.range({ start: At 0, end: Before (List.len(bytes_a)) })
    List.walk_until(
        ns,
        EQ,
        |_, i|
            when (List.get(bytes_a, i), List.get(bytes_b, i)) is
                (Ok(a), Ok(b)) -> if a < b then Break(LT) else if a > b then Break(GT) else Continue(EQ)
                (Err(_), Ok(_)) -> Break(LT)
                (Ok(_), Err(_)) -> Break(GT)
                (Err(_), Err(_)) -> Break(EQ),
    )
    |> |comp|
        if comp == EQ then
            len_a = List.len(bytes_a) |> Num.to_i128
            len_b = List.len(bytes_b) |> Num.to_i128
            num_to_comparator(len_a - len_b)
        else
            comp

str_reverse : Str, Str -> [LT, EQ, GT]
str_reverse = |a, b| str(b, a)

num_to_comparator : Num a -> [LT, EQ, GT]
num_to_comparator = |n| if n < 0 then LT else if n > 0 then GT else EQ
