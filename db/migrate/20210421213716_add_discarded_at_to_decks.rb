class AddDiscardedAtToDecks < ActiveRecord::Migration[6.0]
  def change
    add_column :decks, :discarded_at, :datetime
    add_index :decks, :discarded_at
  end
end
