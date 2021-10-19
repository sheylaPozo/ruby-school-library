# frozen_string_literal: true

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
