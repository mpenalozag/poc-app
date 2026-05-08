class SlowMigration < ActiveRecord::Migration[7.1]
  def change
    execute "SELECT pg_sleep(180)"
    add_column :items, :slow_col, :string
  end
end
