class TestSuite
  #The assert_flag is used to see if assert_true was ever called with a false value
  #within the user's test method.
  private
  @assert_flag = true
  
  protected
  #Called before each test method.  User may need to allocate resources, so the user
  #can override this method.
  def start_up
    puts 'Start up called...'
  end
  
  #Called after each test method.  User may need to deallocate resources, so the user
  #can override this method.
  def tear_down
    puts 'Tear down called...'
  end
  
  def run
    test_results = Hash.new
    self.methods.each do |method|
      if method.start_with? "test" then
        #puts method
        self.start_up
        self.send method
        if @assert_flag == false then
          test_results[method] = "fail"
          @assert_flag = true
        else
          test_results[method] = "pass"
        end
        self.tear_down
      end
    end
    # Prints out the "inspected" version of the hash.  The inspect method returns a readable
    # representation of the hash.
    p test_results
  end
  
  def assert_true(val)
    @assert_flag = false if val == false
  end
end