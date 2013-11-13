class CreateAnswers < ActiveRecord::Migration
  def change
    create_table :answers do |t|
      t.text :answer
      t.integer :sentence_id
      t.integer :user_id

      t.timestamps
    end
  end
end
