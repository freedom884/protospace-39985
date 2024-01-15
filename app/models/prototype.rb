class Prototype < ApplicationRecord
  belongs_to :user
  has_one_attached :image
  validates :image, presence: true
  has_many :comments , dependent: :destroy 

  validates :title, presence: true
  validates :catch_copy, presence: true
  validates :concept, presence: true



  def create
    @prototype = Prototype.new(prototype_params)
    # 以下略
  end
end
