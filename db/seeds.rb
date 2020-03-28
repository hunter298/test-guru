# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
User.create([{username: 'mcclaine', password: 'diehard'},
             {username: 'tomriddle', password: 'voldemort'}])
Category.create([{title: 'programming'}, {title: 'design'}, {title: 'other'}])
Test.create([{title: 'Ruby', level: 1, category_id: 1, user_id: 1},
             {title: 'Rails', level: 2, category_id: 1, user_id: 2},
             {title: 'Fortran', level: 3, category_id: 1, user_id: 2},
             {title: 'Photoshop', level: 1, category_id: 2, user_id: 2},
             {title: 'Coloring', level: 2, category_id: 2, user_id: 2},
             {title: 'Cleaning', level: 0, category_id: 3, user_id: 1},
             {title: 'Cooking', level: 4, category_id: 3, user_id: 2},])
Question.create([{body: 'Which of following is current version of Ruby?', test_id: 1},
                 {body: 'How to create an Array?', test_id: 1},
                 {body: 'What is Rails', test_id: 2},
                 {body: 'What Ruby on Rails has in common with railsroad', test_id: 2},
                 {body: 'What does it mean "FORTRAN"', test_id: 3},
                 {body: 'What is the main purpose of PS?', test_id: 4},
                 {body: 'What studio develop photoshop?', test_id: 4},
                 {body: 'What color match with white?', test_id: 5},
                 {body: 'You will clean toilet with:', test_id: 6},
                 {body: 'Food must be:', test_id: 7},])
Answer.create([{body: '2.7.0', correct: true, question_id: 1},
               {body: '2020 Corona Edition', correct: false, question_id: 1},
               {body: '3 - Wild Hunt', correct: false, question_id: 1},
               {body: 'By using literal []', correct: true, question_id: 2},
               {body: 'Ask politely', correct: false, question_id: 2},
               {body: 'Entering "$ create the array"', correct: false, question_id: 2},
               {body: 'Framework', correct: true, question_id: 3},
               {body: 'Hard work', correct: false, question_id: 3},
               {body: 'hard rock', correct: false, question_id: 3},
               {body: 'Rails', correct: false, question_id: 4},
               {body: 'Nothing', correct: true, question_id: 4},
               {body: 'Formula Translating System', correct: true, question_id: 5},
               {body: 'Name of mamont from Ice Age', correct: false, question_id: 5},
               {body: 'Upcoming Fortnite 2', correct: false, question_id: 5},
               {body: 'Graphic design', correct: false, question_id: 6},
               {body: 'Ramoving zits', correct: true, question_id: 6},
               {body: 'XX century Fox', correct: false, question_id: 7},
               {body: 'Macromedia', correct: false, question_id: 7},
               {body: 'Adobe', correct: true, question_id: 7},
               {body: 'Blue', correct: false, question_id: 8},
               {body: 'Red', correct: false, question_id: 8},
               {body: 'Every color', correct: true, question_id: 8},
               {body: 'Brush', correct: true, question_id: 9},
               {body: 'Rag', correct: false, question_id: 9},
               {body: 'Toothbrush', correct: false, question_id: 9},
               {body: 'Tasty', correct: true, question_id: 10},
               {body: 'Nasty', correct: false, question_id: 10},
               {body: 'Busty', correct: false, question_id: 10}])
































