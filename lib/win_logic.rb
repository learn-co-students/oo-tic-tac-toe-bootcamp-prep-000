require_relative 'game_rules.rb'

module WinLogic
  include GameRules

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
