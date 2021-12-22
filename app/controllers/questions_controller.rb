class QuestionsController < ApplicationController

  before_action :find_question, only: %i[show destroy]
  before_action :find_test, only: %i[index create]

  rescue_from ActiveRecord::RecordNotFound, with: :rescue_with_question_not_found

  def index
    questions = @test.questions.pluck(:body)
    render plain: questions.join("\n")
  end

  def new
  end

  def create
    question = @test.questions.create(question_params)
    if question.persisted?
      render plain: 'Question created!'
    else
      render plain: 'Save error, check question params!'
    end
  end

  def destroy
    @question.destroy
    render plain: 'Question was deleted!'
  end

  def show
    render plain: "#{@question.body}"
  end

  private

  def find_test
    @test = Test.find(params[:test_id])
  end

  def find_question
    @question = Question.find(params[:id])
  end

  private 

  def question_params
    params.require(:question).permit(:body)
  end

  def rescue_with_question_not_found
    render plain: 'Question was not found!'
  end
end
