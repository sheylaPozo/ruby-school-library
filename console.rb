# frozen_string_literal: true

# Do some operations usefuls to clean and wait for the comandline programs
module Console
  def self.continue_story
    print 'press any key to continue'

    $stdin.getch

    print "            \r"
  end

  def self.clean
    system('clear') || system('cls')
  end
end
