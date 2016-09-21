###Tower of Hanoi is a game that requires players to move a stack of disks from one space (or rod) to another. For this assignment, you'll need to build a simple Tower of Hanoi game in Ruby

class ToH

  def self.gentower(height)
    $bar1 = [] 
    $bar2 = []
    $bar3 = []
    while height > 0 
      $bar1.push(height)
      height -= 1
    end
    return
  end    

  def self.intitialize()
    #from here all the logic runs
    height = self.start()
    self.gentower(height)
    while true
      self.makemove()
    end
  end

  def self.start()
    userinputworks = false
    puts "Welcome to Tower of Hanoi"
    puts "In this game, you will be trying to move your tower"
    puts "From one column, to another."
    puts "Remember, only smaller blocks can be stacked on top of bigger blocks"
    while userinputworks == false
      puts "Set your height (recommended is 5) or type quit to quit."
      input = gets
      if input.strip == "quit"
        self.quitgame()

      elsif input.to_i < 0
        puts "Not a valid input. Numbers may not be negative"
      
      elsif input.to_i > 10
        puts "Warning, this game will take a long time to play with so many stacks"
        puts "Stacks may not display properly"
        puts "Would you like to continue anyway? Y to continue anything else to pass"
        yesorno = gets
        if yesorno.strip == "Y"
          puts "Proceeding"
          return input.to_i
        else
          puts "OK! Not proceeding"
        end
      else
        begin 
          Integer(input)
          return input.to_i
        rescue ArgumentError
          puts "That was not a valid input. All inputs must be positive integers"
        end
      end
    end
  end


  def self.makemove()
    puts "Time to make a move."
    puts "From where would you like to move?"
    puts "Towers are numbered 1, 2 and 3 from left to right"
    firstnum = gets
    if (firstnum.to_i == 1)||(firstnum.to_i == 2)||(firstnum.to_i == 3)
      puts "moving from position #{firstnum.strip} to?"
    else 
      self.illegalmove()
    end
    secondnum = gets
    if secondnum.strip == firstnum.strip
      self.illegalmove()
    elsif (secondnum.to_i == 1)||(secondnum.to_i == 2)||(secondnum.to_i == 3)
      puts "moving from position #{firstnum.strip} to position #{secondnum.strip}"
    else
      self.illegalmove()
    end
      
  end

  def self.illegalmove()
    puts "That was an invalid move. Try again"
  end

  def self.checkwin()
  end

  def self.quitgame()
    puts "Sorry you want to leave."
    puts "See you next time"
    exit
  end



end

a = ToH

a.intitialize()