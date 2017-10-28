class HelpRequest < ApplicationRecord
  validates :title, presence: true
  validates :description, presence: true
  validates :author, presence: true
  belongs_to :author, class_name: 'User', foreign_key: 'author_id'
  has_and_belongs_to_many :rescuers, class_name: 'User'
end
