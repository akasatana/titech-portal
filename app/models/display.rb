class Display < ActiveRecord::Base

  attr_accessible :col1, :col2, :col3, :col4, :col5, :col6, :col7, :col8, :col9, :col10
  validates :col1, :col2, :col3, :col4, :col5, :col6, :col7, :col8, :col9, :col10, length: {:maximum => 1}
  #validates :col1, :col2, :col3, :col4, :col5, :col6, :col7, :col8, :col9, :col10, numericality: false
end
