# frozen_string_literal: true

require_relative 'person'

# Students information and methods
class Student < Person
  attr_reader :classroom

  def initialize(age:, classroom: 'not at the moment', name: 'Unknown', parent_permission: true)
    super(name: name, age: age, parent_permission: parent_permission)
    @classroom = classroom
  end

  def play_hooky
    "¯\(ツ)/¯"
  end

  def insert_in_classroom(classroom)
    @classroom = classroom
    classroom.students.push(self) unless classroom.students.include?(self)
  end

  def appear
    puts("[Student] #{zpresent}")
  end
end
