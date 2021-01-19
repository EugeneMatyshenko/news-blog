class Like < ApplicationRecord
  belongs_to :user
  belongs_to :entity, polymorphic: true
  validates :user, presence: true

end
