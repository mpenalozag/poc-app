class FastV2 < ActiveRecord::Migration[7.1]
  def change
    add_column :items, :fast_col_v2, :string
  end
end
