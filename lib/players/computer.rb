module Players

  class Computer < Player
  
    def move(board)
      if defence(board)
        resault = defence(board)
      elsif offence(board)
        resault = offence(board)
      else 
        resault = random(board)
      end
      resault
      binding.pry
    end
    
    def defence(board)
      Game::WIN_COMBINATIONS.detect {|wc| wc.detect {|c|
        d = []
        d << board.cells[wc[0]] if board.cells[wc[0]] == self.token
        d << board.cells[wc[1]] if board.cells[wc[1]] == self.token
        d << board.cells[wc[2]] if board.cells[wc[2]] == self.token
        wc.collect {|c| c if board.cells[c] == " " && d.size == 2}}
    end 
    
    def offence(board)
      Game::WIN_COMBINATIONS.detect {|wc| 
        o = []
        o << board.cells[wc[0]] if board.cells[wc[0]] != self.token && board.cells[wc[0]] != " "
        o << board.cells[wc[1]] if board.cells[wc[1]] != self.token && board.cells[wc[1]] != " "
        o << board.cells[wc[2]] if board.cells[wc[2]] != self.token && board.cells[wc[2]] != " "
        wc.collect {|c| c if board.cells[c] == " " && o.size == 2}}
    end
    
    def random(board)
      c = ["1","3","7","9"]
      cs = c.shuffle
      corner = cs.detect {|n| board.valid_move?(n)}
      if board.valid_move?("5")
        "5"
      elsif corner != nil 
        corner
      else 
        rand(1..9).to_s
      end
    end
  end
  
nb = Board.new
nb.cells = ["X", " ", "O", " ", "X", "O", " ", " ", " "]
  
  
end 

