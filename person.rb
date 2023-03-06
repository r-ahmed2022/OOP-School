class Person 
    attr_accessor :name, :age
    attr_reader :id, :name, :age
  
    def initialize(age, name, parent_permission)
      super()
      @id = Random.rand(1..700)
      @name = name
      @age = age
      @parent_permission = parent_permission
    end

    def id
      @id
    end

    def name
     @name 
    end

    def name
      @name = name
    end
   
    def age
        @age
    end

    def age
        @age = age
    end
  
    def can_use_services?
      is_of_age? || @parent_permission
    end
  
    private
  
    def is_of_age?
      @age >= 18
    end
  end