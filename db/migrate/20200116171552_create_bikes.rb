class CreateBikes < ActiveRecord::Migration[5.0]
  def change
    create_table :bikes do |t|
      t.string :brand, null:false
      t.float :weight, null:false
      t.integer :price, null:false
      t.string :model, null:false
      t.references :user,null: false, foreign_key:true
      t.timestamps
    end
  end
end
