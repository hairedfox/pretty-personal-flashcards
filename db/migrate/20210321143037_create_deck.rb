class CreateDeck < ActiveRecord::Migration[6.0]
  def change
    create_table :decks do |t|
      t.references :user
      t.string :name

      t.timestamps
    end
  end
end
