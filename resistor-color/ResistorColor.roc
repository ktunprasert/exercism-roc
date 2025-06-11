module [color_code, colors]

color_code : Str -> Result U64 _
color_code = |color|
    when color is
        "black" -> Ok 0
        "brown" -> Ok 1
        "red" -> Ok 2
        "orange" -> Ok 3
        "yellow" -> Ok 4
        "green" -> Ok 5
        "blue" -> Ok 6
        "violet" -> Ok 7
        "grey" -> Ok 8
        "white" -> Ok 9
        c -> Err "Unknown color: ${c}"

colors : List Str
colors = [
    "black",
    "brown",
    "red",
    "orange",
    "yellow",
    "green",
    "blue",
    "violet",
    "grey",
    "white",
]

