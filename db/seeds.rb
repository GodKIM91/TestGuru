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
    image: 'success_category', 
    rule: 'success_category', 
    parameter: '1', 
    description: 'Завершить все тесты уровня 1' },

  { name: 'Гуру уровня 2!', 
    image: 'success_category', 
    rule: 'success_category', 
    parameter: '2', 
    description: 'Завершить все тесты уровня 2' },
    
  { name: 'Гуру уровня 3!', 
    image: 'success_category', 
    rule: 'success_category', 
    parameter: '3', 
    description: 'Завершить все тесты уровня 3' }])