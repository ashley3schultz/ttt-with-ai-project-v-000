module Players

  class Computer < Player
  
    def move(board)
      d = 
      o = 
      r = random(board)
      
      d += 1 || o += 1 || r += 1
    end
    
    def defence(board)
      a = [" "]
      a << self.token
      a << self.token
      Game::WIN_COMBINATIONS.detect {|wc|
      b = []
      b << board.cells[wc[0]]
      b << board.cells[wc[1]]
      b << board.cells[wc[2]]
      b.sort == a.sort}
    end
    
    def offence(board)
      op = "O" if self.token == "X"
      op = "X" if self.token == "O"
      a = [" "]
      a << op
      a << op
      Game::WIN_COMBINATIONS.detect {|wc|
      b = []
      b << board.cells[wc[0]]
      b << board.cells[wc[1]]
      b << board.cells[wc[2]]
      b.sort == a.sort}
    end
    
    def find_space(board)
      if defence(board)
        defence(board).detect {|c| board.cells[c] == " "}
      else offence(board)
        offence(board).detect {|c| board.cells[c] == " "}
      end
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
end 


#board.cells = ["X", " ", "O", " ", "X", "O", " ", " ", " "]