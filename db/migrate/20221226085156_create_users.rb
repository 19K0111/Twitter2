class CreateUsers < ActiveRecord::Migration[7.0]
  def change
    create_table :users do |t|
      t.string :email
      t.string :screen_name
      t.string :user_name
      t.string :language

      t.timestamps
    end
  end
end
