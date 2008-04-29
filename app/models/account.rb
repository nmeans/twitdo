class Account < ActiveRecord::Base
  def to_param
    "#{username}"
  end
end
