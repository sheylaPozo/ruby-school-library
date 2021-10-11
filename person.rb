class Person
    attr_accessor :name, :age
    attr_reader :id, :rentals
  
    def initialize(age:, parent_permission: true, name: 'Unknown')
      @id = Random.rand(1..1000)
      @name = name
      @age = age
      @parent_permission = parent_permission
    end
    private def 

end