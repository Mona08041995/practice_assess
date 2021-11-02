class CreatePosts < ActiveRecord::Migration[6.1]
  def change
    create_table :posts do |t|
      t.text :title
      t.datetime :published_at
      t.references :user,index: true
      t.string :created_by
      t.string :updated_by
      t.timestamps
    end
  end
end
