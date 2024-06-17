app [main] {
    cli: platform "https://github.com/roc-lang/basic-cli/releases/download/0.10.0/vNe6s9hWzoTZtFmNkvEICPErI9ptji_ySjicO6CkucY.tar.br",
    sort: "../package/main.roc",
}

import cli.Stdout
import cli.Task exposing [Task]
import cli.File
import cli.Path
import cli.Utc
import cli.Arg
import sort.Sort
import sort.Compare

main : Task {} _
main =
    args = Arg.list |> Task.onErr! \_ -> Task.ok []
    when args is
        [_, "1k", ..] -> run "1k"
        [_, "10k", ..] -> run "10k"
        [_, "100k", ..] -> run "100k"
        [_, "1m", ..] -> run "1m"
        _ -> Stdout.line! "Usage: sort-bench <1k/10k/100k/1m>"

run : Str -> Task {} _
run = \size ->
    strs = readFile! "$(size).csv"
    sortFuncs = [
        ("List.sortWith", List.sortWith), 
        ("Sort.quicksort", Sort.quicksort),
        ("Sort.mergesort", Sort.mergesort),
    ] 
    Task.forEach! sortFuncs \(name, sort) -> 
        Stdout.line! "----------------------------------"
        Stdout.write! "> $(name): "
        time = benchSortFunc! sort strs
        Stdout.line "sorted $(size) elements in $(numWithCommas time)ms"   
    Stdout.line! "\n"  

readFile = \filename -> 
    bytes = File.readBytes! (Path.fromStr filename)
    Str.fromUtf8 bytes 
    |> Result.withDefault ""
    |> Str.split "\n"
    |> Task.ok

benchSortFunc = \sort, strs ->
    start = Utc.now!
    _ = sort strs Compare.str
    end = Utc.now!
    Utc.deltaAsMillis start end |> Task.ok

numWithCommas = \num ->
    numStr = Num.toStr num
    if Str.countUtf8Bytes numStr > 3 then
        numStr
        |> Str.toUtf8 
        |> List.reverse
        |> List.chunksOf 3
        |> List.map Str.fromUtf8 
        |> List.map \r -> Result.withDefault r ""
        |> Str.joinWith ","
        |> Str.toUtf8
        |> List.reverse
        |> Str.fromUtf8
        |> Result.withDefault ""
    else
        numStr
    
