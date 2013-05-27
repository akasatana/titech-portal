class CreateAccounts < ActiveRecord::Migration
  def change
    create_table :accounts do |t|
      t.string :usr_name
      t.string :usr_password

      t.timestamps
    end
  end
end
