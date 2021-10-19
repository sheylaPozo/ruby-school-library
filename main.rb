# frozen_string_literal: true

require_relative 'console'
require_relative 'handler'
require_relative 'file_handler'

class App
  include Handler
  include FileHandler
  def menu(string)
    Console.clean
    puts(string)
    puts('')
    puts('Please, choice a option entering a number:')
    puts('1 - List all books')
    puts('2 - List all people')
    puts('3 - Create a person')
    puts('4 - Create a book')
    puts('5 - Create a rental')
    puts('6 - List all rentals for a given person id')
    puts('7 - Exit')
    puts('')
    entry = gets.chomp
    Console.clean
    entry
  end

  def run
    $person_list = []
    $book_list = []
    $rental_list =[]
    FileHandler.open_save()
    text = 'Welcome to School Library App!'
    while text != 'bye'
      entry = menu(text)
      text = procces_option(entry)
    end
    FileHandler.save
    Console.continue_story
  end
end

def main
  app = App.new
  app.run
end

main
