class FastMigration < ActiveRecord::Migration[7.1]
  def change
    add_column :items, :fast_col, :string
  end
end
