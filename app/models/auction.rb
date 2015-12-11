class Auction < ActiveRecord::Base

  has_many :bids

  validates :title, presence: true
  validates :body, presence: true
  validates :end_time, presence: true
  validates :reserve, presence: true, numericality: true

  validate :end_time_is_in_future

  def end_time_is_in_future
    errors.add(:end_time, "can't be in the past") if
      !end_time.blank? && end_time < Date.today
  end

  include AASM

  # we put all the states and transitions in the `aasm` block
  aasm whiny_transitions: false do
    state :published, initial: true
    state :reserve_met
    state :reserve_not_met
    state :won
    state :closed

    event :was_won do
      transitions from: :reserve_met, to: :won
    end

    event :reserve_was_met do
      transitions from: :published, to: :reserve_met
    end

    event :reserve_was_not_met do
      transitions from: :published, to: :reserve_not_met
    end

    event :close do
      transitions from: [:reserve_not_met, :published], to: :closed
    end
  end
end
