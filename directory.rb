
students = [
{name: "Dr. Hannibal Lecter", cohort: :november},
{name: "Darth Vader", cohort: :november},
{name: "Nurse Ratched", cohort: :november},
{name: "Michael Corleone", cohort: :november},
{name: "Alex DeLarge", cohort: :november},
{name: "The Wicked Witch of the West", cohort: :november},
{name: "Terminator", cohort: :november},
{name: "Freddy Krueger", cohort: :november},
{name: "The Joker", cohort: :november},
{name: "Joffrey Baratheon", cohort: :november},
{name: "Norman Bates", cohort: :november}
]

=begin
def input_students
  puts "Please enter the names of the students"
  puts "To finish, just hit return twice"
  # creat an empty array
  students = []
  # get the first names
  name = gets.chomp
  # while the name is not empty, repeat this code
  while !name.empty? do
    # add the student hash to the array
    students << {name: name, cohort: :november}
    puts "Now we have  #{students.count} students"
    # get another name from the user
    name = gets.chomp
  end
  # return the array of students
  students
end
=end

def print_header
  puts "The students of Villains Academy"
  puts "-------------"
end

def print(students)
  students.each_with_index do |student, i|
    puts "#{i + 1}. #{student[:name]} (#{student[:cohort]} cohort)"
  end
end

def print_letter_selection(students)
  puts "Select students with names starting with: "
  letter = gets.chomp.capitalize
  students_selection = students.select { |student| student[:name][0] == letter}
  students_selection.each { |student| puts student[:name] }
end

def students_lessthan_x(students)
  num_char = 12
  puts "Here are the students with less than #{num_char} characters in their name: "
  students_selection = students.select { |student| student[:name].length < num_char}
  students_selection.each { |student| puts student[:name] }
end

def print_footer(students)
  puts "Overall, we have #{students.count} great students"
end

# nothing happens until we call the methods
#students = input_students
print_header
print(students)
print_footer(students)
print_letter_selection(students)
students_lessthan_x(students)
