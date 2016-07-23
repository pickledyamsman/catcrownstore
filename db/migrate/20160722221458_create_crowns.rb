class CreateCrowns < ActiveRecord::Migration
  def change
    create_table :crowns do |t|
      t.string :name
      t.float :price
      t.string :color
      t.string :flower_type
      t.text :description

      t.timestamps null: false
    end
  end
end
