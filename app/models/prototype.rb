class Prototype < ApplicationRecord
  belongs_to :user
  has_one_attached :image
  validates :image, presence: true
  has_many :comments , dependent: :destroy 

  def create
    @prototype = Prototype.new(prototype_params)
    # 以下略
  end
end
