class User < ActiveRecord::Base
  has_one :vote
  
  def opt_out
    self.opt_in = false
    save
  end
end
