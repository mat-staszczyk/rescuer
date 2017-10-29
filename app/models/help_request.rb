class HelpRequest < ApplicationRecord
  validates :title, presence: true
  validates :description, presence: true
  validates :author, presence: true
  validates :state, presence: true
  belongs_to :author, class_name: 'User', foreign_key: 'author_id'
  has_and_belongs_to_many :rescuers, class_name: 'User'

  def self.active
    where(state: 'active')
  end

  def activate
    case state
    when 'active'
      errors.add(:state, :already_active,
                 message: 'prośba o pomoc jest już aktywna')
    when 'completed', 'cancelled'
      errors.add(:state, :must_be_a_draft,
                 message: 'aktywować można jedynie prośby w stanie roboczym')
    when 'draft'
      return update(state: :active)
    end

    return false
  end

  def cancel
    case state
    when 'cancelled'
      errors.add(:state, :already_cancelled,
                 message: 'prośba o pomoc jest już anulowana')
    when 'completed', 'draft'
      errors.add(:state, :must_be_active,
                 message: 'wycofać można jedynie aktywne prośby')
    when 'active'
      return update(state: :cancelled)
    end

    return false
  end

  def complete
    case state
    when 'completed'
      errors.add(:state, :already_completed,
                 message: 'prośba o pomoc jest już zakończona')
    when 'cancelled', 'draft'
      errors.add(:state, :must_be_active,
                 message: 'zakończyć można jedynie aktywne prośby')
    when 'active'
      return update(state: :completed)
    end

    return false
  end
end
