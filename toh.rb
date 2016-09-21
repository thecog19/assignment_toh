###Tower of Hanoi is a game that requires players to move a stack of disks from one space (or rod) to another. For this assignment, you'll need to build a simple Tower of Hanoi game in Ruby

class ToH

  def self.gentower(height)
    $bar1 = [] 
    $bar2 = []
    $bar3 = []
    $master = {1 => $bar1, 2 => $bar2, 3 => $bar3}
    while height > 0 
      $bar1.push(height)
      height -= 1
    end
    $winner = $bar1.clone
    return
  end    

  def self.runprogram()
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
    self.display()
    puts "Time to make a move."
    puts "From where would you like to move?"
    puts "Towers are numbered 1, 2 and 3 from left to right"
    puts "(Type quit to quit)"

    firstnum = gets
    if firstnum.strip == "quit"
      self.quitgame()
    end

    if (firstnum.to_i == 1)||(firstnum.to_i == 2)||(firstnum.to_i == 3)
      if $master[firstnum.to_i].empty? == true
        self.illegalmove("empty")
        return
      else
        puts "moving from position #{firstnum.strip} to?"
        moving = $master[firstnum.to_i].pop()
      end

    else 
      self.illegalmove()
      return
    end

    secondnum = gets
     if secondnum.strip == "quit"
      self.quitgame()
    end

    if secondnum.strip == firstnum.strip
      $master[secondnum.to_i].push(moving) 
      self.illegalmove()
    elsif (secondnum.to_i == 1)||(secondnum.to_i == 2)||(secondnum.to_i == 3)
      if $master[secondnum.to_i][0] == nil
        puts "moving from position #{firstnum.strip} to position #{secondnum.strip}"
        $master[secondnum.to_i].push(moving) 
      elsif moving > $master[secondnum.to_i][-1] 
        #we want the item we're moving to be smaller than the base
          $master[firstnum.to_i].push(moving)
          self.illegalmove("bigger")
      else
        puts "moving from position #{firstnum.strip} to position #{secondnum.strip}"
        $master[secondnum.to_i].push(moving) 
      end
    else
      $master[firstnum.to_i].push(moving)
      self.illegalmove()
    end

    self.checkwin()
  end

  def self.illegalmove(reason = "undef")
    if reason == "undef"
      puts "That was an invalid move. Try again"
    elsif reason == "empty"
      puts "There are no peices there"
    elsif reason == "bigger"
      puts "Only smaller peices can be placed on bigger pieces."
    else
      puts "That was an invalid move. Try again"
    end
  end

  def self.checkwin()
    if ($bar2 == $winner) || ($bar3 == $winner)
      self.win()
    end
  end

  def self.win()
    puts "You won!"
    puts "Would you like to play again? Y to play again."
    yesorno = gets
        if yesorno.strip == "Y"
          self.runprogram()
        else
          self.quitgame()
        end
  end

  def self.quitgame()
    puts "Sorry you want to leave."
    puts "See you next time"
    exit
  end

  def self.display()

    print "\n"
    
    $bar1.reverse.each do |row|
      puts "o" * row.to_i
    end
    puts "bar 1"
    print "\n"

    $bar2.reverse.each do |row|
      puts "o" * row.to_i
    end
    puts "bar 2"
    print "\n"

    $bar3.reverse.each do |row|
      puts "o" * row.to_i
    end
    puts "bar 3"
    print "\n"
  end



end

a = ToH

a.runprogram()