# frozen_string_literal: true

require_relative 'book'
# Rental Element
class Rental
  attr_accessor :date

  def initialize(date, book, person)
    @date = date
    @book = book
    book.put_rentals(self)
    @person = person
    person.put(self)
  end
end
