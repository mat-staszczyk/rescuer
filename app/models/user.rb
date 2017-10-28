class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  validates :first_name, presence: true, length: { maximum: 50 }
  validates :last_name,  presence: true, length: { maximum: 75 }
  validates :email, length: { maximum: 255 }
  validates :birth_date, presence: true

  has_many :created_help_requests, class_name: 'HelpRequest', foreign_key: 'author_id'
  has_and_belongs_to_many :help_requests
end
