module Players

  class Computer < Player
  
    def move(board)
      if !defense && !offence
        "5" || rand(1,3,7,9) || rand(1..9).to_s
      else
        defense || offence
      end
    end
    
    def offence
      WIN_COMBINATIONS.detect {|wc| 
        o = []
        o << board.cells[wc[0]] if board.cells[wc[0]] == !self.token && board.cells[wc[0]] != " "
        o << board.cells[wc[1]] if board.cells[wc[1]] == !self.token && board.cells[wc[1]] != " "
        o << board.cells[wc[2]] if board.cells[wc[2]] == !self.token && board.cells[wc[2]] != " "
        wc.detect {|c| board.cells[c] == " "} if o.size == 2 }}
    end
    
    def defence
      WIN_COMBINATIONS.detect {|wc| 
        d = []
        d << board.cells[wc[0]] if board.cells[wc[0]] == self.token
        d << board.cells[wc[1]] if board.cells[wc[1]] == self.token
        d << board.cells[wc[2]] if board.cells[wc[2]] == self.token
        wc.detect {|c| board.cells[c] == " "} if d.size == 2 }}
    end 
    
    
    
  end
  
  
end 

