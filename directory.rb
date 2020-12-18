def input_students
  puts "Please enter the names of the students"
  puts "To finish, just hit return twice"
  # Create an empty array
  students = []
  # get the first name
  name = gets.chomp
  # while the name is not empty, repeat this code
  while !name.empty? do
    students << {name: name, cohort: :november}
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
  while i < students.length do
    if students[i][:name][0] == letter && students[i][:name].length < 12
      puts "#{i + 1}. #{students[i][:name]} (#{students[i][:cohort]} cohort)"
    end
    i += 1
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

