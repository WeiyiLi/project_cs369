class WatchlistsController < ApplicationController

  def create
    @series = Series.find(params[:watchlist][:series_id])
    current_user.follow!(@series)
    redirect_to @series
  end

  def destroy
    @series = Watchlist.find(params[:id]).series
    current_user.unfollow!(@series)
    redirect_to @series
  end
end