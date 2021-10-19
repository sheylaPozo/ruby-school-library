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

  def self.insert(line)
    line = line.split("|")
    case line[0]
    when "book"
      new_book=Book.new(line[1],line[2])
      $book_list.push(new_book)
    when "student"
      permission = (line[4] == "True")
      new_student=Student.new(line[1].to_i,line[2],line[3],permission,line[5].chomp)
      $person_list.push(new_student)
    when "teacher"
      new_teacher=Teacher.new(line[1].to_i,line[2],line[3],line[4].chomp)
      $person_list.push(new_teacher)
    when "rental"
      new_rental = Rental.new(line[1],line[2].to_i,line[3].chomp.to_i)
      $rental_list.push(new_rental)
    end
    
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
