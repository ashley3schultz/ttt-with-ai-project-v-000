module Players

  class Computer < Player
  
    def move(board)
      if !defence && !offence
        random
      else
        defence || offence
      end
    end
    
    def offence
      Game::WIN_COMBINATIONS.detect {|wc| 
        o = []
        o << board.cells[wc[0]] if board.cells[wc[0]] == !self.token && board.cells[wc[0]] != " "
        o << board.cells[wc[1]] if board.cells[wc[1]] == !self.token && board.cells[wc[1]] != " "
        o << board.cells[wc[2]] if board.cells[wc[2]] == !self.token && board.cells[wc[2]] != " "
        wc.detect {|c| board.cells[c] == " "} if o.size == 2 }
    end
    
    def defence
      Game::WIN_COMBINATIONS.detect {|wc| 
        d = []
        d << board.cells[wc[0]] if board.cells[wc[0]] == self.token
        d << board.cells[wc[1]] if board.cells[wc[1]] == self.token
        d << board.cells[wc[2]] if board.cells[wc[2]] == self.token
        wc.detect {|c| board.cells[c] == " "} if d.size == 2 }
    end 
    
    def random
      c = ["1","3","7","9"]
      o = ["2","4","6","8"]
      board.valid_move?("5") || board.valid_move?(c.sample) || board.valid_move?(o.sample)
    end
  end
  
  
end 

