#students array
# students = [
#   {name: "Dr. Hannibal Lecter", cohort: :november},
#   {name: "Darth Vader", cohort: :november},
#   {name: "Nurse Ratched", cohort: :november},
#   {name: "Michael Corleone", cohort: :november},
#   {name: "Alex DeLarge", cohort: :november},
#   {name: "The Wicked Witch of the West", cohort: :november},
#   {name: "Terminator", cohort: :november},
#   {name: "Freddy Kreuger", cohort: :november},
#   {name: "The Joker", cohort: :november},
#   {name: "Joffrey Baratheon", cohort: :november},
#   {name: "Norman Bates", cohort: :november}
# ]


def print_header
  puts "The students of Villains Academy"
  puts "-------------"
end

def print(students)
  students.each do |student|
    puts "#{student[:name]} (#{student[:cohort]} cohort)"
  end
end

def print_footer(students)
  if students.count > 1
    student_char = "students"
  else
    student_char = "student"
  end
  puts "Overall, we have #{students.count} great #{student_char}"
end

def input_students
  puts "Please enter the names of the students"
  puts "To finish, just hit return twice"
  #create an empty array
  students = []
  #get first name
  name = gets.chomp
  #while the name is not empty, repeat this code
  while !name.empty? do
    #add student hash to the array
    students << {name: name, cohort: :november}
    if students.count == 1
      student_char = "student"
    else
      student_char = "students"
    end
    puts "Now we have #{students.count} #{student_char}"
    #get another name from the user
    name = gets.chomp
  end
  #return the array of students
  students
end

students = input_students
print_header
print(students)
print_footer(students)
