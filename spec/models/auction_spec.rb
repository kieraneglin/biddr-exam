require 'rails_helper'

RSpec.describe Auction, type: :model do
  describe 'validations' do
    it 'requires a title' do
      auction = Auction.new
      auction.valid?
      expect(auction.errors.messages).to have_key(:title)
    end
    it 'requires a body' do
      auction = Auction.new
      auction.valid?
      expect(auction.errors.messages).to have_key(:body)
    end
    it 'requires a end time' do
      auction = Auction.new
      auction.valid?
      expect(auction.errors.messages).to have_key(:end_time)
    end
    it 'requires a reserve' do
      auction = Auction.new
      auction.valid?
      expect(auction.errors.messages).to have_key(:reserve)
    end
    it 'end time must be in future' do
      auction = Auction.new(end_time: Date.yesterday)
      auction.valid?
      expect(auction.errors.messages).to have_key(:end_time)
    end
    it 'reserve must be a number' do
      auction = Auction.new(reserve: "string")
      auction.valid?
      expect(auction.errors.messages).to have_key(:reserve)
    end
  end
end
