module [find]

find : List U64, U64 -> Result U64 _
find = |array, value|
    f = |low, high|
        when (low, high) is
            (x, y) if x == y ->
                Result.try(
                    List.get(array, x),
                    |v| if v == value then Ok x else Err Ooops,
                )
            _ ->
                (low + high)
                |> |x| x // 2
                |> |x| (x, List.get(array, x))
                |> |(x, y)|
                    when y is
                        Ok v ->
                            if v == value then
                                Ok x
                            else if v < value then
                                f (x + 1) high
                            else
                                f low (x - 1)

                        err -> err

    f 0 List.len(array)
