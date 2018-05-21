module Players

  class Computer < Player
  
    def move(board)
      
      nb = Board.new
      nb.cells = ["X", " ", "O", " ", "X", "O", " ", " ", " "]

      if defence(board)
        resault = defence(board).detect {|c| c == " "}
      elsif offence(board)
        resault = offence(board).detect {|c| c == " "}
      else 
        resault = random(board)
      end
      resault
      binding.pry
    end
    
    def defence(board)
      Game::WIN_COMBINATIONS.detect {|wc| 
        d = []
        d << board.cells[wc[0]] if board.cells[wc[0]] == self.token
        d << board.cells[wc[1]] if board.cells[wc[1]] == self.token
        d << board.cells[wc[2]] if board.cells[wc[2]] == self.token
        wc.detect {|c| board.cells[c] == " "} if d.size == 2}
    end 
    
    def offence(board)
      Game::WIN_COMBINATIONS.detect {|wc| 
        o = []
        o << board.cells[wc[0]] if board.cells[wc[0]] == !self.token && board.cells[wc[0]] != " "
        o << board.cells[wc[1]] if board.cells[wc[1]] == !self.token && board.cells[wc[1]] != " "
        o << board.cells[wc[2]] if board.cells[wc[2]] == !self.token && board.cells[wc[2]] != " "
        wc.detect {|c| board.cells[c] == " "} if o.size == 2 }
    end
    
    def random(board)
      c = ["1","3","7","9"]
      cs = c.shuffle
      corner = cs.detect {|n| board.valid_move?(n)}
      if board.valid_move?("5")
        "5"
      else corner != nil 
        corner
      #else 
      #  rand(1..9)
      end
    end
  end
  
nb = Board.new
nb.cells = ["X", " ", "O", " ", "X", "O", " ", " ", " "]
  
  
end 

