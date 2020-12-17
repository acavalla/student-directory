#first we list the students
students = [
  {name: "Dr. Hannibal Lecter", cohort: :november},
  {name: "Darth Vader", cohort: :november},
  {name: "Nurse Ratched", cohort: :november},
  {name: "Michael Corleone", cohort: :november},
  {name: "Alex DeLarge", cohort: :november},
  {name: "The Wicked Witch of the West", cohort: :november},
  {name: "Terminator", cohort: :november},
  {name: "Freddy Kreuger", cohort: :november},
  {name: "The Joker", cohort: :november},
  {name: "Joffrey Baratheon", cohort: :november},
  {name: "Norman Bates", cohort: :november}
]

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
  puts "What letter do you want?"
  letter = gets.chomp
  # return the array of students
  return students, letter
end

def print_header
  puts "The students of Villains' Academy"
  puts "-------------"
end

def print(students, letter)
  i = 0
  while i < students.length
    if students[i][:name][0] == letter && students[i][:name].length < 12
      puts "#{i + 1}. #{students[i][:name]} (#{students[i][:cohort]} cohort)"
    end
    i += 1
  end
end

def print_footer(students)
  puts "Overall, we have #{students.count} great students"
end

students, letter = input_students

print_header
print(students, letter)
print_footer(students)

