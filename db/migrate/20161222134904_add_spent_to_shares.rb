class AddSpentToShares < ActiveRecord::Migration[5.0]
  def change
    add_column :shares, :spent, :integer
  end
end
