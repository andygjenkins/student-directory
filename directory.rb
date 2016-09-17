=begin
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
=end

def input_students
  puts "Please enter student details"
  # creat an empty array
  students = []
  # get the first names
  puts "What is their name?"
  name = gets.chomp
  puts "What cohort are they in"
  cohort = gets.chomp.downcase.to_sym
  if cohort.empty?
    chort = :november
  end
  puts "Where were they born?"
  cob = gets.chomp
  # while the name is not empty, repeat this code
  while !name.empty? do
    # add the student hash to the array
    students << {name: name, cob: cob, cohort: cohort}
    puts "Now we have  #{students.count} students"
    # prompt for additional students
    puts "Add another student? (y/n)"
    break if gets.chomp == "n"
    puts "What is their name?"
    name = gets.chomp
    puts "What cohort are they in"
    cohort = gets.chomp.downcase.to_sym
    if cohort.empty?
      chort = :november
    end
    puts "Where were they born?"
    cob = gets.chomp
  end
  # return the array of students
  students
end


def print_header
  puts "The students of Villains Academy".center(40)
  puts "".center(40, '-')
end

def print(students)
  n = 1
  while n <= students.length
    puts "#{n}. #{students[n-1][:name]} (#{students[n-1][:cohort]} cohort)".center(40)
    n += 1
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
  puts "Overall, we have #{students.count} great students".center(40)
end

# nothing happens until we call the methods
students = input_students
print_header
print(students)
print_footer(students)
#print_letter_selection(students)
#students_lessthan_x(students)
