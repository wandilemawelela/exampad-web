class QuestionsController < ApplicationController
  before_action :set_question, only: %i[show edit update destroy]

  def index
    @quiz = Quiz.find(params[:quiz_id])
    @questions = @quiz.questions
  end

  def show
  end

  def new
    @quiz = Quiz.find(params[:quiz_id])
    @question = @quiz.questions.build
  end

  def create
    @quiz = Quiz.find(params[:quiz_id])
    @question = @quiz.questions.build(question_params)
    if @question.save
      redirect_to quiz_questions_path(@quiz), notice: 'Question was successfully created.'
    else
      render :new
    end
  end

  def edit
  end

  def update
    if @question.update(question_params)
      redirect_to quiz_question_path(@question.quiz, @question), notice: 'Question was successfully updated.'
    else
      render :edit
    end
  end

  def destroy
    @question.destroy
    redirect_to quiz_questions_path(@question.quiz), notice: 'Question was successfully destroyed.'
  end

  private

  def set_question
    @question = Question.find(params[:id])
  end

  def question_params
    params.require(:question).permit(:content)
  end
end

