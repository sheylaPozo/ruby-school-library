# frozen_string_literal: true

require_relative 'handler'
require_relative 'book'
require_relative 'student'

# all the functions related to save and load information
module FileHandler
  include Handler

  def self.open_save
    open_file('books')
    open_file('persons')
    open_file('rentals')
  end

  def self.open_file(file_name)
    if File.exist?("#{file_name}.json")
      File.open("#{file_name}.json", 'r') do |file|
        file.readlines.each do |line|
          insert(line, file_name)
        end
        file.close
      end
    end
    false
  end

  def self.insert(line, file_name)
    line = JSON.parse(line)
    puts(line)
    case file_name
    when 'books'
      title = line['title']
      author = line['author']
      new_book = Book.new(title, author)
      $book_list.push(new_book)
    when 'persons'
      age = line['age']
      name = line['name']
      id = line['id']
      if !line['classroom'].nil?
        parent_permission = line['parent_permission']
        classroom = line['classroom']
        new_person = Student.new(age, classroom, name, parent_permission, id)
      else
        specialization = line['specialization']
        new_person = Teacher.new(age, specialization, name, id)
      end
      $person_list.push(new_person)
    when 'rentals'
      date = line['date']
      book = line['book']
      person = line['person']
      new_rental = Rental.new(date, book, person)
      $rental_list.push(new_rental)
    end
  end

  def self.save
    serial = []
    if $book_list.length.positive?
      $book_list.each do |i|
        serial.push(i.to_json)
      end
      File.write('books.json', serial.join("\n"), mode: 'w')
      serial = []
    end
    if $person_list.length.positive?
      $person_list.each do |i|
        i.instance_of?(Student)
        serial.push(i.to_json)
      end
      File.write('persons.json', serial.join("\n"), mode: 'w')
      serial = []
    end
    if $rental_list.length.positive?
      $rental_list.each do |i|
        serial.push(i.to_json)
      end
      File.write('rentals.json', serial.join("\n"), mode: 'w')
    end
  end
end
