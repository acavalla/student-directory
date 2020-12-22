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
  puts "3. Save the list to students.csv"
  puts "4. Load the list from students.csv"
  puts "9. Exit" # 9 because we'll be adding more items
end

def user_input(selection)
  case selection
    when "1"
      students = input_students
    when "2"
      show_students
    when "3"
      save_students
    when "4"
      load_students
    when "9"
      exit
    else
      puts "I don't know what you mean, try again"
  end
  feedback(selection)
end

def input_students
  puts "Please enter the names of the students"
  puts "To finish, just hit return twice"
  # get the first name
  name = STDIN.gets.chomp
  cohort = "november"
  # while the name is not empty, repeat this code
  while !name.empty? do
    populate_students(name, cohort)
    puts "Now we have #{@students.count} students"
  # get another name from the user
    name = STDIN.gets.chomp
  end
end

def show_students
  print_header
  print_students_list
  print_footer
end

def print_header
  puts "The students of my cohort at Makers Academy"
  puts "-------------"
end

def print_students_list
  if @students.count != 0
    @students.each do | student |
      puts "#{student[:name]} (#{student[:cohort]} cohort)"
    end
  end
end

def print_footer
  puts "Overall, we have #{@students.count} great students"
end

def save_students
  file = File.open("students.csv", "w")
  @students.each do | student |
    student_data = [student[:name]], [student[:cohort]]
    csv_line = student_data.join(",")
    file.puts csv_line
  end
  file.close
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

def load_students(filename = "students.csv")
  file = File.open(filename, "r")
  file.readlines.each do | line |
    name, cohort = line.chomp.split(",")
    populate_students(name, cohort)
    #@students << {name: name, cohort: cohort.to_sym}
  end
  file.close
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


try_load_students
interactive_menu
#students = input_students
#print_header
#print(students)
#print_footer(students)
