require_relative 'game_rules.rb'

# The Player class is the basic player object
# setting player attributes and game logic to determine
# a winning play
class Player
  include GameRules
  attr_accessor :name, :token, :token_set, :winning_position

  def initialize
    input = gets.strip
    @name = if input != ''
              input
            else
              'HAL'
            end
    @token_set = []
  end

  def win_possible?(opposition)
    win_combos = GameRules::WIN_COMBINATIONS
    win_combos.each do |win_combo|
      win_combo.each do |win_index|
        @token_set.each do |token|
          next unless win_index == token
          win_combo -= [win_index]
          next unless win_combo.length == 1
          @winning_position = win_combo[0]
          next unless opposition.token_set.none? { |i| i == @winning_position }
          return true
        end
      end
    end
    false
  end
end
