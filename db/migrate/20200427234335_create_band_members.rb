class CreateBandMembers < ActiveRecord::Migration[5.1]
  def change
    create_table :band_members do |t|
      t.integer :band_id, null: false
      t.integer :musician_id, null: false
      t.string :instrument, null: false
      t.timestamps
    end
  end
end
