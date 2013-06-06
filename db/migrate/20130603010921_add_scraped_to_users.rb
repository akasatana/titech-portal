class AddScrapedToUsers < ActiveRecord::Migration
  def change
    add_column :users, :scraped, :boolean, null: false, default: false
  end
end
