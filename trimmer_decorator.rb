require './decorator'

class TrimmerDecorator < Decorator
  def correct_name
    @nameable.correct_name[1...10] if @nameable.correct_name.length > 10
  end
end
