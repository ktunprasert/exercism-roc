module [convert]

z = Num.is_zero

convert : U64 -> Str
convert = |number|
    ""
    |> |s| if z(number % 3) then "Pling" else s
    |> |s| if z(number % 5) then "${s}Plang" else s
    |> |s| if z(number % 7) then "${s}Plong" else s
    |> |s| if (s == "") then Num.to_str number else s

