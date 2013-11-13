class CreateVotes < ActiveRecord::Migration
  def change
    create_table :votes do |t|
      t.integer :direction
      t.integer :user_id
      t.integer :answer_id
      t.integer :sentence_id

      t.timestamps
    end
  end
end
