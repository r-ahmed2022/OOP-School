class Person 
    attr_accessor :name, :age
    attr_reader :id, :name, :age
  
    def initialize(age, name, parent_permission)
      super()
      @id = Random.rand(1..900)
      @name = name
      @age = age
      @parent_permission = parent_permission
      @rentals = []
    end
  
    def correct_name
      @name = name
    end
  
    def can_use_services?
      is_of_age? || @parent_permission
    end
  
    private
  
    def is_of_age?
      @age >= 18
    end
  end