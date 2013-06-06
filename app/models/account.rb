class Account < ActiveRecord::Base
  attr_accessible :usr_name, :usr_password, :user_id
  belongs_to :user
  #scope :mine, lambda { |current_user_id| where(user_id: current_user_id).first }
end
