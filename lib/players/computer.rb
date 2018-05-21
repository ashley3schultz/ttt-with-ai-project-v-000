module Players

  class Computer < Player
  
    def move(board)
      find_space(board) || random(board)
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
      binding.pry
      wc if b.sort == a.sort}
    end
    
    def offence(board)
      op = "O" if self.token == "X"
      op = "X" if self.token == "O"
      a = [" "]
      a << op
      a << op
      w = []
      Game::WIN_COMBINATIONS.detect {|wc|
      b = []
      b << board.cells[wc[0]]
      b << board.cells[wc[1]]
      b << board.cells[wc[2]]
      w << find_space(wc) if b.sort == a.sort}
      w
    end
    
    def find_space(board)
      defence(board).detect { |c| board.cells[c] == " "}
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
end 


#board.cells = ["X", " ", "O", " ", "X", "O", " ", " ", " "]