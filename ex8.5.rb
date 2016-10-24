#students array
students = [
  {name: "Dr. Hannibal Lecter", cohort: :november, country: "UK"},
  {name: "Darth Vader", cohort: :november, country: "US"},
  {name: "Nurse Ratched", cohort: :november, country: "Albania"},
  {name: "Michael Corleone", cohort: :november, country: "Sweden"},
  {name: "Alex DeLarge", cohort: :november, country: "Denmark"},
  {name: "The Wicked Witch of the West", cohort: :november, country: "UK"},
  {name: "Terminator", cohort: :november, country: "Germany"},
  {name: "Freddy Kreuger", cohort: :november, country: "Germany"},
  {name: "The Joker", cohort: :november, country: "France"},
  {name: "Joffrey Baratheon", cohort: :november, country: "King's Landing"},
  {name: "Norman Bates", cohort: :november, country: "US"}
]

def print_header
  puts "The students of Villains Academy"
  puts "-------------"
end

def print(students)
  students.each do |student|
    puts "#{student[:name]} in the (#{student[:cohort]} cohort, from #{student[:country]})"
  end
end

def print_footer(students)
  puts "Overall, we have #{students.count} great students"
end

# def input_students
#   puts "Please enter the names of the students"
#   puts "To finish, just hit return twice"
#   #create an empty array
#   students = []
#   #get first name
#   name = gets.chomp
#   #while the name is not empty, repeat this code
#   while !name.empty? do
#     #add student hash to the array
#     students << {name: name, cohort: :november}
#     puts "Now we have #{students.count} students"
#     #get another name from the user
#     name = gets.chomp
#   end
#   #return the array of students
#   students
# end
#
# students = input_students
print_header
print(students)
print_footer(students)
