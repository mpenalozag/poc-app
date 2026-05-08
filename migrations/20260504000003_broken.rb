# Migración deliberadamente rota para Escenario 3.
# Agrega columna NOT NULL sin default contra una tabla con datos existentes (los seeds del 002).
# Postgres rechaza esto y la migration falla con `column "name" of relation "items" contains null values`.
# Copiar a db/migrate/ antes de buildear v4.

class Broken < ActiveRecord::Migration[7.1]
  def change
    add_column :items, :name, :string, null: false
  end
end
