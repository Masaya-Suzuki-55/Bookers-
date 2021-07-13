class Book < ApplicationRecord
  
   # validatesメソッド
  validates :title, presence: true
  validates :body, presence: true
end
