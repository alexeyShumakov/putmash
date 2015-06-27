SitemapGenerator::Sitemap.default_host = "http://northlines.net"
SitemapGenerator::Sitemap.sitemaps_path = 'shared/'

SitemapGenerator::Sitemap.create do

  add user_reviews_path
  add contacts_path

  NewsItem.all.each do |news|
    add news_item_path(news)
  end

  Category.all.each do |category|
    add category_path(category)
  end

  Product.all.each do |product|
    add product_path(product)
  end

end
