class CreateDangers < ActiveRecord::Migration[5.0]
  def change
    create_table :dangers do |t|
      t.integer :reported
      t.integer :reporter
      t.timestamps
    end
  end
end
