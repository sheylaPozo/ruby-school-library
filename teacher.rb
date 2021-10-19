# frozen_string_literal: true

require_relative 'person'

# Teacher information and methods
class Teacher < Person
  attr_reader :specialization

  def initialize(age, specialization, name, id)
    super(name: name, age: age, parent_permission: true, id: id)
    @specialization = specialization
  end

  def can_use_services?
    true
  end

  def appear(reference)
    puts("#{reference}) [Teacher] #{present}")
  end
end
