require_relative 'game_rules.rb'

class Player
  include GameRules
  attr_accessor :name, :token, :token_set, :winning_position

  def win_possible?(opposition)
    win_combos = WIN_COMBINATIONS
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
