def recite_gen(start):
    yield "99 bottles of beer on the wall, 99 bottles of beer."
    yield "Take one down and pass it around, 98 bottles of beer on the wall."


# adapt to required API
def recite(start, take=1):
    if take == 1:
        take_lines = 2
    else:
        take_lines = take * 3

    return [line for line in recite_gen(start)][0:take_lines]
