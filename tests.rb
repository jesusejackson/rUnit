require "runit.rb"

class Tests < TestSuite
  def initialize
    self.run
  end
  
  def start_up
  end
  
  def tear_down
  end
  
  def testOne
    assert_true(5 == 5)
  end
  
  def testTwo
    assert_true(5 == 5)
    assert_true(5 == 5)
    assert_true(5 == 5)
    assert_true(5 == 6)
  end
  
  def testThree
    assert_true((1 + 1) == 2)
  end
end