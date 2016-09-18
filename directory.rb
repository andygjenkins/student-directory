=begin
students = [
{name: "Dr. Hannibal Lecter", cohort: :september},
{name: "Darth Vader", cohort: :september},
{name: "Nurse Ratched", cohort: :september},
{name: "Michael Corleone", cohort: :november},
{name: "Alex DeLarge", cohort: :november},
{name: "The Wicked Witch of the West", cohort: :november},
{name: "Terminator", cohort: :november},
{name: "Freddy Krueger", cohort: :november},
{name: "The Joker", cohort: :september},
{name: "Joffrey Baratheon", cohort: :september},
{name: "Norman Bates", cohort: :november}
]
=end
@students = [] # an empty array accessible to all methods

def input_students
  puts "Please enter student details"
  # creat an empty array
  # get the first names
  puts "What is their name?"
  name = gets.strip
  puts "What cohort are they in"
  cohort = gets.strip.downcase.to_sym
  if cohort.empty?
    chort = :november
  end
  puts "Where were they born?"
  cob = gets.strip
  # while the name is not empty, repeat this code
  while !name.empty? do
    # add the student hash to the array
    @students << {name: name, cob: cob, cohort: cohort}
    puts "Now we have #{@students.count} student#{@students.count == 1 ? '' : 's'}"
    # prompt for additional students
    puts "Add another student? (y/n)"
    break if gets.strip == "n"
    puts "What is their name?"
    name = gets.strip
    puts "What cohort are they in"
    cohort = gets.strip.downcase.to_sym
    if cohort.empty?
      chort = :november
    end
    puts "Where were they born?"
    cob = gets.strip
  end
end


def print_header
  puts "The students of Villains Academy".center(40)
  puts "".center(40, '-')
end

def print_students_list()
  n = 1
  while n <= @students.length
    puts "#{n}. #{@students[n-1][:name]} (#{@students[n-1][:cohort]} cohort)"
    n += 1
  end
end

def print_cohorts()
  puts "Choose a cohort: "
  cohort = gets.chomp.downcase.to_sym
  @students.map do |student|
    if student[:cohort] == cohort
      puts "#{student[:name]} (#{student[:cohort]} cohort)".center(40)
    end
  end
end



def print_letter_selection()
  puts "Select students with names starting with: "
  letter = gets.chomp.capitalize
  students_selection = @students.select { |student| student[:name][0] == letter}
  students_selection.each { |student| puts student[:name] }
end


def students_lessthan_x()
  num_char = 12
  puts "Here are the students with less than #{num_char} characters in their name: "
  students_selection = @students.select { |student| student[:name].length < num_char}
  students_selection.each { |student| puts student[:name] }
end

def print_footer()
  puts "Overall, we have #{@students.count} great student#{@students.count == 1 ? '' : 's'}".center(40)
end

def interactive_menu
  loop do
    print_menu
    process(gets.chomp)
  end
end

def print_menu
  puts "1. Input the students"
  puts "2. Show the students"
  puts "3. Save the list to students.csv"
  puts "9. Exit"
end

def show_students
  print_header
  print_students_list
  print_footer()
end

def process(selection)
  case selection
    when "1"
      input_students
    when "2"
      show_students
    when "3"
      save_students
    when "9"
      exit
    else
      puts "Incorrect selection, try again"
  end
end

def save_students
  # open the file for writing
  file = File.open("students.csv", "w")
  # interate over the array of students
  @students.each do |student|
    student_data = [student[:name], student[:cohort]]
    csv_line = student_data.join(",")
    file.puts csv_line
  end
  file.close
end

interactive_menu
