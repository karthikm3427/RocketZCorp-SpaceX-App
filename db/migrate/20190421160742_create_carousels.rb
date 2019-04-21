class CreateCarousels < ActiveRecord::Migration[5.2]
  def change
    create_table :carousels do |t|
      t.string :slidetitle1
      t.string :slidetitle2

      t.timestamps
    end
  end
end
