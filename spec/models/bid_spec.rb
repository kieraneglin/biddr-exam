require 'rails_helper'
# let(:auction) { FactoryGirl.create(:auction) }
# let(:bid) { FactoryGirl.create(:bid, auction: auction) }
RSpec.describe Bid, type: :model do
  describe "User submits a bid" do
    it "Must be a number" do
        bid = Bid.new(amount: "string")
        bid.valid?
        expect(bid.errors.messages).to have_key(:amount)
    end
    it "Must exist" do
        bid = Bid.new(amount: nil)
        bid.valid?
        expect(bid.errors.messages).to have_key(:amount)
    end
    it "Must be larger than current price" do
        auction = Auction.new FactoryGirl.attributes_for(:auction)
        auction.save

        bid = Bid.new FactoryGirl.attributes_for(:bid).merge(auction:auction)

        bid.save
        expect(bid.errors.messages).to have_key(:amount)
    end
  end
end
