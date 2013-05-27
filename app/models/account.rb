class Account < ActiveRecord::Base
  attr_accessible :usr_name, :usr_password, :user_id
  belongs_to :user
  #scope :mine, -> (user_id) { where(user_id: user_id) }
end
