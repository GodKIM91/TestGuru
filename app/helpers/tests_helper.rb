module TestsHelper

  TEST_LEVELS = { 0 => :easy, 1 => :elementary, 2 => :advanced, 3 => :hard}.freeze

  def test_level(test)
    TEST_LEVELS[test.level] || :hero
  end

  def test_header(test)
    if test.persisted?
      "Редактирование теста: #{test.title}"
    else
      'Создание теста'
    end
  end
end
