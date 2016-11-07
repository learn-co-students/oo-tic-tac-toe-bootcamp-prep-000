class CPU
  def initialize
    input = gets.strip
    input != '' ? @name = input : @name = 'HAL'
  end

  def name
    @name
  end
end