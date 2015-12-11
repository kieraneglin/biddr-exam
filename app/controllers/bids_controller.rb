class BidsController < ApplicationController

  def create
    @auction = Auction.find params[:auction_id]
    @bid   = @auction.bids.new bid_params
    if @bid.amount && @bid.amount > @auction.current_price
      a = Auction.find(@auction)
      a.current_price = @bid.amount
      a.save
    end
    if @bid.amount && @bid.amount > @auction.reserve.to_f
      a = Auction.find(@auction)
      a.reserve_was_met
      a.save
    end
    if @bid.save
      redirect_to auction_path(@auction)
    else
      render "/auctions/show"
    end
  end

  private
  def bid_params
    params.require(:bid).permit(:amount)
  end
end
