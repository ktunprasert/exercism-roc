app [main!] { pf: platform "https://github.com/roc-lang/basic-cli/releases/download/0.19.0/Hj-J_zxz7V9YurCSTFcFdu6cQJie4guzsPMUi5kBYUk.tar.br" }

import pf.Stdout
import Pangram exposing [is_pangram]

main! = |_|
    _ = is_pangram("abcdefghijklmnopqrstuvwxyz")
    Stdout.write! ""
