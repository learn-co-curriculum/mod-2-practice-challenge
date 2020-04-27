class CreateMusicians < ActiveRecord::Migration[5.1]
  def change
    create_table :musicians do |t|
      t.string :name, null: false
      t.integer :age, null: false
      t.timestamps
    end
  end
end
