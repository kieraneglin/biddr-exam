class Auction < ActiveRecord::Base
  validates :title, presence: true
  validates :body, presence: true
  validates :end_time, presence: true
  validates :reserve, presence: true

  validate :end_time_is_in_future

  def end_time_is_in_future
    errors.add(:end_time, "can't be in the past") if
      !end_time.blank? and end_time < Date.today
  end
end
