class HelpRequest < ApplicationRecord
  validates :title, presence: true
  validates :description, presence: true
  validates :author, presence: true
  validates :state, presence: true
  belongs_to :author, class_name: 'User', foreign_key: 'author_id'
  has_and_belongs_to_many :rescuers, class_name: 'User'

  def activate 
    if state == 'active'
      errors.add(:state, :already_active, 
                 message: 'prośba o pomoc jest już aktywna')     
      return false
    elsif state != 'draft' 
      errors.add(:state, :must_be_a_draft,
                 message: 'aktywować można jedynie prośby w stanie roboczym')  
      return false
    end

    update(state: :active)
  end
end
