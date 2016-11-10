require_relative 'win_logic.rb'

class CPU

  include WinLogic
  attr_reader :name
  attr_accessor :token, :token_set, :winning_position

  def initialize
    input = gets.strip
    input != '' ? @name = input : @name = 'HAL'
  end

end