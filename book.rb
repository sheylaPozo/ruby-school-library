# frozen_string_literal: true

# Book Element
class Book
  attr_accessor :title, :author

  def initialize(title, author)
    @title = title
    @author = author
  end

  def put_rentals(rental)
    @rentals_list.push(rental)
    rental.book = self
  end

  def present(num)
    puts " #{num}) Title: '#{@title}', Author: #{@author}"
  end
end
