# Sheep class
# sheep have names, ages, genders (multiple to avoid modern arguements),
# a lifegoal and a lifeline
# Lifelines are mottos to live by

class Sheep
  property lifegoal : String
  property lifeline : String
  property idiot : Bool
  property friend : Sheep
  property is_friend : Bool
  getter name : String
  getter age : Int32
  getter gender : String

  def initialize(@name, @age, @gender)
    @lifegoal = ""
    @lifeline = ""
    @idiot = false
    @friend = nil
    @is_friend = false
  end

  def inform
    puts "Bahh - my name is #{@name}. I am #{@age} years old and am #{@gender}."
  end

  def assign_goal(possiblegoals)
    @lifegoal = possiblegoals[Random.rand(possiblegoals.size)]
  end

  def assign_line(possiblelines)
    @lifeline = possiblelines[Random.rand(possiblelines.size)]
  end
end
