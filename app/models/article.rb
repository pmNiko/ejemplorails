class Article < ActiveRecord::Base
  validates :title, presence: true, length: {minimum: 5}
  #validates :text, presence: true, length: {minimum: 5}
  validates :author, presence: true

  belongs_to :author, class_name: 'User'
  has_and_belongs_to_many :categories

  def  self.search(search)
    if search.present?
      where('title LIKE :search OR text LIKE :search', search: "%#{search}%")
    else
      all
    end
  end
end
