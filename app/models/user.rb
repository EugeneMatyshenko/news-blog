class User < ApplicationRecord
  validates :first_name, presence: true
  validates :last_name, presence: true
  scope :active_users, -> { where(active: true) }
  scope :inactive_users, -> { where(active: false) }
end

def test
  a = [1, 2, 3, 4]
  b = a.map { |x| x * x }
  print b
  c = a.select { |x| x % 2 == 0 }
  print c
  a.inject do |sum,x|
     sum + x
  end
end




