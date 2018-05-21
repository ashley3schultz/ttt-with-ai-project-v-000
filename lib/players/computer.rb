module Players

  class Computer < Player
  
    def move(board)
      WIN_COMINATIONS.detect {|wc| wc.
      
      
      WIN_COMBINATIONS.detect {|wc| 
    o = []
    
    o << board.cells[wc[0]] if board.cells[wc[0]] == !self.token && != " "
    o << board.cells[wc[1]] if board.cells[wc[1]] == !self.token && != " "
    o << board.cells[wc[2]] if board.cells[wc[2]] == !self.token && != " "
    
    if o.size == 2
      resault = wc.detect {|i| !o.include?(i)}
    elsif d.size == 2
   
      rand(1..9).to_s
    end
    
    def offence
      WIN_COMBINATIONS.detect {|wc| 
        o = []
        o << board.cells[wc[0]] if board.cells[wc[0]] == !self.token && board.cells[wc[0]] != " "
        o << board.cells[wc[1]] if board.cells[wc[1]] == !self.token && board.cells[wc[1]] != " "
        o << board.cells[wc[2]] if board.cells[wc[2]] == !self.token && board.cells[wc[2]] != " "
        wc if o.size == 2}}
    end
      
    resault = wc.detect {|i| !o.include?(i)}
    
    def defence
      WIN_COMBINATIONS.detect {|wc| 
        d = []
        d << board.cells[wc[0]] if board.cells[wc[0]] == self.token
        d << board.cells[wc[1]] if board.cells[wc[1]] == self.token
        d << board.cells[wc[2]] if board.cells[wc[2]] == self.token
        wc if d.size == 2}}
    end 
    
    
    
  end
  
  
end 

