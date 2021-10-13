# frozen_string_literal: true

# class to fix the name of any object
class Corrector
  def correct_name(name)
    name.capitalize.slice(0, 10)
  end
end
