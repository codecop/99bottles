class BeerSong

  def verse(number)
    Verse.new(number).to_s
  end

end

class Verse

  def initialize(number)
    @number = number
  end

  def to_s
    if @number > 1
      b = Bottles.new(@number)
    elsif @number == 1
      b = OneBottle.new()
    else
      b = NoBottle.new()
    end
    "#{b.description} on the wall, #{b.description}." + "\n"+
    "Take #{b.it} down and pass it around, #{b.next.description} on the wall." + "\n"
  end

end

class Bottles

  def initialize(number)
    @number = number
  end

  def description
    "#{@number} bottles of beer"
  end
  
  def it
    "one"
  end

  def next
    if @number == 2
      OneBottle.new
    else
      Bottles.new(@number-1)
    end
  end

end

class OneBottle

  def description
    "1 bottle of beer"
  end

  def it
    "it"
  end
  
  def next
    NoBottle.new
  end

end

class NoBottle

  def description
    "no more bottles of beer"
  end

  def next
  end

end
