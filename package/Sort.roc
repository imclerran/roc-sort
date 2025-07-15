module [quicksort, mergesort, sort_nums, sort_nums_rev, sort_strs, sort_strs_rev]

import Unsafe exposing [unwrap]
import Compare

quicksort : List a, (a, a -> [LT, EQ, GT]) -> List a
quicksort = |list, compare|
    if List.len(list) < 2 then
        list
    else
        pivot_idx = (List.len(list)) // 2
        pivot = list |> List.get(pivot_idx) |> unwrap("quicksort: get pivot should never fail")
        (before, after) = List.walk_with_index(
            list,
            ([], []),
            |(lts, gts), x, i|
                when compare(x, pivot) is
                    LT -> (List.append(lts, x), gts)
                    EQ if i != pivot_idx -> (List.append(lts, x), gts)
                    EQ -> (lts, gts)
                    GT -> (lts, List.append(gts, x)),
        )
        quicksort(before, compare) |> List.append(pivot) |> List.concat(quicksort(after, compare))
# List.join([quicksort(before, compare), [pivot], quicksort(after, compare)])

mergesort : List a, (a, a -> [LT, EQ, GT]) -> List a
mergesort = |list, compare|
    if List.len(list) < 2 then
        list
    else
        midpoint = (List.len(list)) // 2
        { before, others } = List.split_at(list, midpoint)
        merge(mergesort(before, compare), mergesort(others, compare), compare)

merge : List a, List a, (a, a -> [LT, EQ, GT]) -> List a
merge = |left, right, compare|
    when (left, right) is
        ([], _) -> right
        (_, []) -> left
        ([l, .. as ls], [r, .. as rs]) ->
            when compare(l, r) is
                GT -> List.prepend(merge(left, rs, compare), r)
                _ -> List.prepend(merge(ls, right, compare), l)

        (_, _) ->
            crash("merge: The previous cases should be exhaustive.")

sort_nums : List (Num a) -> List (Num a)
sort_nums = |list| quicksort(list, Compare.num)

sort_nums_rev : List (Num a) -> List (Num a)
sort_nums_rev = |list| quicksort(list, Compare.num_reverse)

sort_strs : List (Str a) -> List (Str a)
sort_strs = |list| quicksort(list, Compare.str)

sort_strs_rev : List (Str a) -> List (Str a)
sort_strs_rev = |list| quicksort(list, Compare.str_reverse)
