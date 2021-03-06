def input_students
  puts "Please enter the names, sports teams and cohorts of the students, separated by a comma"
  puts "To finish, just hit return twice"
  # Create an empty array
  students = []
  # get the first name
  name = gets.rstrip
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
  new_hash = []
  students.each do | student |
    if new_hash.include?(student[:cohort]) == false
      new_hash = new_hash.push(student[:cohort])
    end
  end
  puts new_hash[0].to_s.center(70)
  for i in 0..(new_hash.length - 1) do
    if new_hash[i] != new_hash[i - 1] && i != 0
      puts new_hash[i].to_s.center(70)
    end
    students.each do | student |
      if student[:cohort] == new_hash[i]
        puts "#{student[:name]}".center(70)
      end
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
print_header
print(students)
print_footer(students)

