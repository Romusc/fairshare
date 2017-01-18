class AddPlaceReferenceToItem < ActiveRecord::Migration[5.0]
  def change
    add_reference :items, :place, foreign_key: true
  end
end



