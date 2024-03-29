class Prototype < ApplicationRecord
  belongs_to :user
  has_one_attached :image
  validates :image, presence: true
  has_many :comments 

  validates :title, presence: true
  validates :catch_copy, presence: true
  validates :concept, presence: true

end
