require './nameable'
require './capitalize_decorator'
require './trimmer_decorator'

class Person < Nameable
  attr_accessor :name, :age, :rentals
  attr_reader :id

  def initialize(age, name = 'Unknown', parent_permission: true)
    super()
    @id = Random.rand(1..700)
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

  def add_rentals(date, book_info)
    Rental.new(date, book_info, self)
  end

  private

  def of_age?
    @age >= 18
  end
end
