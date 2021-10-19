# frozen_string_literal: true

# Rental Element
class Rental
  attr_accessor :date, :book, :person

  def initialize(date, book, person)
    @date = date
    @book = book
    @person = person
    $book_list[book].put_rentals(self)
    $person_list[person].put_rentals(self)
  end

  def present(num)
    puts " #{num}) Book: '#{$book_list[@book].title}', Date: #{@date}"
  end
end
