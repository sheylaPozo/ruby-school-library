# frozen_string_literal: true

require_relative 'corrector'

# Base data than all the people share
class Person
  attr_accessor :name, :age, :rentals, :parent_permission
  attr_reader :id

  def initialize(name, age, parent_permission, id)
    @id = id
    @id = Random.rand(1..1000) if id.nil?
    @name = name
    @age = age
    @parent_permission = parent_permission
    @corrector = Corrector.new
    @rentals = []
  end

  def can_use_services?
    return true if of_age? || @parent_permission

    false
  end

  def put_rentals(rental)
    @rentals.push(rental)
  end

  def validate_name
    @name = @corrector.correct_name @name
  end

  private

  def of_age?
    age >= 18
  end

  def present
    "Name: #{@name},ID: #{@id},Age: #{@age}"
  end
end
