# Set the host name for URL creation
SitemapGenerator::Sitemap.default_host = "http://appsoku.net"

SitemapGenerator::Sitemap.create do
  add root_path, priority: 0.7, changefreq: 'daily'

  Article.all.find_each do |article|
    add article_path(article), priority: 1.0, lastmod: article.updated_at, changefreq: 'daily'
  end


  # Put links creation logic here.
  #
  # The root path '/' and sitemap index file are added automatically for you.
  # Links are added to the Sitemap in the order they are specified.
  #
  # Usage: add(path, options={})
  #        (default options are used if you don't specify)
  #
  # Defaults: :priority => 0.5, :changefreq => 'weekly',
  #           :lastmod => Time.now, :host => default_host
  #
  # Examples:
  #
  # Add '/articles'
  #
  #   add articles_path, :priority => 0.7, :changefreq => 'daily'
  #
  # Add all articles:
  #
  #   Article.find_each do |article|
  #     add article_path(article), :lastmod => article.updated_at
  #   end
end
