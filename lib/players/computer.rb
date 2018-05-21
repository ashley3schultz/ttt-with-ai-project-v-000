module Players

  class Computer < Player
  
    def move(board)
      if defence(board)
        resault = defence(board).detect {|c| board.cells[c] == " "}
      elsif offence(board)
        resault = offence(board).detect {|c| board.cells[c] == " "}
      else 
        resault = random(board)
      end
      resault += 1
      binding.pry
    end
    
    def defence(board)
      Game::WIN_COMBINATIONS.detect {|wc|
      d = []
      d << board.cells[wc[0]]
      d << board.cells[wc[1]]
      d << board.cells[wc[2]]
      d.sort == [" ", self.token, self.token}]}
    end 
    
    def offence(board)
      Game::WIN_COMBINATIONS.detect {|wc| 
        o = []
        o << board.cells[wc[0]] if board.cells[wc[0]] != self.token && board.cells[wc[0]] != " "
        o << board.cells[wc[1]] if board.cells[wc[1]] != self.token && board.cells[wc[1]] != " "
        o << board.cells[wc[2]] if board.cells[wc[2]] != self.token && board.cells[wc[2]] != " "
        o.sort == wc.collect {|c| c if board.cells[c] == " " && o.size == 2}}
    end
    
    def random(board)
      c = [0,2,6,8]
      cs = c.shuffle
      corner = cs.detect {|n| board.valid_move?(n)}
      if board.valid_move?("5")
        4
      elsif corner != nil 
        corner
      else 
        rand(0..8)
      end
    end
  end
  
nb = Board.new
nb.cells = ["X", " ", "O", " ", "X", "O", " ", " ", " "]
  
  
end 

