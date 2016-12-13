class FavoritesController < ApplicationController
  before_action :require_login

  def create
    @movie = Movie.find(params[:movie_id])
    favorite = @movie.favorites.new
    favorite.user = current_user
    favorite.save
    redirect_to @movie
  end

  def destroy
    favorite = Favorite.find(params[:id])
    @movie = favorite.movie
    if authorized?(favorite)
      favorite.destroy
    end
    redirect_to @movie
  end
end
