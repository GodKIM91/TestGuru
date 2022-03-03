# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

user = User.create(email: 'godkimovsk@gmail.com', password: '123234', first_name: 'Alexander')

categories = Category.create([
  { title: 'FRONTEND'},
  { title: 'BACKEND'},
  { title: 'MOBILE'}
])

tests = Test.create([
  { title: 'HTML base', level: 1, category_id: categories[0].id, author_id: user.id, visible: true }, 
  { title: 'Ruby base', level: 1, category_id: categories[1].id, author_id: user.id, visible: true },
  { title: 'Kotlin base', level: 1, category_id: categories[2].id, author_id: user.id, visible: true },
  { title: 'HTML advanced', level: 2, category_id: categories[0].id, author_id: user.id, visible: true },
  { title: 'Ruby advanced', level: 2, category_id: categories[1].id, author_id: user.id, visible: true },
  { title: 'Kotlin advanced', level: 2, category_id: categories[2].id, author_id: user.id, visible: true },
  { title: 'RoR professional', level: 3, category_id: categories[1].id, author_id: user.id, visible: true }
])

questions = Question.create([
  { body: 'Тег курсива?', test_id: tests[0].id }, # 1
  { body: 'Тег жирного текста?', test_id: tests[0].id }, # 2
  { body: 'Метод сортировки массива?', test_id: tests[1].id }, # 3
  { body: 'Что такое хэш?', test_id: tests[1].id }, # 4
  { body: 'Какого типа данных нет в Kotlin?', test_id: tests[2].id }, # 5
  { body: 'Kotlin статически типизированный?', test_id: tests[2].id }, # 6
  { body: 'Тег для ссылок на внешние иточники?', test_id: tests[3].id }, # 7
  { body: 'Атрибут для открытия ссылки в новой вкладке?', test_id: tests[3].id }, # 8
  { body: 'Что такое синглтон метод?', test_id: tests[4].id }, # 9
  { body: 'Что такое метод предикат?', test_id: tests[4].id }, # 10
  { body: 'Как создать новый объект Kotlin?', test_id: tests[5].id }, # 11
  { body: 'Ключевое слово для добавления библиотек Kotlin?', test_id: tests[5].id }, # 12
  { body: 'Задача файла seeds?', test_id: tests[6].id }, # 13
  { body: 'Какой номер у первой версии приложения?', test_id: tests[6].id } # 14
])

answers = Answer.create([
  # 1
  { body: '<i>', correct: true, question_id: questions[0].id },
  { body: '<s>', correct: false, question_id: questions[0].id },
  { body: '<b>', correct: false, question_id: questions[0].id },
  # 2
  { body: '<i>', correct: false, question_id: questions[1].id },
  { body: '<s>', correct: false, question_id: questions[1].id },
  { body: '<b>', correct: true, question_id: questions[1].id },
  # 3
  { body: 'struct', correct: false, question_id: questions[2].id },
  { body: 'sort', correct: true, question_id: questions[2].id },
  { body: 'to_sort', correct: false, question_id: questions[2].id },
  # 4
  { body: 'коллекция данных типа fixnum', correct: false, question_id: questions[3].id },
  { body: 'ассоциативный массив', correct: true, question_id: questions[3].id },
  { body: 'массив строк', correct: false, question_id: questions[3].id },
  # 5
  { body: 'Bit', correct: true, question_id: questions[4].id },
  { body: 'Byte', correct: false, question_id: questions[4].id },
  { body: 'Short', correct: false, question_id: questions[4].id },
  # 6
  { body: 'Нет', correct: false, question_id: questions[5].id },
  { body: 'Да', correct: true, question_id: questions[5].id },
  { body: 'Нет однозначного соглашения', correct: false, question_id: questions[5].id },
  # 7
  { body: '<el>', correct: false, question_id: questions[6].id },
  { body: '<a>', correct: true, question_id: questions[6].id },
  { body: '<b>', correct: false, question_id: questions[6].id },
  # 8
  { body: 'target _blank', correct: true, question_id:  questions[7].id },
  { body: 'link _target', correct: false, question_id:  questions[7].id },
  { body: 'link _tab', correct: false, question_id:  questions[7].id },
  # 9
  { body: 'метод с одним аргументом', correct: false, question_id:  questions[8].id },
  { body: 'метод одного инстанса', correct: true, question_id:  questions[8].id },
  { body: 'метод, который возвращает только true или false', correct: false, question_id:  questions[8].id },
  # 10
  { body: 'метод типа method?, который вернет true или false', correct: true, question_id:  questions[9].id },
  { body: 'метод без аргументов', correct: false, question_id:  questions[9].id },
  { body: 'метод, работащий только с одним инстансом', correct: false, question_id:  questions[9].id },
  # 11
  { body: 'obj = Obj()', correct: true, question_id:  questions[10].id },
  { body: 'obj = Obj.new', correct: false, question_id:  questions[10].id },
  { body: 'obj = new Obj', correct: false, question_id:  questions[10].id },
  # 12
  { body: 'require', correct: false, question_id:  questions[11].id },
  { body: 'add', correct: false, question_id:  questions[11].id },
  { body: 'import', correct: true, question_id:  questions[11].id },
  # 13
  { body: 'Хранение логов приложения', correct: false, question_id:  questions[12].id },
  { body: 'Хранение схемы базы данных', correct: false, question_id:  questions[12].id },
  { body: 'Генерация начальных тестовых данных', correct: true, question_id:  questions[12].id },
  # 14
  { body: '1.0.0', correct: false, question_id:  questions[13].id },
  { body: '0.0.1', correct: false, question_id:  questions[13].id },
  { body: '0.1.0', correct: true, question_id:  questions[13].id }
])

badges = Badge.create([
  { name: 'HTML base GURU!', 
    image: 'first_try', 
    rule: 'success_on_first_try', 
    parameter: 'HTML base',
    description: 'Пройти тест HTML base с первой попытки' },

  { name: 'Ruby advanced GURU!', 
    image: 'first_try', 
    rule: 'success_on_first_try', 
    parameter: 'Ruby advanced',
    description: 'Пройти тест Ruby advanced с первой попытки' },

  { name: 'Гуру FRONTEND!', 
    image: 'success_category', 
    rule: 'success_category', 
    parameter: 'FRONTEND', 
    description: 'Завершить все тесты в категории FRONTEND' },

  { name: 'Гуру BACKEND!', 
    image: 'success_category', 
    rule: 'success_category', 
    parameter: 'BACKEND', 
    description: 'Завершить все тесты в категории BACKEND' },

  { name: 'Гуру уровня 1!', 
    image: 'success_level', 
    rule: 'success_all_level', 
    parameter: '1', 
    description: 'Завершить все тесты уровня 1' },

  { name: 'Гуру уровня 2!', 
    image: 'success_level', 
    rule: 'success_all_level', 
    parameter: '2', 
    description: 'Завершить все тесты уровня 2' },
    
  { name: 'Гуру уровня 3!', 
    image: 'success_level', 
    rule: 'success_all_level', 
    parameter: '3', 
    description: 'Завершить все тесты уровня 3' }])