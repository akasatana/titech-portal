class Document < ActiveRecord::Base
  attr_accessible :name, :url
  belongs_to :user
  def generate(file) #Documentのレコードを作るときは、それに対応するファイルも作る
  	filename = file.original_filename
  	self.save!
  	File.open("public/docs/#{filename}","wb") do |f|
        f.try(:write, file.try(:read))
    end
  end
  def delete #Documentのレコードを消すときは、それに対応するファイルも消す
  	File.delete("public/docs/#{self.name}")
  	self.destroy
  end
end
