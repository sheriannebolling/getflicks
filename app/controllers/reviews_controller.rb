class ReviewsController < ApplicationController
  before_action :find_movie_for_review
  before_action :find_review, only: [:edit, :update, :destroy]
  before_action :require_login

  def new
    @review = Review.new
  end

  def create
    
      @review = @movie.reviews.new(review_params)
      @review.user = current_user
      if @review.save
        redirect_to @movie
      else
        render 'reviews/new'
      end
  end

  def edit
  end

  def update

  end

  def destroy
  end

  private
    def find_movie_for_review
      @movie = Movie.find(params[:movie_id])
    end

    def find_review
      @review = Review.find(params[:id])
    end

    def review_params
      params.require(:review).permit(:rating, :comment)
    end

end
