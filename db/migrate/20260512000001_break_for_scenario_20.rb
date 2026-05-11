# Escenario 20: deliberadamente rota para validar Cloud Logging stacktrace.
# add_column NOT NULL sin default contra tabla items que ya tiene rows (seeded por 002).
# Postgres rechaza con: column "email" of relation "items" contains null values

class BreakForScenario20 < ActiveRecord::Migration[7.1]
  def change
    add_column :items, :email, :string, null: false
  end
end
