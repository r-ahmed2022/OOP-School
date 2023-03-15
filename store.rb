require 'json'

def store_data(library)
  store_books(library)
  store_people(library)
end

def store_books(library)
  books = []
  library.books.each do |book|
    book = { title: book.title, author: book.author }
    books.push(book)
  end
  File.write('books.json', "#{JSON.generate(books)}\n")
end

def store_people(library)
  people = []
  library.people.each do |person|
       person.class.to_s == 'Student' ?
      (student = { name: person.name, age: person.age, permission: person.parent_permission, type: person.class }
       people.push(student))
     :
      (teacher = { name: person.name, age: person.age, specialization: person.specialization, type: person.class }
       people.push(teacher))
    
  end
  File.write('people.json', "#{JSON.generate(people)}\n")
end
