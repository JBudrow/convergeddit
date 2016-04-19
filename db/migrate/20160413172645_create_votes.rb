class CreateVotes < ActiveRecord::Migration
  def change
    create_table :votes do |t|
      t.integer :user_id
      t.integer :url_id
      t.integer :score

      t.timestamps null: false
    end
  end
end
