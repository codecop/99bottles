def recite_gen(start):
    bottles = 99

    while bottles >= 3:
        yield "{number} bottles of beer on the wall, {number} bottles of beer.".format(number=bottles)
        bottles -= 1
        yield "Take one down and pass it around, {number} bottles of beer on the wall.".format(number=bottles)
        yield ""


# adapt to required API
def recite(start, take=1):
    take_lines = take * 3 - 1

    return [line for line in recite_gen(start)][0:take_lines]
