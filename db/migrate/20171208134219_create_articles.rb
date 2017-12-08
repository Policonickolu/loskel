class CreateArticles < ActiveRecord::Migration[5.1]
  def change
    create_table :articles do |t|
      
      t.string :title
      t.text :content
      t.string :photo
      t.integer :rating, :default => 0

      t.timestamps null: false
      
    end
  end
end