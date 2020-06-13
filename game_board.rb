class GameBoard
  require 'colorize'
  attr_reader :array
  
  def initialize(player_details)
    @@player_details = player_details
  end

  def build_board(array)
    @array = array
    puts "#{@@player_details['name']} vs #{@@player_details['name2']}"
    a, b, c, d, e, f, g, h, i = color_board(@array)
    puts <<-BOARD
           #{a}  | #{b}  | #{c} 
          ----|----|----
           #{d}  | #{e}  | #{f} 
          ----|----|----
           #{g}  | #{h}  | #{i} 
    BOARD
    puts ""
  end

  def check_wins(name)
    j = 0
    i = 0
    3.times do
      if (@array[j] == @array[j+1] && @array[j] == @array[j+2]) || (@array[i] == @array[i+3] && @array[i] == @array[i+6])
        puts "#{name}'s the winner".green
        return true 
      end
      j += 3
      i += 1
    end
   if @array[0] == @array[4] && @array[0] == @array[8]#diagonals
    puts "#{name}'s the winner".green
    return true 
   elsif @array[2] == @array[4] && @array[2] == @array[6]
    puts "#{name}'s the winner".green
    return true 
   elsif @array.all? {|item| /\D/ =~ item}
    puts "Stalemate".blue
    return true
   else
    return false
   end
  end

  private
  def color_board(array)
    j = 0
    i = 0
    3.times do
      if (array[j] == array[j+1] && array[j] == array[j+2])
       array[j] = array[j].green
       array[j+1] = array[j+1].green
       array[j+2] = array[j+2].green
      end
      j += 3
    end
    3.times do
      if (array[i] == array[i+3] && array[i] == array[i+6])
       array[i] = array[i].green
       array[i+3] = array[i+3].green
       array[i+6] = array[i+6].green
      end
      i += 1
    end
   if array[0] == array[4] && array[0] == array[8] #diagonals
    array[0] = array[0].green
    array[4] = array[4].green
    array[8] = array[8].green
   elsif array[2] == array[4] && array[2] == array[6]
    array[2] = array[2].green
    array[4] = array[4].green
    array[6] = array[6].green 
   end
   return array
  end
end