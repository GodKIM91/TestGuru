module TestsHelper

  TEST_LEVELS = { 0 => I18n.t('helpers.test.easy'), 
                  1 => I18n.t('helpers.test.elementary'), 
                  2 => I18n.t('helpers.test.advanced'), 
                  3 => I18n.t('helpers.test.hard')}.freeze

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
