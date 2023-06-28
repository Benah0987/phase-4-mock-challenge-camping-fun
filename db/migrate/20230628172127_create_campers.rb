class CreateCampers < ActiveRecord::Migration[6.1]
  def change
    create_table :campers do |t|
      t.integer :age
      t.string :name

      t.timestamps
    end

    add_reference :signups, :camper, foreign_key: true
  end
end
