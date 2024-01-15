class Comment < ApplicationRecord
  belongs_to :user  # tweetsテーブルとのアソシエーション
  belongs_to :prototype  # usersテーブルとのアソシエーション

  validates :text, presence: true
    
end
