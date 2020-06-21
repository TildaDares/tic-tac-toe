module CheckForTwoEqualCells
  def two_equal_cells(array)
    possible_plays = []
    if (array[0] == array[1] || array[5] == array[8] || array[4] == array[6]) && array[2] == '3'
      possible_plays.push(2)
    elsif (array[0] == array[2] || array[7] == array[4]) && array[1] == '2'
      possible_plays.push(1)
    elsif (array[1] == array[2] || array[6] == array[3] || array[8] == array[4]) && array[0] == '1'
        possible_plays.push(0)
    elsif (array[3] == array[4] || array[2] == array[8]) && array[5] == '6'
      possible_plays.push(5)
    elsif (array[3] == array[5] || array[1] == array[7] || array[0] == array[8] || array[2] == array[6] ) && array[4] == '5'
      possible_plays.push(4)
    elsif (array[6] == array[7] || array[2] == array[5] || array[0] == array[4]) && array[8] == '9'
      possible_plays.push(8)
    elsif (array[6] == array[8] || array[1] == array[4]) && array[7] == '8'
      possible_plays.push(7)
    elsif array[0] == array[3] && array[6] == '7'
      possible_plays.push(6)
    elsif (array[0] == array[6] || array[4] == array[5]) && array[3] == '4'
      possible_plays.push(3)
    elsif (array[2] == array[4] || array[8] == array[7]) && array[6] == '7'
      possible_plays.push(6)
     end
     return possible_plays
  end

  def object_tag_is_first_priority(array, tag)
    possible_plays = []
       if array[0] == array[1] && array[0] == tag && array[2] == '3'
        possible_plays.push(2)
       elsif array[3] == array[4] && array[3] == tag && array[5] == '6'
        possible_plays.push(5)
       elsif array[6] == array[7] && array[6] == tag && array[8] == '9'
        possible_plays.push(8)
       elsif array[0] == array[3] && array[0] == tag && array[6] == '7'
        possible_plays.push(6)
       elsif array[1] == array[4] && array[1] == tag && array[7] == '8'
        possible_plays.push(7)
       elsif array[2] == array[5] && array[2] == tag && array[8] == '9'
        possible_plays.push(8)
       elsif array[0] == array[4] && array[0] == tag && array[8] == '9'
        possible_plays.push(8)
       elsif array[2] == array[4] && array[2] == tag && array[6] == '7'
        possible_plays.push(6)
      elsif array[0] == array[2] && array[0] == tag && array[1] == '2'
        possible_plays.push(1)
      elsif array[2] == array[8] && array[2] == tag && array[5] == '6'
        possible_plays.push(5)
      elsif array[3] == array[5] && array[3] == tag && array[4] == '5'
        possible_plays.push(4)
      elsif array[1] == array[7] && array[1] == tag && array[4] == '5'
        possible_plays.push(4)
      elsif array[0] == array[8] && array[0] == tag && array[4] == '5'
        possible_plays.push(4)
      elsif array[2] == array[6] && array[2] == tag && array[4] == '5'
        possible_plays.push(4)
      elsif array[6] == array[8] && array[6] == tag && array[7] == '8'
        possible_plays.push(7)
      elsif array[0] == array[6] && array[0] == tag && array[3] == '4'
        possible_plays.push(3)
      elsif array[1] == array[2] && array[1] == tag && array[0] == '1'
        possible_plays.push(0)
      elsif array[4] == array[5] && array[4] == tag && array[3] == '4'
        possible_plays.push(3)
      elsif array[8] == array[7] && array[8] == tag && array[6] == '7'
        possible_plays.push(6)
      elsif array[3] == array[6] && array[3] == tag && array[0] == '1'
        possible_plays.push(0) 
      elsif array[7] == array[4] && array[7] == tag && array[1] == '2'
        possible_plays.push(1) 
      elsif array[5] == array[8] && array[5] == tag && array[2] == '3'
        possible_plays.push(2)
      elsif array[8] == array[4] && array[8] == tag && array[0] == '1'
        possible_plays.push(0)
      elsif array[4] == array[6] && array[4] == tag && array[2] == '3'
        possible_plays.push(2)
      end
        return possible_plays
  end
end