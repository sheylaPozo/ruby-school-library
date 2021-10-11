# frozen_string_literal: true

require_relative 'person'

# Students information and methods
class Student < Person
  attr_reader :specialization

  def initialize(age:, specialization:, name: 'Unknown', parent_permission: true)
    super(name: name, age: age, parent_permission: parent_permission)
    @specialization = specialization
  end

  def can_use_services?
    true
  end
end
