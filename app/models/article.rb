class Article < ApplicationRecord
  belongs_to :user
  has_many :comments
  validates :title, presence: true
  validates :user_id, presence: true
  validates :body, length: {minimum: 5,
                            too_short: "%{count} is too short. You need to write more."}
end


