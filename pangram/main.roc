app [main!] { pf: platform "https://github.com/roc-lang/basic-cli/releases/download/0.19.0/Hj-J_zxz7V9YurCSTFcFdu6cQJie4guzsPMUi5kBYUk.tar.br" }

import pf.Stdout
import Pangram exposing [is_pangram]

main! = |_|
    _ = is_pangram("abcdefghijklmnopqrstuvwxyz")
    _ = is_pangram("")
    _ = is_pangram("abcdefghijklmnopqrstuvwxyz")
    _ = is_pangram("the quick brown fox jumps over the lazy dog")
    _ = is_pangram("a quick movement of the enemy will jeopardize five gunboats")
    _ = is_pangram("five boxing wizards jump quickly at it")
    _ = is_pangram("the_quick_brown_fox_jumps_over_the_lazy_dog")
    _ = is_pangram("the 1 quick brown fox jumps over the 2 lazy dogs")
    _ = is_pangram("7h3 qu1ck brown fox jumps ov3r 7h3 lazy dog")
    _ = is_pangram("\"Five quacking Zephyrs jolt my wax bed.\"")
    _ = is_pangram("abcdefghijklm ABCDEFGHIJKLM")
    Stdout.write! ""
