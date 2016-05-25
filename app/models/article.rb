class Article < ActiveRecord::Base
  validates :title, presence: true, length: {minimum: 5}
  validates :text, presence: true, length: {minimum: 10}
  validates :author, presence: true

  belongs_to :author, class_name: 'User'
  has_and_belongs_to_many :categories
end
