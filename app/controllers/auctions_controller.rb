class AuctionsController < ApplicationController

  def index
    @auctions = Auction.all
  end

  def new
    @auction = Auction.new
  end

  def create
    @auction = Auction.new allowed_auction_params
    if @auction.save
      redirect_to auction_path(@auction)
    else
      render :new
    end
  end

  def show
    @bid = Bid.new
    @auction = Auction.find params[:id]
  end

  def edit
  end

  private

  def allowed_auction_params
    params.require(:auction).permit(:title, :body, :end_time, :reserve)
  end
end
