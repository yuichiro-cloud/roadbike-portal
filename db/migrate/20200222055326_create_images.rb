class CreateImages < ActiveRecord::Migration[5.0]
  def change
    create_table :images do |t|
      t.string :src ,null: false
      t.references :bike, null: false ,foreign_key:true
      t.timestamps
    end
  end
end
