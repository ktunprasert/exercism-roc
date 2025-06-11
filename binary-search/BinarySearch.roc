module [find]

find : List U64, U64 -> Result U64 _
find = |array, value|
    f = |low, high|
        mid = (low + high) // 2
        when List.get(array, mid) is
            Ok v if v == value -> Ok mid
            Ok _ if low == high -> Err NotFound
            Ok v if v < value -> f (mid + 1) high
            Ok v if v > value -> f low (mid - 1)
            Err _ -> Err No
            wtf -> dbg wtf
    f 0 List.len(array)
