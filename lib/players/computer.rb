module Players

  class Computer < Player
  
    def move(board)
      d = defence(board).detect {|c| board.cells[c] == " "} 
      o = offence(board).detect {|c| board.cells[c] == " "}
      r = random(board)
      d += 1
      o += 1
      r += 1
      d || o || r
    end
    
    def defence(board)
      Game::WIN_COMBINATIONS.detect {|wc|
      d = []
      d << board.cells[wc[0]]
      d << board.cells[wc[1]]
      d << board.cells[wc[2]]
      d.sort == [" ", "#{self.token}", "#{self.token}"]}
    end
    
    def offence(board)
      Game::WIN_COMBINATIONS.detect {|wc|
      o = []
      o << board.cells[wc[0]]
      o << board.cells[wc[1]]
      o << board.cells[wc[2]]
      o.sort == [" ", self.token, self.token]}
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

nb = Board.new
board.cells = ["X", " ", "O", " ", "X", "O", " ", " ", " "]