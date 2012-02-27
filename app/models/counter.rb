class Counter < ActiveRecord::Base
  attr_accessible :foul, :goal

  def update_goal()
  	  @counter = Counter.find(2)
      @gl = @counter.goal
      @gl = @gl + 1
      @counter.update_attributes(:goal => @gl)
  end
end
