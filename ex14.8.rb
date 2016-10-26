# Write a short program that reads its own source code
# (search StackOverflow to find out how to get the name of the currently executed file)
# and prints it on the screen

# $0 is the name of the file used to start the program.
# __method__:<name> is variable for current method

def read_source_code
  puts File.readlines($0)
end

read_source_code
