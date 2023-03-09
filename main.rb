require './app'
require './displaymenu'

def main
  menu = DisplayMenu.new
  library = App.new
  puts "\nWelcome to School Library!\n\n"
  menu.display_menu(library)
end

main
