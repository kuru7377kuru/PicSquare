class Post < ApplicationRecord
  has_many :images, dependent: :destroy
  has_many :comments
  accepts_nested_attributes_for :images, allow_destroy: true
  belongs_to :user
  has_many :favorites
  has_many :users, through: :favorites

  def self.search(search)
    return Post.all unless search
    Post.where('text LIKE(?)', "%#{search}%")
  end
end
