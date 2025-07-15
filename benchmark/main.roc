app [main!] {
    cli: platform "https://github.com/roc-lang/basic-cli/releases/download/0.19.0/Hj-J_zxz7V9YurCSTFcFdu6cQJie4guzsPMUi5kBYUk.tar.br",
    sort: "../package/main.roc",
}

import cli.Stdout
import cli.File
import cli.Utc
import cli.Arg
import sort.Sort
import sort.Compare

main! = |args|
    when args |> List.map(Arg.display) is
        [_, "1k", ..] -> run!("1k")
        [_, "10k", ..] -> run!("10k")
        [_, "100k", ..] -> run!("100k")
        [_, "1m", ..] -> run!("1m")
        _ -> Stdout.line!("Usage: sort-bench <1k/10k/100k/1m>")

run! = |size|
    strs = read_file!("${size}.csv")?
    sort_funcs = [
        ("List.sortWith", List.sort_with),
        ("Sort.quicksort", Sort.quicksort),
        ("Sort.mergesort", Sort.mergesort),
    ]
    _ = List.for_each_try!(
        sort_funcs,
        |(name, sort)|
            Stdout.line!("--------------------------------------------------")?
            Stdout.write!("> ${name}, str: ")?
            time = bench_sort_func!(sort, strs)
            Stdout.line!("sorted ${size} elements in ${num_with_commas(time)}ms")
            # Stdout.write!("> ${name}, str2: ")?
            # time2 = bench_sort_func_with_str2!(sort, strs)
            # Stdout.line!("sorted ${size} elements in ${num_with_commas(time2)}ms"),
    )
    Stdout.line!("\n")

read_file! = |filename|
    bytes = File.read_bytes!(filename)?
    Str.from_utf8(bytes)
    |> Result.with_default("")
    |> Str.split_on("\n")
    |> Ok

bench_sort_func! = |sort, strs|
    start = Utc.now!({})
    _ = sort(strs, Compare.str)
    end = Utc.now!({})
    Utc.delta_as_millis(start, end)

# bench_sort_func_with_str2! = |sort, strs|
#     start = Utc.now!({})
#     _ = sort(strs, Compare.str2)
#     end = Utc.now!({})
#     Utc.delta_as_millis(start, end)

num_with_commas = |num|
    num_str = Num.to_str(num)
    if Str.count_utf8_bytes(num_str) > 3 then
        num_str
        |> Str.to_utf8
        |> List.reverse
        |> List.chunks_of(3)
        |> List.map(Str.from_utf8)
        |> List.map(|r| Result.with_default(r, ""))
        |> Str.join_with(",")
        |> Str.to_utf8
        |> List.reverse
        |> Str.from_utf8
        |> Result.with_default("")
    else
        num_str

