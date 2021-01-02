require 'CSV'

@students = [] # an empty array accessible to all methods

def interactive_menu
  loop do
    print_menu
    user_input(STDIN.gets.chomp)
  end
end

def print_menu
  puts "1. Input the students"
  puts "2. Show the students"
  puts "3. Save the current list"
  puts "4. Load a list"
  puts "9. Exit" # 9 because we'll be adding more items
end

def user_input(selection)
  case selection
    when "1"
      students = input_students
    when "2"
      show_students
    when "3", "4"
      puts "What filename would you like to save to or load from?"
      filename = STDIN.gets.chomp
      save_students(filename) if selection == "3"
      load_students(filename) if selection == "4"
    when "9"
      exit
    else
      puts "I don't know what you mean, try again"
  end
  feedback(selection)
end

# 1
def input_students
  name, cohort = input_instruct
  # while the name is not empty, repeat this code
  while !name.empty? do
    populate_students(name, cohort)
    puts "Now we have #{@students.count} students"
  # get another name from the user
    name = STDIN.gets.chomp
  end
end
# 1
def input_instruct
  puts "Please enter the names of the students"
  puts "To finish, just hit return twice"
  name, cohort = STDIN.gets.chomp, "november"
end

# 2
def show_students
  print_header
  print_students_list
  print_footer
end
# 2
def print_header
  puts "The students of my cohort at Makers Academy"
  puts "-------------"
end
#2
def print_students_list
  if @students.count != 0
    @students.each do | student |
      puts "#{student[:name]} (#{student[:cohort]} cohort)"
    end
  end
end
#2
def print_footer
  puts "Overall, we have #{@students.count} great students"
end

#3
def save_students(filename)
  @students.each do | student |
    student_data = student[:name], student[:cohort]
    CSV.open(filename, "a") { | csv | csv << student_data }
  end
end

#4
def load_students(filename)
  CSV.foreach(filename) { | line | populate_students(line[0], line[1]) }
end

def populate_students(name, cohort)
  @students << {name: name, cohort: cohort.to_sym}
end

def feedback(selection)
  case selection
    when "1"
      puts "Students input successfully"
    when "2"
      puts "Students displayed successfully"
    when "3"
      puts "Students saved successfully"
    when "4"
      puts "Students loaded successfully"
  end
end

def try_load_students
  filename = ARGV.first # first argument given in shell
  if filename.nil?
    filename = "students.csv"
  elsif File.exists?(filename) == false # if it doesn't exist
    puts "Sorry, #{filename} doesn't exist"
    exit
  end
  load_students(filename)
  puts "Loaded #{@students.count} from #{filename}"
end

#try_load_students
interactive_menu
