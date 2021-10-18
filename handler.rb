# frozen_string_literal: true

require_relative 'student'
require_relative 'teacher'
require_relative 'book'
require_relative 'rental'
require_relative 'console'
require 'io/console'

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

  def display_rentals(rent_list)
    index = 0
    while index < rent_list.length
      rent_list[index].present(index + 1)
      index += 1
    end
    puts('')
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

end