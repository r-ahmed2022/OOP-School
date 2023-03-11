require './person'

class Student < Person
  attr_reader :classroom

  def initialize(classroom, age, name, parent_permission)
    super(age, name, parent_permission)
    @classroom = classroom
  end

  def play_hooky
    '¯(ツ)/¯'
  end
end
