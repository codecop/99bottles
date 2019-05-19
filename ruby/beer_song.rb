class BeerSong

  def verses(from, to)
    setBottlesTo(from)

    from.downto(to).
    map { verse }.
    join("\n")
  end

  def verse(number=nil)
    if number then setBottlesTo(number) end # only for first tests

    refrain + "\n" +
    text + ", " +
    nextVerse().bottles_of_beer_on_the_wall() + "." + "\n"
  end

  def refrain
    "#{bottles_of_beer_on_the_wall()}, #{bottles_of_beer()}.".capitalize()
  end

  def bottles_of_beer_on_the_wall
    "#{bottles_of_beer()} on the wall"
  end

  def bottles_of_beer
    "#{bottles()} of beer"
  end

  private

  def setBottlesTo(number)
    if number > 1
      @bottles = Bottles.new(number)
    elsif number == 1
      @bottles = Bottle.new(1)
    else
      @bottles = NoBottles.new()
    end
  end

  def bottles
    @bottles.count
  end

  def text
    @bottles.use
  end

  def nextVerse
    @bottles = @bottles.decrease
    self
  end

end

class Bottles

  def initialize(number)
    @number = number
  end

  def count
    "#{@number} bottles"
  end

  def use
    "Take #{it()} down and pass it around"
  end

  def it
    "one"
  end

  def decrease
    if @number > 2
      Bottles.new(@number-1)
    else
      Bottle.new(1)
    end
  end

end

class Bottle < Bottles

  def count
    "#{@number} bottle"
  end

  def it
    "it"
  end

  def decrease
    NoBottles.new
  end

end

class NoBottles

  def count
    "no more bottles"
  end

  def use
    "Go to the store and buy some more"
  end

  def decrease
    Bottles.new(99)
  end

end
