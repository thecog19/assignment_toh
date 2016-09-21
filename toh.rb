###Tower of Hanoi is a game that requires players to move a stack of disks from one space (or rod) to another. For this assignment, you'll need to build a simple Tower of Hanoi game in Ruby

class ToH

  def self.gentower(height)
    puts height
    #our tower variables are going to go here
  end    

  def self.intitialize()
    height = self.start()
    self.gentower(height)
  end

  def self.start()
    userinputworks = false
    puts "Welcome to Tower of Hanoi"
    puts "In this game, you will be trying to move your tower"
    puts "From one column, to another"
    puts "Remember, only smaller blocks can be stacked on top of bigger blocks"
    while userinputworks == false
      puts "Set your height (recommended is 5) or type quit to quit."
      input = gets
      if input.strip == "quit"
        self.quitgame()

      elsif input.to_i < 0
        puts "Not a valid input. Numbers may not be negative"
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
  end

  def self.illegalmove()
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