def input_students
  puts "Please enter the names and sports teams of the students, separated by a comma"
  puts "To finish, just hit return twice"
  # Create an empty array
  students = []
  # get the first name
  name = gets.chomp
  # while the name is not empty, repeat this code
  while !name.empty? do
    sport = name.split(",")[1].lstrip
    name = name.split(",")[0]
    students << {name: name, cohort: :november, sport: sport}
    puts "Now we have #{students.count} students"
    #Get another name from the user
    name = gets.chomp
  end
  # return the array of students
  return students
end

def print_header
  puts "The students of Villains' Academy"
  puts "-------------"
end

def print(students)
  i = 0
  puts "What letter do you want?"
  letter = gets.chomp
  if letter == "" || letter == " "
    students.each_with_index do | student, index |
      puts "#{index + 1}. #{student[:name]} (#{student[:cohort]} cohort; #{student[:sport]} team)"
    end
  else
    while i < students.length do
      if students[i][:name][0] == letter && students[i][:name].length < 12
        puts "#{i + 1}. #{students[i][:name]} (#{students[i][:cohort]} cohort, #{students[:sport]} team)"
      end
      i += 1
    end
  end
end

def print_footer(students)
  puts "Overall, we have #{students.count} great students"
end

students = input_students
#sport = input_sport
print_header
print(students)
print_footer(students)

