class AddDeletedAtToDecks < ActiveRecord::Migration[6.0]
  def change
    add_column :decks, :deleted_at, :datetime
    add_index :decks, :deleted_at
  end
end
