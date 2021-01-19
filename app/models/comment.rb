class Comment < ApplicationRecord
  belongs_to :user
  belongs_to :entity, polymorphic: true
  validates :user, presence: true
  validates :text, presence: true, length: {maximum: 1000, too_long: "%{count} characters is the maximum allowed"}
end
