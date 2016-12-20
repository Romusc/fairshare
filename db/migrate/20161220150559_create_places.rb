class CreatePlaces < ActiveRecord::Migration[5.0]
  def change
    create_table :places do |t|
      t.references :user, foreign_key: true
      t.string :address
      t.string :postcode
      t.string :city

      t.timestamps
    end
  end
end
