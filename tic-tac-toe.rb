class Cell
  attr_accessor :type
  @type #a cell can be X, O, or blank ("")

  def initialize
    @type = " "
  end
end

class Player
  attr_accessor :cell_type
  @cell_type = ""

  def initialize(player_number)
    if player_number == 1
      @cell_type = "X"
    else
      @cell_type = "O"
    end
  end

  def play_turn(board, cell_number)
    i = (cell_number -1) / 3
    j = (cell_number -1) % 3
    puts "Player played #{cell_number}"
    board[i][j].type = cell_type
  end
end

class Game 
  attr_accessor :board
  attr_accessor :players
  @board
  @players = Array.new(2)
  @players[0] = Player.new(1)
  @players[1] = Player.new(2)

  def initialize
    @board = Array.new(3) {Array.new(3) {Cell.new}}
    @players = Array.new(2)
    @players[0] = Player.new(1)
    @players[1] = Player.new(2)
  end

  def display_sample_board
    puts "Sample board"
    puts "-------"
    for i in 0..2
      print "|"
      for j in 0..2
        print (i.to_i * 3 + j.to_i + 1).to_s + "|"
      end
      puts
    end
    puts "-------"
  end

  def display_board
    puts "Current board"
    puts "-------"
    for i in 0..2
      print "|"
      for j in 0..2
        print board[i][j].type + "|"
      end
      puts
    end
    puts "-------"
  end

  def check_win
  end
end

game = Game.new
game.display_sample_board
game.display_board
players = game.players
#puts players[0].cell_type
#puts players[1].cell_type
players[0].play_turn(game.board, 4)
players[1].play_turn(game.board, 6)
game.display_board
game.check_win


