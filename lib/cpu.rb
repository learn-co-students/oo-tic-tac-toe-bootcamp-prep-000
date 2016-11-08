class CPU

  attr_reader :name
  attr_accessor :token

  def initialize
    input = gets.strip
    input != '' ? @name = input : @name = 'HAL'
  end

end