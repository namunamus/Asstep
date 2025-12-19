class TweetsController < ApplicationController
  before_action :authenticate_user!, except: [:index, :about, :search, :show]

  def index
    @tweets = Tweet.all

    start_date = params.fetch(:start_date, Date.today).to_date
    @events = Post.where(
      "start_time <= ? AND (end_time >= ? OR end_time IS NULL)",
      start_date.end_of_month.end_of_week,
      start_date.beginning_of_month.beginning_of_week
    )
  end

  def new
    @tweet = Tweet.new
  end

  def show
    @tweet = Tweet.find(params[:id])
  end

  def create
    tweet = Tweet.new(tweet_params)
    if tweet.save
      redirect_to action: "index"
    else
      redirect_to action: "new"
    end
  end

  def edit
    @tweet = Tweet.find(params[:id])
  end

  def update
    tweet = Tweet.find(params[:id])
    if tweet.update(tweet_params)
      redirect_to action: "show", id: tweet.id
    else
      redirect_to action: "new"
    end
  end

  def destroy
    tweet = Tweet.find(params[:id])
    tweet.destroy
    redirect_to action: :index
  end

  def search
    @q = Tweet.ransack(params[:q])
    @tweets = @q.result
  end

  def about
  end

  private

  def tweet_params
    params.require(:tweet).permit(:body)
  end
end
