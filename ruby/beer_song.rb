class BeerSong

  def verse(number)
    if number > 1
      b = Bottles.new(number)
    elsif number == 1
      b = OneBottle.new(1)
    else
      b = NoBottle.new()
    end
    b.verse()
  end

end

class Bottles

  def initialize(number)
    @number = number
  end

  def verse
    "#{description()} on the wall, #{description()}." + "\n" +
    "Take #{it()} down and pass it around, #{nextB().description()} on the wall." + "\n"
  end

  def description
    "#{@number} bottles of beer"
  end

  def it
    "one"
  end

  def nextB
    if @number > 2
      Bottles.new(@number-1)
    else
      OneBottle.new(1)
    end
  end

end

class OneBottle < Bottles

  def description
    "1 bottle of beer"
  end

  def it
    "it"
  end

  def nextB
    NoBottle.new
  end

end

class NoBottle

  def verse
    "#{description()} on the wall, #{description()}." + "\n" +
    "Go to the store and buy some more, 99 bottles of beer on the wall." + "\n"
  end
  
  def description
    "no more bottles of beer"
  end

end
