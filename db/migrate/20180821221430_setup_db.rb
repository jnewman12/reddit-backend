class SetupDb < ActiveRecord::Migration[5.2]
  # setting up both models
  def change
    create_table :posts do |t|
      t.string :title
      # link for if it's not a text post
      t.string :link
      # body for if it's not a link post
      t.text :body
      t.integer :upvotes, default: 0
      t.timestamps
    end

    create_table :comments do |t|
      t.text :body
      t.integer :upvotes, default: 0
      t.integer :post_id    
      t.timestamps
    end
  end
end
