class Information < ApplicationRecord
  validates :title, presence: true, length: { in: 1..160 }
  validates :content, length: { maximum: 255 }
end
