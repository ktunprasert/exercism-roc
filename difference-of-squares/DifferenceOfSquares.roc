module [square_of_sum, sum_of_squares, difference_of_squares]

square_of_sum : U64 -> U64
square_of_sum = |number|
    List.range({ start: At 1, end: At number })
    |> List.sum
    |> |x| x * x

sum_of_squares : U64 -> U64
sum_of_squares = |number|
    List.range({ start: At 1, end: At number })
    |> List.map |x| x * x
    |> List.sum

difference_of_squares : U64 -> U64
difference_of_squares = |number|
    number
    |> |n| square_of_sum(n) - sum_of_squares(n)
