module Players

  class Computer < Player
  
    def move(board)
      WIN_COMINATIONS.detect {|wc| wc.
      
      
      WIN_COMBINATIONS.detect {|wc| 
    ck = []
    ck << board.cells[wc[0]] if board.cells[wc[0]] == !self.token 
    ck << board.cells[wc[1]]
    ck << board.cells[wc[2]]
    wc if ck.all? {|x|  x == "X"} || ck.all? {|o| o == "O"}}
    
    
      rand(1..9).to_s
    end
    
  end
  
  
end 

