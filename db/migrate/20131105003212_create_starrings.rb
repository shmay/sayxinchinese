class CreateStarrings < ActiveRecord::Migration
  def change
    create_table :starrings do |t|
      t.integer :user_id
      t.integer :user_id
      t.integer :answer_id

      t.timestamps
    end
  end
end
