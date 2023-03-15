require 'json'

def load_data(library)
  load_books(library)
  load_people(library)
end

def load_books(library)
  File.write('books.json', JSON.generate([])) unless File.exist?('books.json')
  books = JSON.parse(File.read('books.json'))
  books.each do |book|
    book = Book.new(book['title'], book['author'])
    library.books.push(book)
  end
end

def load_people(library)
  File.write('people.json', JSON.generate([])) unless File.exist?('people.json')
  people = JSON.parse(File.read('people.json'))
  people.each do |person|
       person['type'] == 'Student' ?
      (student = Student.new('Unknown', person['age'], person['name'], parent_permission: person['permission'])
       library.people.push(student))
    :
      (teacher = Teacher.new(person['specialization'], person['age'], person['name'])
       library.people.push(teacher))
  end
end
