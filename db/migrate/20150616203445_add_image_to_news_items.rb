class AddImageToNewsItems < ActiveRecord::Migration
  def up
    add_attachment :news_items, :image
  end

  def down
    remove_attachment :news_items, :image
  end
end
