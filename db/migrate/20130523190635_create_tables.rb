class CreateTables < ActiveRecord::Migration
  def change
    create_table :tables do |t|
      t.string :col1
      t.string :col2
      t.string :col3
      t.string :col4
      t.string :col5
      t.string :col6
      t.string :col7
      t.string :col8
      t.string :col9
      t.string :col10

      t.timestamps
    end
  end
end
