# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

users_tests = UsersTest.create([
  { user_id: 1, test_id: 1 },
  { user_id: 1, test_id: 2 },
  { user_id: 1, test_id: 3 },
  { user_id: 2, test_id: 1 },
  { user_id: 2, test_id: 2 },
  { user_id: 2, test_id: 3 }
])

users = User.create([
  { name: 'Bob', email: "bob@gmail.com" },
  { name: 'Sam', email: "sam@gmail.com" },
  { name: 'John', email: "john@gmail.com" },
  { name: 'David', email: "david@gmail.com" },
  { name: 'Harry', email: "harry@gmail.com" }
])

categories = Category.create([
  { title: 'FRONTEND'},
  { title: 'BACKEND'},
  { title: 'MOBILE'}
])

tests = Test.create([
  { title: 'HTML base', level: 1, category_id: 1}, 
  { title: 'Ruby base', level: 1, category_id: 2},
  { title: 'Kotlin base', level: 1, category_id: 3},
  { title: 'HTML advanced', level: 2, category_id: 1},
  { title: 'Ruby advanced', level: 2, category_id: 2},
  { title: 'Kotlin advanced', level: 2, category_id: 3},
  { title: 'RoR professional', level: 3, category_id: 2}
])

questions = Question.create([
  { body: 'Тег курсива?', test_id: 1}, # 1
  { body: 'Тег жирного текста?', test_id: 1}, # 2
  { body: 'Метод сортировки массива?', test_id: 2}, # 3
  { body: 'Что такое хэш?', test_id: 2}, # 4
  { body: 'Какого типа данных нет в Kotlin?', test_id: 3}, # 5
  { body: 'Kotlin статически типизированный?', test_id: 3}, # 6
  { body: 'Тег для ссылок на внешние иточники?', test_id: 4}, # 7
  { body: 'Атрибут для открытия ссылки в новой вкладке?', test_id: 4}, # 8
  { body: 'Что такое синглтон метод?', test_id: 5}, # 9
  { body: 'Что такое метод предикат?', test_id: 5}, # 10
  { body: 'Как создать новый объект Kotlin?', test_id: 6}, # 11
  { body: 'Ключевое слово для добавления библиотек Kotlin?', test_id: 6}, # 12
  { body: 'Задача файла seeds?', test_id: 7}, # 13
  { body: 'Какой номер у первой версии приложения?', test_id: 7} # 14
])

answers = Answer.create([
  # 1
  { body: '<i>', correct: true, question_id: 1},
  { body: '<s>', correct: false, question_id: 1},
  { body: '<b>', correct: false, question_id: 1},
  # 2
  { body: '<i>', correct: true, question_id: 2},
  { body: '<s>', correct: false, question_id: 2},
  { body: '<b>', correct: false, question_id: 2},
  # 3
  { body: 'struct', correct: false, question_id: 3},
  { body: 'sort', correct: true, question_id: 3},
  { body: 'to_sort', correct: false, question_id: 3},
  # 4
  { body: 'коллекция данных типа fixnum', correct: false, question_id: 4},
  { body: 'ассоциативный массив', correct: true, question_id: 4},
  { body: 'массив строк', correct: false, question_id: 4},
  # 5
  { body: 'Bit', correct: true, question_id: 5},
  { body: 'Byte', correct: false, question_id: 5},
  { body: 'Short', correct: false, question_id: 5},
  # 6
  { body: 'Нет', correct: false, question_id: 6},
  { body: 'Да', correct: true, question_id: 6},
  { body: 'Нет однозначного соглашения', correct: false, question_id: 6},
  # 7
  { body: '<el>', correct: false, question_id: 7},
  { body: '<a>', correct: true, question_id: 7},
  { body: '<b>', correct: false, question_id: 7},
  # 8
  { body: 'target _blank', correct: true, question_id: 8},
  { body: 'link _target', correct: false, question_id: 8},
  { body: 'link _tab', correct: false, question_id: 8},
  # 9
  { body: 'метод с одним аргументом', correct: false, question_id: 9},
  { body: 'метод одного инстанса', correct: true, question_id: 9},
  { body: 'метод, который возвращает только true или false', correct: false, question_id: 9},
  # 10
  { body: 'метод типа method?, который вернет true или false', correct: true, question_id: 10},
  { body: 'метод без аргументов', correct: false, question_id: 10},
  { body: 'метод, работащий только с одним инстансом', correct: false, question_id: 10},
  # 11
  { body: 'obj = Obj()', correct: true, question_id: 11},
  { body: 'obj = Obj.new', correct: false, question_id: 11},
  { body: 'obj = new Obj', correct: false, question_id: 11},
  # 12
  { body: 'require', correct: false, question_id: 12},
  { body: 'add', correct: false, question_id: 12},
  { body: 'import', correct: true, question_id: 12},
  # 13
  { body: 'Хранение логов приложения', correct: false, question_id: 13},
  { body: 'Хранение схемы базы данных', correct: false, question_id: 13},
  { body: 'Генерация начальных тестовых данных', correct: true, question_id: 13},
  # 14
  { body: '1.0.0', correct: false, question_id: 14},
  { body: '0.0.1', correct: false, question_id: 14},
  { body: '0.1.0', correct: true, question_id: 14}
])

