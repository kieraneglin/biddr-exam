class Bid < ActiveRecord::Base
  belongs_to :auction

  validates :amount, presence: true, numericality: true
  #validates_numericality_of :amount, :greater_than => Proc.new{Bid.last}

  validate :greater_than_current_price

  def greater_than_current_price
    unless self.auction.nil?
      errors.add(:amount, "must be greater than current price") if
        !amount.blank? && amount < self.auction.current_price
      end
  end
end
