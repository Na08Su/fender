class AddDescriptionToArticles < ActiveRecord::Migration[5.2]
  def change
    add_column :articles, :desc, :text
  end
end
