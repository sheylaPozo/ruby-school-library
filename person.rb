class Person
    attr_accessor :name, :age
    attr_reader :id, :rentals
  
    def initialize(age:, parent_permission: true, name: 'Unknown')
      @id = Random.rand(1..1000)
      @name = name
      @age = age
      @parent_permission = parent_permission
    end

    private def is_of_age?
      return age>= 18
    end

    def can_use_services?
      if(is_of_age? || @parent_permission)
        return true
      end
      return false
    end
end