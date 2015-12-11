require 'rails_helper'

RSpec.describe AuctionsController, type: :controller do
  let(:auction) { FactoryGirl.create(:auction) }

  describe 'GET #new' do
    it 'returns http success' do
      get :new
      expect(response).to have_http_status(:success)
    end
  end

  context 'Create a new auction' do
    def valid_params
      FactoryGirl.attributes_for(:auction)
    end
    it 'redirects to show page if input is valid' do
      post :create, auction: valid_params
      expect(response).to redirect_to(auction_path(Auction.last))
    end
    it 'renders new template if input is invalid' do
      post :create, auction: valid_params.merge(title: nil)
      expect(response).to render_template(:new)
    end
  end
end
