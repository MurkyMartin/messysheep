# setup for messysheep
# assembles the sheep based on user input and also the goals / lines
# There are default settings also

require "./Sheep"

def create
  num_options = 4

  # first, specify the defaults

  default_num_sheep = 5
  default_names = ["Jeff", "George", "Archer", "Baker", "Kimura"]
  default_goals = ["Get a house", "Have some cheese", "Beer",
                   "Acquire a pen", "Answer the phone"]
  default_lines = ["No", "Shall I share?", "Do I have to?", "Only more.", "Oof"]
  default_idiot_index = Random.rand(default_num_sheep)

  # Here we need to ensure a proper value for all options are selected
  # We could have nested while loops ensuring that we stick to on question
  # until it's happy. But that's combersome to track.
  # Instead - have a single until loop and skip the ones already happy

  # initialize the checks:
  all_options_done = [] of Int32
  option_num_sheep = false
  option_name = false
  option_goal = false
  option_line = false

  until all_options_done.size == num_options
    if !option_num_sheep
      puts "Choose number of sheep (default is #{default_num_sheep}:"
      input_sheep_num = gets
      begin
        if input_sheep_num
          input_sheep_num = input_sheep_num.chomp.to_i
          puts "You chose #{input_sheep_num} sheep."
          option_num_sheep = true
          all_options_done.push(1)
        end
      rescue ArgumentError
        puts "'#{input_sheep_num}' is not a number - try again"
      end
    end
    if !option_name
      input_names = [] of String
      input_names = input_loops(input_sheep_num, "name")
      option_name = true
      all_options_done.push(2)
    end
    if !option_goal
      input_goals = [] of String
      input_goals = input_loops(input_sheep_num, "goal")
      option_goal = true
      all_options_done.push(3)
    end
    if !option_line
      input_lines = [] of String
      input_lines = input_loops(input_sheep_num, "line")
      option_line = true
      all_options_done.push(4)
    end
  end
  puts "You chose the following:\n
        -#{input_sheep_num} number of sheep\n
        -#{input_names} names\n
        -#{input_goals}\n
        -#{input_lines}\n"
end

def input_loops(num_sheep : Int32, input_type : String)
  name_type = "name"
  goal_type = "goal"
  line_type = "line"

  output_list = [] of String

  message = ""

  case input_type
  when name_type
    message = "Type in a name - press enter to submit. Repeat #{num_sheep} times."
  when goal_type
    message = "Type in a goal - press enter to submit. Repeat #{num_sheep} times."
  when line_type
    message = "Type in a line - press enter to submit. Repeat #{num_sheep} times."
  else
    puts "Nothing here is valid - exiting"
    exit
  end

  sheep = 0
  puts "#{message}"
  while sheep < num_sheep
    next_name = gets
    if next_name
      output_list.push(next_name)
      sheep += 1
    else
      next "Detected nil - try again"
    end
  end
  return output_list
end

create()
