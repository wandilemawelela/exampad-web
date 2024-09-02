class QuestionsController < ApplicationController
  before_action :set_quiz
  before_action :require_teacher!, only: [:new, :create, :edit, :update, :destroy]
  before_action :set_question, only: %i[show edit update destroy]

  def index
    @quiz = Quiz.find(params[:quiz_id])
    @questions = @quiz.questions
  end

  def show
    @question
  end

  def new
    @question = @quiz.questions.new(question_type: 'multiple_choice')
    @answers = @question.answers.build([{ content: '', correct: false }] * 4) # Start with 4 possible answers
  end

  def create
    @question = @quiz.questions.new(question_params)
    if @question.save
      redirect_to @quiz, notice: 'Question created successfully.'
    else
      render :new
    end
  end

  def edit
    @quiz = Quiz.find(params[:quiz_id])
    @question = @quiz.questions.find(params[:id])
    redirect_to quiz_question_path(@question.quiz, @question), notice: 'Question was edited successfully.'
  end

  def update
    if @question.update(question_params)
      redirect_to quiz_path(@quiz), notice: 'Question was successfully updated.'
    else
      render :edit
    end
  end

  def destroy
    @question.destroy
    redirect_to quiz_questions_path(@question.quiz), notice: 'Question was successfully destroyed.'
  end

  private

  def set_quiz
    @quiz = Quiz.find(params[:quiz_id])
  end

  def set_question
    @question = @quiz.questions.find(params[:id])
  end

  def question_params
    params.require(:question).permit(:content, :question_type, answers_attributes: [:id, :content, :correct, :_destroy])
  end
end

