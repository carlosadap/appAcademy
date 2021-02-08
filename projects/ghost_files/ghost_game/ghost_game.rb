require 'set'
require_relative './player.rb'

class Game
  attr_reader :players, :dictionary
  MAX_LOSES = 5
  ALPHABET = Set.new("a".."z")

  def initialize(*players)
    @players = []
    players.each { |player| @players << Player.new(player) }
    words = File.readlines('../dictionary.txt').map(&:chomp)
    @dictionary = Set.new(words)

    @active_players = @players.map { |ele| ele }
    @current_player = @active_players[0]
    @losses = {}
    @active_players.each { |player| @losses[player] = 0}
  end
  
  def play_round
    take_turn(@current_player)
    next_player!
  end

  def take_turn(player)
    puts "Make your guess #{player.name}, current fragment is '#{@fragment}'"
    guess = gets.chomp

    if self.valid_play?(guess)
      @fragment += guess
    else
      puts "the #{guess} was invalid, the fragment is #{@fragment}"
      take_turn(@current_player)
    end

    if @dictionary.include?(@fragment)
      @losses[player] += 1
      @fragment = ""
      print "#{@current_player.name} guessed a real word and loses.\n"
      print "The total sum of loses is:\n" 
      @losses.each { |key, val| print "#{key.name} has #{val} loses\n" }
    end
  end

  def valid_play?(letter)
    return false if letter.length > 1
    return false if !ALPHABET.include?(letter)

    guess = @fragment + letter
    @dictionary.any? { |word| word.start_with?(guess) }
  end

  def next_player!
    current_player_idx = @active_players.index(@current_player)
    next_player_idx = (current_player_idx + 1) % @active_players.length
    @current_player = @active_players[next_player_idx]
  end

  def run
    @fragment = ""

    while @active_players.length != 1 do
      self.play_round
      @active_players.each do |player|
        if @losses[player] == MAX_LOSES
          puts "#{player.name} has been eliminated from the game with #{MAX_LOSES} losses." 
          @active_players.delete(player)
        end
      end
    end

    puts "#{@current_player.name} wins!"
  end
end

my_game = Game.new("p1", "p2", "p3")
my_game.run