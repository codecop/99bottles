class BeerSong

  def set(number)
    if number > 1
      @bottles = Bottles.new(number)
    elsif number == 1
      @bottles = Bottle.new(1)
    else
      @bottles = NoBottle.new()
    end
  end
  
  def verse(number)
    set(number)
    
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
    @bottles.bottles
  end

  def second_line
    @bottles.second_line
  end

  def nextVerse
    @bottles = @bottles.nextVerse
    self
  end

end

class Bottles

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

class NoBottle

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
