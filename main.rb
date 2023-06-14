require_relative 'classes/app'

class Main
  MENU_OPTIONS = [
    'List all books',
    'List all labels',
    'List all games',
    'List all genres',
    'List all music albums',
    'List all authors',
    'Add a book',
    'Add a music album',
    'Add a game',
    'Exit'
  ].freeze

  def initialize
    puts 'Welcome to Catalog App'
    puts @line = '********************************************'

  end

  def select_menu
    puts 'Please choose an option by entering a number:'
    puts @line

    MENU_OPTIONS.each_with_index do |option, index|
      puts "#{index + 1}) #{option}"
    end
  end

  def run_app
    app = App.new
    loop do
      select_menu
      option = gets.chomp

      if option == MENU_OPTIONS.length.to_s
        puts @line
        puts 'Thank you for using our Catalog App!!! '
        puts @line
        break
      else
        app.select_option(option)
      end
    end
  end
end

def main
  main = Main.new
  main.run_app
end

main
