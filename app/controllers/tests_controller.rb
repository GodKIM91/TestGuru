class TestsController < ApplicationController
  
  before_action :set_test, only: %i[start]

  def index
    @tests = Test.visible_tests
  end

  def start
    if @test.questions.empty?
      redirect_to root_path, notice: t('.fail')
    else
      current_user.tests.push(@test)
      redirect_to current_user.test_passage(@test)
    end
  end

  private

  def set_test
    @test = Test.find(params[:id])
  end

end
