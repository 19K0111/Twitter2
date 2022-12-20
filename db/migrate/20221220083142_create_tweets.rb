class CreateTweets < ActiveRecord::Migration[7.0]
  def change
    create_table :tweets do |t|
      t.integer :user_id
      t.text :content
      t.integer :like, null: false, default: 0
      t.integer :unlike, null: false, default: 0

      t.timestamps
    end
  end
end
