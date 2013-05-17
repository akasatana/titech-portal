class CreateScrapers < ActiveRecord::Migration
  def change
    create_table :scrapers do |t|
      t.string :usr_name
      t.string :usr_password

      t.timestamps
    end
  end
end
