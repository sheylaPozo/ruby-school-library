# frozen_string_literal: true

# Rental Element
class Rental
  attr_accessor :date, :book, :person

  def initialize(date, book, person)
    @date = date
    book.present(0)
    person.appear(0)
    book.put_rentals(self)
    person.put_rentals(self)
  end

  def present(num)
    puts " #{num}) Book: '#{@book.title}', Date: #{@date}"
  end
end
