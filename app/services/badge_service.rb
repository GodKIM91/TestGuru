class BadgeService

  def initialize(test_passage)
    @test_passage = test_passage
    @user = test_passage.user
    @test = test_passage.test
    @test_passages = @user.test_passages
  end

  def call
    Badge.select do |badge|
      rule = "#{badge.rule}?"
      send(rule, badge.parameter)
    end
  end

  private
  
  # прохождение любого теста с первой попытки
  def success_on_first_try?(param)
    @test_passage.success? && @test.title == param && @user.test_passages.where(test: @test).count == 1
  end

  # успешное прохождение всех тестов в конкретной категории
  def success_category?(param)
    category = Category.joins(:tests).where(:tests => {:title => @test.title})
    @test.category.title == param && Test.where(category: category).count == completed_categories(@user, category)
  end

  def completed_categories(user, category)
    user.test_passages.by_passed.by_category(category).select(:test_id).distinct.size
  end
  
  # успешное прохождение всех тестов в конкретного уровня сложности
  def success_all_level?(param)
    @test.level == param.to_i && Test.where(level: @test.level).count == completed_levels(@user, @test.level)
  end

  def completed_levels(user, level)
    user.test_passages.by_passed.by_level(level).select(:test_id).distinct.size
  end
end