require 'json'

def preserve_data(library)
  preserve_people(library)
  preserve_books(library)
  preserve_rentals(library)
end

def preserve_people(library)
  people = []
  library.people.each do |person|
    if person.class.to_s == 'Student'
      student = { name: person.name, age: person.age, permission: person.parent_permission, type: person.class }
      people.push(student)
    else
      teacher = { name: person.name, age: person.age, specialization: person.specialization, type: person.class }
      people.push(teacher)
    end
  end
  File.write('people.json', "#{JSON.generate(people)}\n")
end

def preserve_books(library)
  books = []
  library.books.each do |book|
    book = { title: book.title, author: book.author }
    books.push(book)
  end
  File.write('books.json', "#{JSON.generate(books)}\n")
end

def preserve_rentals(library)
  rentals = []
  library.rentals.each do |rental|
    rental = { date: rental.date, book: library.books.index(rental.book), book_title: rental.book.title,
               person: library.people.index(rental.person), person_name: rental.person.name }
    rentals.push(rental)
  end
  File.write('rentals.json', "#{JSON.generate(rentals)}\n")
end
