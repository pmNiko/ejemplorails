class ArticleCategorization < ActiveRecord::Base
  belongs_to :article
  belongs_to :category

  validates_presence_of :article, :category, :position
  validates_uniqueness_of :position, :scope => :article_id
  validates_uniqueness_of :category_id, :scope => :article_id
end
