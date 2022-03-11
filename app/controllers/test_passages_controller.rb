class TestPassagesController < ApplicationController

  before_action :set_test_passage, only: %i[show update result gist]

  def show; end

  def result; end

  def update
    @test_passage.accept!(params[:answer_ids])
    if @test_passage.completed? || @test_passage.time_out?
      flash_options = { notice: t('.not_got_badge') }
      badges_count = current_user.badges.size
      current_user.badges << BadgeService.new(@test_passage).call
      flash_options = { notice: t('.got_badge') } if current_user.badges.size > badges_count
      TestsMailer.completed_test(@test_passage).deliver_now
      redirect_to result_test_passage_path(@test_passage), flash_options
    else
      render :show
    end
  end

  def gist
    service = GistQuestionService.new(@test_passage.current_question)
    result = service.call

    if service.success?
      current_user.gists.create!(question: @test_passage.current_question,
                                 gist_url: result.html_url)
      flash_options = { notice: t('.success', link: result.html_url) }
    else
      flash_options = { alert: t('.failure') }
    end

    redirect_to @test_passage, flash_options
  end

  private

  def set_test_passage
    @test_passage = TestPassage.find(params[:id])
  end

end
