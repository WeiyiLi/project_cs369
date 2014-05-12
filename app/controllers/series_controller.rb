class SeriesController < ApplicationController

  def index
    @series = Series.paginate(page: params[:page]).order(:name)
  end

  def show
    @series = Series.find(params[:id])
  end

  def new
     @series = Series.new
  end

  def create
    @series = Series.new(series_params)
    if @series.save
      flash[:success] = "Series created successfully."
      redirect_to @series
    else
      render 'new'
    end
  end
  
  def edit
    @series = Series.find(params[:id])
  end
  
  def update
    @series = Series.find(params[:id])
    if @series.update_attributes(series_params)
      flash[:success] = "Series updated"
      redirect_to @series
    else
      render 'edit'
    end
  end

  def destroy
    Series.find(params[:id]).destroy
    flash[:success] = "Series deleted."
    redirect_to series_url
  end

  private
    def series_params
      params.require(:series).permit(:name)
    end
end