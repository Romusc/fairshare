class AddRatingToShare < ActiveRecord::Migration[5.0]
  def change
    add_column :shares, :rating, :integer
  end
end
