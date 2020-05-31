class Post < ApplicationRecord
  has_many :images, dependent: :destroy
  has_many :comments
  accepts_nested_attributes_for :images, allow_destroy: true
  belongs_to :user
end
