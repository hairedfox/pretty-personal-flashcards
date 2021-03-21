class CreateLink < ActiveRecord::Migration[6.0]
  def change
    create_table :links do |t|
      t.references :deck
      t.references :card

      t.timestamps
    end
  end
end
