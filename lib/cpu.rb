class CPU

  attr_reader :name
  attr_accessor :token, :token_set, :winning_position

  def initialize
    input = gets.strip
    input != '' ? @name = input : @name = 'HAL'
  end

end