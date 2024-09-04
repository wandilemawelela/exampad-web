class LeaderboardController < ApplicationController
  def index
    @students = User.where(role: :student).order(points: :desc).limit(10)
  end
end
