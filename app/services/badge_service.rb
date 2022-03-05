class BadgeService

  def initialize(test_passage)
    @test_passage = test_passage
    @user = test_passage.user
    @test = test_passage.test
  end

  def call
    Badge.select do |badge|
      rule = "#{badge.rule}?"
      send(rule, badge.parameter)
    end
  end

  private
  
  # прохождение любого теста с первой попытки
  def success_on_first_try?(_test_title)
    @test_passage.success? && @user.test_passages.where(test: @test).count == 1
  end

  # успешное прохождение всех тестов в конкретной категории
  def success_category?(category_title)
    @test.category.title == category_title && Test.by_category(category_title).count == completed_categories(@user)
  end

  def completed_categories(user)
    user.test_passages.passed.joins(:test).where("tests.category_id": @test.category_id).count
  end
  
  # успешное прохождение всех тестов в конкретного уровня сложности
  def success_all_level?(level)
    @test.level == level.to_i && Test.where(level: @test.level).count == completed_levels(@user, @test.level)
  end

  def completed_levels(user, level)
    user.test_passages.passed.by_level(level).select(:test_id).distinct.size
  end
end