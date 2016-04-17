class CreatePapers < ActiveRecord::Migration[5.0]
  def change
    create_table :papers do |t|
      t.string :goal_word
      t.integer :last_color, limit: 1, default: 0
      t.text :word, default: ''

      t.timestamps
    end
  end
end
