class Profile < ActiveRecord::Base
  belongs_to :user

  has_many :phones, :dependent => :destroy
  accepts_nested_attributes_for :phones, :allow_destroy => true
end
