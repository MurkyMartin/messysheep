# setup for messysheep
# assembles the sheep based on user input and also the goals / lines
# There are default settings also

require "./Sheep"

num_options = 4

# first, specify the defaults

default_num_sheep = 5
default_names = ["Jeff", "George", "Archer", "Baker", "Kimura"]
default_goals = ["Get a house", "Have some cheese", "Beer",
                 "Acquire a pen", "Answer the phone"]
default_lines = ["No", "Shall I share?", "Do I have to?", "Only more.", "Oof"]
default_idiot_index = Random.rand(default_num_sheep)

all_options_done = [] of Int32

until all_options_done.size == num_options
  puts "Choose number of sheep (default is #{default_num_sheep}:"
  input_sheep_num = gets
  begin
    if input_sheep_num
      input_sheep_num = input_sheep_num.chomp.to_i
      puts "You chose #{input_sheep_num} sheep."
    else
      exit
    end
  rescue ArgumentError
    puts "'#{input_sheep_num}' is not a number"
  end
end
