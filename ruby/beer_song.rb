class BeerSong

  def verse(number)
    if number > 1
      b = Bottles.new(number)
    elsif number == 1
      b = Bottle.new(1)
    else
      b = NoBottle.new()
    end
    b.verse()
  end

end

class Verse

  def verse
    refrain + "\n" +
      second_line + ", " +
      "#{nextVerse().bottles_of_beer_on_the_wall()}." + "\n"
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

  def bottles
    raise 'abstract'
  end

  def second_line
    raise 'abstract'
  end

  def nextVerse
    raise 'abstract'
  end

end

class Bottles < Verse

  def initialize(number)
    @number = number
  end

  def bottles
    "#{@number} bottles"
  end

  def second_line
    "Take #{it()} down and pass it around"
  end

  def it
    "one"
  end

  def nextVerse
    if @number > 2
      Bottles.new(@number-1)
    else
      Bottle.new(1)
    end
  end

end

class Bottle < Bottles

  def bottles
    "#{@number} bottle"
  end

  def it
    "it"
  end

  def nextVerse
    NoBottle.new
  end

end

class NoBottle < Verse

  def bottles
    "no more bottles"
  end

  def second_line
    "Go to the store and buy some more"
  end

  def nextVerse
    Bottles.new(99)
  end

end
