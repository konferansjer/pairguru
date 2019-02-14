class CreateComments < ActiveRecord::Migration[5.2]
  def change
    create_table :comments do |t|
      t.text :content
      t.references :movie
      t.references :user
      t.timestamps
    end
    add_index :comments, [:user_id, :movie_id], unique: true
  end
end
