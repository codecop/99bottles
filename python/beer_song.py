def recite_gen(start):
    bottles = 99

    while bottles >= 3:
        yield "{number} bottles of beer on the wall, {number} bottles of beer.".format(number=bottles)
        bottles -= 1
        yield "Take one down and pass it around, {number} bottles of beer on the wall.".format(number=bottles)
        yield ""

    yield "2 bottles of beer on the wall, 2 bottles of beer."
    yield "Take one down and pass it around, 1 bottle of beer on the wall."
    yield ""
    yield "1 bottle of beer on the wall, 1 bottle of beer."
    yield "Take it down and pass it around, no more bottles of beer on the wall."
    yield ""
    yield "No more bottles of beer on the wall, no more bottles of beer."
    yield "Go to the store and buy some more, 99 bottles of beer on the wall."


# adapt to required API
def recite(start, take=1):
    start_lines = (99 - start) * 3
    take_lines = start_lines + take * 3 - 1

    return [line for line in recite_gen(start)][start_lines:take_lines]
