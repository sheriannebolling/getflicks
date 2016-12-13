class FavoritesController < ApplicationController
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
    favorite.destroy
    redirect_to @movie
  end

end
