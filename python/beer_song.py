def recite_gen():
    # verses
    verse = "{}, {}."

    bottles_of_beer_on_the_wall = "{} bottles of beer on the wall"
    bottles_of_beer = "{} bottles of beer"

    one_bottle_of_beer_on_the_wall = "1 bottle of beer on the wall"
    one_bottle_of_beer = "1 bottle of beer"

    take_one_down_pass_it_around = "Take one down and pass it around"

    newline = ""

    bottles = 99
    while True:
        yield verse.format(
            bottles_of_beer_on_the_wall.format(bottles),
            bottles_of_beer.format(bottles)
        )

        bottles -= 1
        if bottles == 1:
            break

        yield verse.format(
            take_one_down_pass_it_around,
            bottles_of_beer_on_the_wall.format(bottles)
        )
        yield newline

    yield verse.format(
        take_one_down_pass_it_around,
        one_bottle_of_beer_on_the_wall
    )
    yield newline

    yield verse.format(
        one_bottle_of_beer_on_the_wall,
        one_bottle_of_beer
    )
    yield verse.format(
        "Take it down and pass it around",
        bottles_of_beer_on_the_wall.format('no more')
    )
    yield newline

    yield verse.format(
        bottles_of_beer_on_the_wall.format('No more'),
        bottles_of_beer.format('no more')
    )
    bottles = 99
    yield verse.format(
        "Go to the store and buy some more",
        bottles_of_beer_on_the_wall.format(bottles)
    )


# adapt to required API
def recite(start, take=1):
    start_lines = (99 - start) * 3
    take_lines = start_lines + take * 3 - 1
    return [line for line in recite_gen()][start_lines:take_lines]
