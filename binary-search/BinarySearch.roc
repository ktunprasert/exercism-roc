module [find]

find : List U64, U64 -> Result U64 _
find = |array, value|
    f = |low, high|
        when (low, high) is
            (x, y) if x == y ->
                array
                |> List.get x
                |> Result.try |v| if v == value then Ok x else Err Oops

            _ ->
                (low + high)
                |> |x| x // 2
                |> |x| (x, List.get(array, x))
                |> |(mid, y)|
                    y
                    |> Result.try
                        |v|
                            if v == value then
                                Ok mid
                            else if
                                v < value
                            then
                                f (mid + 1) high
                            else
                                f low (mid - 1)

    f 0 List.len(array)
