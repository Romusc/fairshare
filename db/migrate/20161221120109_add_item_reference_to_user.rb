class AddItemReferenceToUser < ActiveRecord::Migration[5.0]
  def change
    add_reference :items, :user
  end
end
