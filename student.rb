# frozen_string_literal: true

require 'json'
require_relative 'person'

# Students information and methods
class Student < Person
  attr_accessor :classroom

  def initialize(age, classroom, name, parent_permission, id)
    super(age, name, parent_permission, id)
    @classroom = classroom
  end

  def to_json(*_args)
    hash = { age: @age, classroom: @classroom, name: @name, parent_permission: parent_permission, id: @id }
    JSON.generate(hash)
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
