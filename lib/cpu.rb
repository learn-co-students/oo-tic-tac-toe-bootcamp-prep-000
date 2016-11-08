class CPU

  attr_reader :name

  def initialize
    input = gets.strip
    input != '' ? @name = input : @name = 'HAL'
  end

end