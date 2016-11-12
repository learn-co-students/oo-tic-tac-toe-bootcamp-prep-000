require_relative '../config/environment.rb'

# The OnePlayer class is the set of specific rules and scripts
# governing a one player human v. cpu game
class OnePlayer < Match
  def init_players
    if human_goes_first?
      init_human_as_player_one
      init_cpu_as_player_two
    else
      init_human_as_player_two
      init_cpu_as_player_one
    end
  end

  def init_human_as_player_one
    puts 'Player, please enter your name.'
    @player_one = Human.new
    puts ''
    @player_one.sets_token(@player_two)
  end

  def init_human_as_player_two
    puts 'Player, please enter your name.'
    @player_two = Human.new
    puts ''
    @player_two.sets_token(@player_one)
  end

  def init_cpu_as_player_one
    cpu_greeting(@player_two)
    @player_one = CPU.new
    @player_one.sets_token(@player_two)
    puts ''
    puts "Thanks for naming me #{@player_one.name}, #{@player_two.name}."
  end

  def init_cpu_as_player_two
    cpu_greeting(@player_one)
    @player_two = CPU.new
    @player_two.sets_token(@player_one)
    puts ''
    puts "Thanks for naming me #{@player_two.name}, #{@player_one.name}."
  end

  def cpu_greeting(human)
    puts "Hello #{human.name}, my name is HAL.
If you're fine with calling me HAL, just press <return>.
If you'd like to call me something else,
type my new name and press <return>."
  end

  def human_goes_first?
    puts 'Do you want to go first? (y/n)'
    input = gets.strip.downcase
    puts ''
    return true if (input == 'y' || input == '')
    return false if input == 'n'
    human_goes_first?
  end
end
