# frozen_string_literal: true

require_relative 'student'
require_relative 'teacher'
require_relative 'book'
require_relative 'rental'
require_relative 'console'
require 'io/console'


# Have all the logic of the program
module Handler
  def display_persons
    index = 0
    while index < $person_list.length
      $person_list[index].appear(index + 1)
      index += 1
    end
    puts('')
  end

  def display_books
    index = 0
    while index < $book_list.length
      $book_list[index].present(index + 1)
      index += 1
    end
    puts('')
  end

  def display_rentals(rent_list)
    index = 0
    while index < rent_list.length
      rent_list[index].present(index + 1)
      index += 1
    end
    puts('')
  end

  def lis_t_books
    if $book_list.length.positive?
      puts('this is the list of all the books')
      puts('')
      display_books
      puts('')
    end
    if $book_list.length <= 0
      puts('There are not books')
      puts('')
    end
    Console.continue_story
    "there is a total of #{$book_list.length} books"
  end

  def lis_t_persons
    if $person_list.length.positive?
      puts('this is the list of all the people registered in the system')
      puts('')
      display_persons
    end
    if $person_list.length <= 0
      puts('There are not people registered in the system')
      puts('')
    end
    Console.continue_story
    "there is a total of #{$person_list.length} persons registered in the system"
  end

  def lis_t_rentals
    if $person_list.length.positive? && $book_list.length.positive?
      ob_person = 0
      until ob_person >= 1 && ob_person < $person_list.length + 1
        Console.clean
        puts('select one person in the list to looks their rentals, using the numbers of the left')
        puts('')
        display_persons
        ob_person = gets.chomp
        ob_person = ob_person.to_i
      end
      Console.clean
      ob_person = $person_list[ob_person - 1]
      puts("this are the rentals of #{ob_person.name}")
      display_rentals(ob_person.rentals)
      puts('')
      Console.continue_story
    end
  end

  def cr_a_person
    option = 'agegraegr'
    while option != '1' && option != '2'
      print('invalid option, please select 1 or 2') if option != 'agegraegr'
      puts('you would like to create an student(1) or a teacher(2)?')
      option = gets.chomp
    end
    print('Name: ')
    name = gets.chomp
    print('Age: ')
    age = gets.chomp
    age = age.to_i
    if option == '1'
      permission = 'agegraegr'
      while permission != 'Y' && permission != 'N' && permission != 'y' && permission != 'n'
        puts('invalid option, please select Y or N') if permission != 'agegraegr'
        puts('have parents permissions (Y/N)?')
        permission = gets.chomp
      end
      new_student = Student.new(age, 'later', name, permission)
      $person_list.push(new_student)
      return "Student #{new_student.name} have been created succesfully"
    end
    print('Specialization: ')
    specialization = gets.chomp
    new_teacher = Teacher.new(age, specialization, name)
    $person_list.push(new_teacher)
    "Teacher #{new_teacher.name} have been created succesfully"
  end

  def cr_a_book
    print('Title: ')
    title = gets.chomp
    print('Author: ')
    author = gets.chomp
    new_book = Book.new(title, author)
    $book_list.push(new_book)
    "Book #{new_book.title} have been created succesfully"
  end

  def cr_a_rental
    if $person_list.length.positive? && $book_list.length.positive?
      ob_person = 0
      until ob_person >= 1 && ob_person < $person_list.length + 1
        puts('select one person in the list to create the rental, using the numbers of the left')
        puts('')
        display_persons
        ob_person = gets.chomp
        ob_person = ob_person.to_i
      end
      ob_person = $person_list[ob_person - 1]
      ob_book = 0
      Console.clean
      until ob_book >= 1 && ob_book < $book_list.length + 1
        puts('select one book to create the rental, using the numbers of the left')
        puts('')
        display_books
        ob_book = gets.chomp
        ob_book = ob_book.to_i
      end
      Console.clean
      ob_book = $book_list[ob_book - 1]
      puts('insert a date')
      date = gets.chomp
      Rental.new(date, ob_book, ob_person)

      return('Rental created succesfully')
    end
    puts('books and persons should be registered in the system to do a rental')
    puts('')
    Console.continue_story
    'books and persons should be registered in the system to do a rental'
  end

  def exit
    'bye'
  end

  def procces_option(entry)
    return lis_t_books if entry == '1'
    return lis_t_persons if entry == '2'
    return cr_a_person if entry == '3'
    return cr_a_book if entry == '4'
    return cr_a_rental if entry == '5'
    return lis_t_rentals if entry == '6'
    return exit if entry == '7'
  end
end
