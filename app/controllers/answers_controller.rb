class AnswersController < ApplicationController
  before_action :set_answer, only: %i[edit update destroy]
  before_action :set_question

  def new
    @answer = @question.answers.build
  end

  def create
    @answer = @question.answers.build(answer_params)
    if @answer.save
      redirect_to quiz_question_path(@question.quiz, @question), notice: 'Answer was successfully created.'
    else
      render :new
    end
  end

  def edit
  end

  def update
    if @answer.update(answer_params)
      redirect_to quiz_question_path(@question.quiz, @question), notice: 'Answer was successfully updated.'
    else
      render :edit
    end
  end

  def destroy
    @answer.destroy
    redirect_to quiz_question_path(@question.quiz, @question), notice: 'Answer was successfully destroyed.'
  end

  private

  def set_answer
    @answer = Answer.find(params[:id])
  end

  def set_question
    @question = Question.find(params[:question_id])
  end

  def answer_params
    params.require(:answer).permit(:content, :is_correct)
  end
end

