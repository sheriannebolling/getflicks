class MoviesController < ApplicationController
  def index
    # @movies = Movie.all

    @movies = Movie.where(genre: params[:genre].capitalize)
  end

  def show
    @movie = Movie.find(params[:id])
  end

  def new

  end

  def create

  end

  def edit
  end

  def update

  end

  def destroy
  end

end
