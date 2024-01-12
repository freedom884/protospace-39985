class Prototype < ApplicationRecord
  belongs_to :user
  has_one_attached :image
  validates :image, presence: true

  def create
    @prototype = Prototype.new(prototype_params)
    # 以下略
  end
end
