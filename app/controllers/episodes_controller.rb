class EpisodesController < ApplicationController
  def index
    @episode = Episode.paginate(page: params[:page])
  end

  def new
     @episode = Episode.new
  end

  def show
     @episode = Episode.find(params[:id])
  end

  def create
    @episode = Episode.new(episode_params)
    if @episode.save
      flash[:success] = ("Episode added successfully at " +
                Series.find(@episode.series_id).name)
      redirect_to @episode
    else
      render 'new'
    end
  end

  private

    def episode_params
      params.require(:episode).permit(:name, :season, :number,
                                   :series_id)
    end
end