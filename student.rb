# frozen_string_literal: true

require_relative 'person'

# Students information and methods
class Student < Person
  attr_reader :classroom

  def initialize(age, classroom, name, parent_permission, id)
    super(age: age, name: name, parent_permission: parent_permission, id: id)
    @classroom = classroom
  end

  def play_hooky
    "¯\(ツ)/¯"
  end

  def insert_in_classroom(classroom)
    @classroom = classroom
    classroom.students.push(self) unless classroom.students.include?(self)
  end

  def appear(reference)
    puts("#{reference}) [Student] #{present}")
  end
end
