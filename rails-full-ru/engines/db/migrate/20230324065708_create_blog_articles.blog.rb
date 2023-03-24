# This migration comes from blog (originally 20230324065223)
class CreateBlogArticles < ActiveRecord::Migration[7.0]
  def change
    create_table :blog_articles do |t|
      t.string :title
      t.text :text

      t.timestamps
    end
  end
end
