# Sheep who become people and are messy
# But are they messy because of cleanliness?
# Or do they die in a mess?
# For lamb chops

class Sheep
  property lifegoal
  property lifeline
  getter name : String
  getter age : Int32
  getter gender : String

  def initialize(@name, @age, @gender)
    @lifegoal = ""
    @lifeline = ""
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

jeff = Sheep.new "Jeff", 6, "male"
jeff.inform
possiblegoals = ["Get a pet dog", "Have some cheese", "Shoe the Donkey"]
jeff.assign_goal(possiblegoals)
puts "#{jeff.lifegoal}"
