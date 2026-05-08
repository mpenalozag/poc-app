# Migración de Escenario 2: agrega registros para que GET /count > 0.
# Copiar a db/migrate/ antes de buildear v3.

class SeedItems < ActiveRecord::Migration[7.1]
  def up
    Item.create!(description: 'first item from migration')
    Item.create!(description: 'second item from migration')
    Item.create!(description: 'third item from migration')
  end

  def down
    Item.destroy_all
  end
end
