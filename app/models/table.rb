class Table < ActiveRecord::Base
  attr_accessible :col1, :col2, :col3, :col4, :col5, :col6, :col7, :col8, :col9, :col10, :user_id
  belongs_to :user
  validates :col1, :col2, :col3, :col4, :col5, :col6, :col7, :col8, :col9, :col10, length: {:maximum => 1}
  #scope :mine, -> (user_id) { where(user_id: user_id) }
end
