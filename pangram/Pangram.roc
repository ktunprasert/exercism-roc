module [is_pangram]

is_pangram : Str -> Bool
is_pangram = |sentence|
    sentence
    |> Str.with_ascii_lowercased
    |> Str.walk_utf8
        []
        |acc, u8| if u8 >= 97 && u8 <= 122
            then List.append(acc, u8)
            else acc
    |> Set.from_list
    |> |x| Set.len x == 26

