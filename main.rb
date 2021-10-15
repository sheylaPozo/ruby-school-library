# frozen_string_literal: true

# frozen_string_literal: true

require_relative 'student'
require_relative 'teacher'

student_list = []

def clean
  system('clear') || system('cls')
end

def cr_a_person
  option = 'agegraegr'
  while option != '1' || option != '2'
    print('invalid option, please select 1 or 2') if option != 'agegraegr'
    puts('you would like to create an student(1) or a teacher(2)?')
    option = gets.chomp
  end
  puts('age: ')
  name = gets.chomp
  puts('age: ')
  age = gets.chomp
  if option == '1'
    permission = 'agegraegr'
    while option != 'Y' || option != 'N'
      puts('have parents permissions (Y/N)?') if option != 'agegraegr'
      print('invalid option, please select Y or N')
      permission = gets.chomp
    end
    new_student = student.new(age, classrom, name, permission)
    student_list.push(new_student)
    menu('Welcome to School Library App!')
  end
end

def menu(string)
  clean
  puts(string)
  puts('')
  puts('Please, choice a option entering a number:')
  puts('1 - List all books')
  puts('2 - List all people')
  puts('3 - Create a person')
  puts('4 - Create a book')
  puts('5 - Create a rental')
  puts('6 - List all rentals for a given person id')
  puts('7 exit')
  puts('')
  entry = gets.chomp
  puts(entry)
  clean
end
menu
