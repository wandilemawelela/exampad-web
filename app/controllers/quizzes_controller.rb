class QuizzesController < ApplicationController
  before_action :authenticate_user!
  before_action :require_teacher!, only: [:new, :create, :edit, :update, :destroy]
  before_action :set_quiz, only: %i[show edit update destroy]

  def index
    @quizzes = Quiz.all
  end

  def show
    @questions = @quiz.questions
  end

  def new
    @quiz = Quiz.new
    @quizzes = Quiz.all
  end

  def create
    @quiz = Quiz.new(quiz_params)
    if @quiz.save
      redirect_to @quiz, notice: 'Quiz created successfully.'
    else
      @quizzes = Quiz.all  # Ensure quiz list is available on error
      render :new
    end
  end

  def edit
  end

  def update
    if @quiz.update(quiz_params)
      redirect_to @quiz, notice: 'Quiz was successfully updated.'
    else
      render :edit
    end
  end

  def destroy
    @quiz.destroy
    redirect_to quizzes_url, notice: 'Quiz was successfully destroyed.'
  end

  private

  def set_quiz
    @quiz = Quiz.find(params[:id])
  end

  def quiz_params
    params.require(:quiz).permit(:title, :description)
  end

  def authorize_teacher
    unless current_user.role == 'teacher'
      redirect_to root_path, alert: "You are not authorized to perform this action."
    end
  end
  
end

