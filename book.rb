class Book
    attr_accessor :title, :author
  
    def initialize(title, author)
      @title = title
      @author = author
      @rentals = []
    end
  end