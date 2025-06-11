module [square_of_sum, sum_of_squares, difference_of_squares]

square_of_sum : U64 -> U64
square_of_sum = |n|
    n * (n + 1)
    |> |x| x // 2
    |> |x| x * x

sum_of_squares : U64 -> U64
sum_of_squares = |n|
    n * (n + 1) * (2 * n + 1)
    |> |x| x // 6

difference_of_squares : U64 -> U64
difference_of_squares = |number|
    square_of_sum(number) - sum_of_squares(number)
