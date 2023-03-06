class Family < ApplicationRecord
  belongs_to :user
  validates :first_name, presence: true, length: { minimum: 3 }
  validates :last_name, presence: true, length: { minimum: 3 }
  validates :age, presence: true, numericality: { only_integer: true, greater_than: 0 }
  has_one_attached :avatar
end
