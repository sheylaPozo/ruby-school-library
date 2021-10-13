# frozen_string_literal: true

require_relative 'corrector'

# Contain information of the classrooms
class Classroom
  attr_accessor :label
  attr_reader :students

  def initialize(label)
    @label = label
    @students = []
  end
  
  def put_students(student)
    student.classroom = self
    @students.push(student)
  end
end