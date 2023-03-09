require './person'

class Student < Person
  attr_reader :classroom

  def initialize(age, parent_permission, name = 'unknown')
    super(age, name, parent_permission)
    @classroom = nil
  end

  def play_hooky
    '¯(ツ)/¯'
  end

  def can_use_services?
    of_age? || @parent_permission
  end

  def classroom=(classroom)
    @classroom = classroom
    classroom.students.push(self) unless classroom.students.include?(self)
  end
end
