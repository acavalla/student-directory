def input_students
  puts "Please enter the names, sports teams and cohorts of the students, separated by a comma"
  puts "To finish, just hit return twice"
  # Create an empty array
  students = []
  # get the first name
  name = gets.chomp
  # while the name is not empty, repeat this code
  while !name.empty? do
    case name.split(",").length
      when 1
        name = name.lstrip.rstrip
        sport = "no sports"
        cohort = "november"
      when 2
        sport = name.split(",")[1].lstrip.rstrip
        name = name.split(",")[0].lstrip.rstrip
        cohort = "november"
      when 3
        cohort = name.split(",")[2].lstrip.rstrip
        sport = name.split(",")[1].lstrip.rstrip
        name = name.split(",")[0].lstrip.rstrip
    end
    students << {name: name, cohort: cohort.to_sym, sport: sport}
    if students.count == 1
      puts "Now we have 1 student"
    else
      puts "Now we have #{students.count} students"
    end
    #Get another name from the user
    name = gets.chomp
  end
  # return the array of students
  return students
end

def print_header
  puts "The students of Villains' Academy".center(70)
  puts "-------------".center(70)
end

def print(students)
  i = 0
  puts "What letter do you want?".center(70)
  letter = gets.chomp
  if letter == "" || letter == " "
    students.each_with_index do | student, index |
      puts "#{index + 1}. #{student[:name]} (#{student[:cohort]} cohort; #{student[:sport]} team)".center(70)
    end
  else
    while i < students.length do
      if students[i][:name][0] == letter && students[i][:name].length < 12
        puts "#{i + 1}. #{students[i][:name]} (#{students[i][:cohort]} cohort, #{students[i][:sport]} team)".center(70)
      end
      i += 1
    end
  end
end

def print_footer(students)
  if students.count == 1
    puts "Overall, we have 1 great student"
  else
    puts "Overall, we have #{students.count} great students"
  end
end

students = input_students
puts students
print_header
print(students)
print_footer(students)

