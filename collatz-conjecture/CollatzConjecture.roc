module [steps]

steps : U64 -> Result U64 _
steps = |number|
    collatz = |num, acc|
        when num is
            0 -> Err "huh"
            1 -> Ok acc
            n if Num.is_even n -> collatz (n // 2) (acc + 1)
            n -> collatz (3 * n + 1) (acc + 1)
    collatz number 0
