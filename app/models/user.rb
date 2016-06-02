class User < ActiveRecord::Base
  rolify
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  has_many :articles, foreign_key: "author_id"

  def titles_in_category(category_name)
    matching_articles = articles.select do |article|
      article.categories.any? do |category|
        category.name == category_name
      end
    end
    matching_articles.map(&:title)
  end

end
