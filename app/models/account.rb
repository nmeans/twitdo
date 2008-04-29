class Account < ActiveRecord::Base
  has_many :todos
  
  def to_param
    "#{username}"
  end
end
