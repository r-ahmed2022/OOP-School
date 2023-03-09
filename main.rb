require './app'
require './displaymenu'

def main
  menu = Menu.new
  library = App.new
  puts "\nWelcome to School Library by Alaa!\n\n"
  menu.display_menu(library)
end

main