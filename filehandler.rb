# frozen_string_literal: true

require_relative 'handler'
require_relative 'book'
require_relative 'student'

module FileHandler
  include Handler
  def self.open_save

    if File.exist?('Save.txt')
      File.open("Save.txt","r") do |file|
        file.readlines().each do |line|
          insert(line)
        end
        file.close()
      end
    end

    return false
  end
  
  def self.save
    serial = []
    for i in $book_list
      serial.push("book|#{i.title}|#{i.author.chomp}")
    end
    for i in $person_list
      if (i.class.name == "Student")
        serial.push("student|#{i.age}|#{i.classroom}|#{i.name}|#{i.parent_permission}|#{i.id}")
      else
        serial.push("teacher|#{i.age}|#{i.specialization}|#{i.name}|#{i.id}")
      end
    end
    for i in $rental_list
      serial.push("rental|#{i.date}|#{i.book}|#{i.person}")
    end
    File.write("Save.txt", serial.join("\n"), mode: "w")
    puts(serial)
  end
end
