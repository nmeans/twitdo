class Account < ActiveRecord::Base
  has_many :todos, :order => "id DESC"
  
  def to_param
    "#{username}"
  end
end
