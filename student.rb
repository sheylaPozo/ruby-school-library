require_relative 'person'

class Student < Person
    attr_reader :classroom
  
    def initialize(age:, classroom:, name: 'Unknown', parent_permission: true)
      super(name: name, age: age, parent_permission: parent_permission)
      @classroom = classroom
    end
end