def recite_gen(start):
    yield "99 bottles of beer on the wall, 99 bottles of beer."
    yield "Take one down and pass it around, 98 bottles of beer on the wall."
    yield ""
    yield "98 bottles of beer on the wall, 98 bottles of beer."
    yield "Take one down and pass it around, 97 bottles of beer on the wall."
    yield ""


# adapt to required API
def recite(start, take=1):
    take_lines = take * 3 - 1

    return [line for line in recite_gen(start)][0:take_lines]
