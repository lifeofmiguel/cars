class CreateCars < ActiveRecord::Migration[6.1]
  def change
    create_table :cars do|t|
      t.string :make
      t.string :model
      t.integer :year
      t.string :text
    end
  end
end
