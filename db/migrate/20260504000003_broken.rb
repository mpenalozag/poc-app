# Migración deliberadamente rota para Escenario 3.
# Agrega columna NOT NULL sin default contra una tabla con datos existentes (los seeds del 002).
# Postgres rechaza esto y la migration falla con `column "name" of relation "items" contains null values`.
# Copiar a db/migrate/ antes de buildear v4.

class Broken < ActiveRecord::Migration[7.1]
  def change
    # Fix: agregar default permite que Postgres aplique la columna NOT NULL
    # sobre las filas existentes (les setea "unknown") y los nuevos inserts
    # sin name también obtienen el default. La columna sigue siendo NOT NULL
    # pero ya no rompe.
    add_column :items, :name, :string, null: false, default: "unknown"
  end
end
