class CreateSentences < ActiveRecord::Migration
  def change
    create_table :sentences do |t|
      t.string :sentence
      t.text :explanation
      t.integer :language_id
      t.integer :convert_id
      t.integer :user_id

      t.timestamps
    end
  end
end
