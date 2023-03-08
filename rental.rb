class Rental
    attr_accessor :date
  
    def initialize(date, person, book)
      @date = date
      @book = book
      @person = person
      book.rentals.push(self)
      person.rentals.push(self)
    end
 
  end