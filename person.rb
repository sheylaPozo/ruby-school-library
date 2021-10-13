# frozen_string_literal: true

require_relative 'corrector'

# Base data than all the people share
class Person
  attr_accessor :name, :age, :rentals
  attr_reader :id

  def initialize(age:, parent_permission: true, name: 'Unknown')
    @id = Random.rand(1..1000)
    @name = name
    @age = age
    @parent_permission = parent_permission
    @corrector = Corrector.new
    @rentals = []
  end

  def can_use_services?
    return true if is_of_age? || @parent_permission

    false
  end

  def validate_name
    @name = @corrector.correct_name @name
  end

  private

  def of_age?
    age >= 18
  end
end
