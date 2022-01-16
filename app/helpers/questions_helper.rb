module QuestionsHelper
  def question_header(question)
    if question.persisted?
      "Редактирование вопроса: #{question.body}"
    else
      'Создание вопроса'
    end
  end
end
