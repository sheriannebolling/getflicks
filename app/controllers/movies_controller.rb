class MoviesController < ApplicationController
  def index
    @movies = Movie.where(genre: params[:genre]).paginate(page: params[:page], per_page: 30)
  end

  def show
    @movie = Movie.find(params[:id])
  end
end
