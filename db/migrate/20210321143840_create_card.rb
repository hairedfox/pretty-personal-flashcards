class CreateCard < ActiveRecord::Migration[6.0]
  def change
    create_table :cards do |t|
      t.references :user
      t.string :front
      t.string :back
      t.string :sound

      t.timestamps
    end
  end
end
