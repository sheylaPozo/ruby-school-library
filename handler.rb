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
  
end