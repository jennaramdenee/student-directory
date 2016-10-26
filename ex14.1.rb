require 'csv'
@students = []

def try_load_students
  puts "What file would you like to load?"
  filename = STDIN.gets.chomp
  return if filename.nil?
  if File.exist?(filename)
    load_students
    puts "Loaded #{@students.count} from #{filename}"
  else
    puts "Sorry, #{filename} does not exist"
  end
end

def interactive_menu
  load_students
  loop do
    print_menu
    user_selection(STDIN.gets.chomp)
  end
end

def print_menu
  # show user list of options and ask for user input
  puts "1. Input the students"
  puts "2. Show the students"
  puts "3. Save the students"
  puts "4. Load the students"
  puts "9. Exit"
end

def confirm_selection(selection)
  puts "Option #{selection} successfully executed!"
end

def user_selection(selection)
  case selection
    when "1"
      input_students
      confirm_selection(selection)
    when "2"
      show_students
      confirm_selection(selection)
    when "3"
      save_students
      confirm_selection(selection)
    when "4"
      try_load_students
      confirm_selection(selection)
    when "9"
      exit
    else
      puts "I don't know what you meant, try again"
  end
end

def input_students
  puts "Please enter the names of the students and their cohort"
  puts "To finish, just hit return twice"
  #get first name
  name, cohort = STDIN.gets.split.map {|input| input.to_s}
  #while response is not empty
  while name != nil do
    #if cohorts is empty
    if cohort == nil
      puts "Must provide a value for both name and cohort"
    else
    #add student hash to the array
      add_students_to_array(name, cohort)
      @students.count == 1 ? student_char = "student" : student_char = "students"
      puts "Now we have #{@students.count} #{student_char}"
    end
    #get another name from the user
    name, cohort = STDIN.gets.split.map {|input| input.to_s}
  end
end

def show_students
  print_header
  print_student_list
  print_footer
end

def print_header
  puts "The students of Villains Academy"
  puts "-------------"
end

def print_student_list
  @students.each do |student|
    puts "#{student[:name]} (#{student[:cohort]} cohort)"
  end
end

def print_footer
  @students.count == 1 ? student_char = "student" : student_char = "students"
  puts "Overall, we have #{@students.count} great #{student_char}"
end

def save_students
  puts "What file would you like to save to?"
  filename = STDIN.gets.chomp
  CSV.open(filename, 'w') do |csv|
    @students.each do |student|
      student_data = [student[:name], student[:cohort]]
      csv_line = student_data.join(",")
      csv << [csv_line]
    end
  end
end

def load_students(filename = "students.csv")
  #file = File.open(filename, 'r') do
    #file.readlines.each do |line|
    CSV.foreach(filename, { :col_sep => ','}) do |row|
      line = row.join("")
      name, cohort = line.split(",")
      add_students_to_array(name, cohort)
    end
  #end
end

def add_students_to_array(name, cohort)
  @students << {name: name, cohort: cohort.to_sym}
end

interactive_menu
