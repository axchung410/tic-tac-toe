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
    #i = (cell_number -1) / 3
    #j = (cell_number -1) % 3
    puts "Player played #{cell_number}"
    #board[i][j].type = cell_type
    board[cell_number - 1].type = cell_type
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
    #@board = Array.new(3) {Array.new(3) {Cell.new}}
    @board = Array.new(9) {Cell.new}
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
        print (i * 3 + j + 1).to_s + "|"
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
        #print board[i][j].type + "|"
        print board[i * 3 + j].type + "|"
      end
      puts
    end
    puts "-------"
  end

  def check_win
    x_cells = []
    o_cells = []
    blank_cells = []
    for i in 0..board.length-1
      if(board[i].type == "X")
        x_cells.push(i)
      elsif(board[i].type == "O")
        o_cells.push(i)
      else
        blank_cells.push(i)
      end
    end
    
    if(([0,1,2] - x_cells).empty? || ([3,4,5] - x_cells).empty? || ([6,7,8] - x_cells).empty? || \
       ([0,3,6] - x_cells).empty? || ([1,4,7] - x_cells).empty? || ([2,5,8] - x_cells).empty? || \
       ([0,4,8] - x_cells).empty? || ([2,4,6] - x_cells).empty?)
      puts "Player 1 wins!"
      return true
    elsif(([0,1,2] - o_cells).empty? || ([3,4,5] - o_cells).empty? || ([6,7,8] - o_cells).empty? || \
          ([0,3,6] - o_cells).empty? || ([1,4,7] - o_cells).empty? || ([2,5,8] - o_cells).empty? || \
          ([0,4,8] - o_cells).empty? || ([2,4,6] - o_cells).empty?)
      puts "Player 2 wins!"
      return true
    elsif(blank_cells.empty?)
      puts "It's a tie!"
      return true
    else
      return false
    end
  end
end

#setup game
game = Game.new
game.display_sample_board
game.display_board
players = game.players
player1 = game.players[0]
player2 = game.players[1]
#puts players[0].cell_type
#puts players[1].cell_type

#game loop
game_over = false
while (game_over == false) do
  puts "Player 1's turn, please enter a number 1-9:"
  turn_over = false
  while (turn_over == false) do
    turn = gets.chomp.to_i
    if((turn.is_a? Integer) && turn > 0 && turn < 10)
      if(game.board[turn - 1].type == " ")
        player1.play_turn(game.board, turn)
        turn_over = true
      else
        puts "Cell already taken, please try again!"
      end
    else
      puts "Please enter a number 1-9:"
    end
  end
  game.display_board
  if(game.check_win)
    game_over = true
    break;
  end
  puts "Player 2's turn, please enter a number 1-9:"
  turn_over = false
  while (turn_over == false) do
    turn = gets.chomp.to_i
    if((turn.is_a? Integer) && turn > 0 && turn < 10)
      if(game.board[turn - 1].type == " ")
        player2.play_turn(game.board, turn)
        turn_over = true
      else
        puts "Cell already taken, please try again!"
      end
    else
      puts "Please enter a number 1-9:"
    end
  end
  game.display_board
  if(game.check_win)
    game_over = true
  end
end
