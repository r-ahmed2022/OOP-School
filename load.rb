require 'json'

def loading_data(library)
  loading_people(library)
  loading_books(library)
  loading_rentals(library)
end

def loading_people(library)
  File.write('people.json', JSON.generate([])) unless File.exist?('people.json')
  people = JSON.parse(File.read('people.json'))
  people.each do |person|
    if person['type'] == 'Student'
      student = Student.new('Unkown', person['age'], person['name'], parent_permission: person['permission'])
      library.people.push(student)
    else
      teacher = Teacher.new(person['specialization'], person['age'], person['name'])
      library.people.push(teacher)
    end
  end
end

def loading_books(library)
  File.write('books.json', JSON.generate([])) unless File.exist?('books.json')
  books = JSON.parse(File.read('books.json'))
  books.each do |book|
    book = Book.new(book['title'], book['author'])
    library.books.push(book)
  end
end

def loading_rentals(library)
  File.write('rentals.json', JSON.generate([])) unless File.exist?('rentals.json')
  rentals = JSON.parse(File.read('rentals.json'))
  rentals.each do |rental|
    rental = Rental.new(rental['date'], library.people[rental['person']], library.books[rental['book']])
    library.rentals.push(rental)
  end
end
