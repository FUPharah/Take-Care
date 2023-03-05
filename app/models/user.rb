class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  validates :first_name, presence: true, length: { minimum: 3 }, message: "First name must be at least 3 characters long"
  validates :last_name, presence:  true, length: { minimum: 3 }, message: "Last name must be at least 3 characters long"
  validates :age, presence: true, numericality: { only_integer: true, greater_than: 0 }, message: "Age must be a number greater than 0"
  validates :email, presence: true, uniqueness: true, format: { with: /\A[\w+\-.]+@[a-z\d\-]+(\.[a-z\d\-]+)*\.[a-z]+\z/i, message: "Invalid email format" }
  has_many :families
end
