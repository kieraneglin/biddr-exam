require 'rails_helper'

RSpec.describe BidsController, type: :controller do
  context 'Create a new bid' do
    def valid_params
      FactoryGirl.attributes_for(:bid)
    end
    it 'renders 200 if bid sucessful' do
      auction = Auction.new FactoryGirl.attributes_for(:auction)
      auction.save
      post :create, {auction_id: auction.id, bid: valid_params.merge(auction: auction)}
      expect(response).to have_http_status(:success)
    end
    # it 'renders new template if input is invalid' do
    #   post :create, auction: valid_params.merge(title: nil)
    #   expect(response).to render_template(:new)
    # end
  end
end
