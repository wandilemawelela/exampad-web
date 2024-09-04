class QuestionsController < ApplicationController
  before_action :set_quiz
  before_action :require_teacher!, only: [:new, :create, :edit, :update, :destroy]
  before_action :set_question, only: %i[show edit update destroy answer]

  def index
    @questions = @quiz.questions
  end

  def show
    # The @question is already set by the set_question callback
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
    render :edit
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
    redirect_to quiz_path(@quiz), notice: 'Question was successfully deleted.'
  end

  def answer
    selected_answer = @question.answers.find(params[:answer_id])

    if selected_answer.correct?
      flash[:notice] = "Correct answer!"
      current_user.increment!(:points, 2) if @question.last_question? # Assuming a method to check if it's the last question
    else
      flash[:alert] = "Incorrect answer. Try again."
    end

    # Optionally, redirect to the next question or show results
    # If you want to redirect to the next question:
    next_question = @quiz.questions.where('id > ?', @question.id).first
    if next_question
      redirect_to quiz_question_path(@quiz, next_question)
    else
      redirect_to quiz_path(@quiz), notice: 'You have completed the quiz!'
    end
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
