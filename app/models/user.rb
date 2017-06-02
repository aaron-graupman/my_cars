class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  # Associations
  has_many :cars, dependent: :destroy
  # Validations
  # Callbacks
    # encrypt the credit card number after create
  # Instance Methods
  # Class Methods
end
