require_relative '../config/environment.rb'

# The Board class defines the game board itself
# including the layout and current game status
class Board < Array
  def initialize
    9.times do
      push(' ')
    end
  end

  def display
    puts " #{self[0]} | #{self[1]} | #{self[2]} "
    puts '-----------'
    puts " #{self[3]} | #{self[4]} | #{self[5]} "
    puts '-----------'
    puts " #{self[6]} | #{self[7]} | #{self[8]} "
  end

  def reset
    clear
    initialize
  end
end
