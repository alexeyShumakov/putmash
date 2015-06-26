class CreateUserReviews < ActiveRecord::Migration
  def change
    create_table :user_reviews do |t|
      t.references :user, index: true, foreign_key: true
      t.text :body
      t.boolean :moderated, default: false

      t.timestamps null: false
    end
  end
end
