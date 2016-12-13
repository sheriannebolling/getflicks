class ReviewsController < ApplicationController
  before_action :find_movie_for_review, only: [:new, :create]
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
      @errors = @review.errors.full_messages
      render 'new'
    end
  end

  def edit
    redirect_to movie_path(@review.movie) unless authorized?(@review)
  end

  def update
    if authorized?(@review)
      if @review.update(review_params)
        redirect_to movie_path(@review.movie)
      else
        @errors = @review.errors.full_messages
        render 'edit'
      end
    else
      redirect_to movie_path(@review.movie)
    end
  end

  def destroy
    if authorized?(@review)
      @review.destroy
    end
    redirect_to movie_path(@review.movie)
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
