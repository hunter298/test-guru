# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
users = User.create!([{username: 'mcclaine', password: 'diehard'},
              {username: 'tomriddle', password: 'voldemort'}])
categories = Category.create!([{title: 'programming'}, {title: 'design'}, {title: 'other'}])
tests = Test.create!([{title: 'Ruby', level: 1, category_id: categories[0].id},
              {title: 'Rails', level: 2, category_id: categories[0].id},
              {title: 'Fortran', level: 3, category_id: categories[0].id},
              {title: 'Photoshop', level: 1, category_id: categories[1].id},
              {title: 'Coloring', level: 2, category_id: categories[1].id},
              {title: 'Cleaning', level: 0, category_id: categories[2].id}])
questions = Question.create!([{body: 'Which of following is current version of Ruby?', test_id: tests[0].id},
                  {body: 'How to create an Array?', test_id: tests[0].id},
                  {body: 'What is Rails', test_id: tests[1].id},
                  {body: 'What Ruby on Rails has in common with railsroad', test_id: tests[1].id},
                  {body: 'What does it mean FORTRAN', test_id: tests[2].id},
                  {body: 'What is the main purpose of PS?', test_id: tests[3].id},
                  {body: 'What studio develop photoshop?', test_id: tests[3].id},
                  {body: 'What color match with white?', test_id: tests[4].id},
                  {body: 'You will clean toilet with:', test_id: tests[5].id}])
answers = Answer.create!([{body: '2.7.0', correct: true, question_id: questions[0].id},
                {body: '2020 Corona Edition', correct: false, question_id: questions[0].id},
                {body: '3 - Wild Hunt', correct: false, question_id: questions[0].id},
                {body: 'By using literal []', correct: true, question_id: questions[1].id},
                {body: 'Ask politely', correct: false, question_id: questions[1].id},
                {body: 'Entering "$ create the array"', correct: false, question_id: questions[1].id},
                {body: 'Framework', correct: true, question_id: questions[2].id},
                {body: 'Hard work', correct: false, question_id: questions[2].id},
                {body: 'hard rock', correct: false, question_id: questions[2].id},
                {body: 'Rails', correct: false, question_id: questions[3].id},
                {body: 'Nothing', correct: true, question_id: questions[3].id},
                {body: 'Formula Translating System', correct: true, question_id: questions[4].id},
                {body: 'Name of mamont from Ice Age', correct: false, question_id: questions[4].id},
                {body: 'Upcoming Fortnite 2', correct: false, question_id: questions[5].id},
                {body: 'Graphic design', correct: false, question_id: questions[5].id},
                {body: 'Ramoving zits', correct: true, question_id: questions[5].id},
                {body: 'XX century Fox', correct: false, question_id: questions[6].id},
                {body: 'Macromedia', correct: false, question_id: questions[6].id},
                {body: 'Adobe', correct: true, question_id: questions[6].id},
                {body: 'Blue', correct: false, question_id: questions[7].id},
                {body: 'Red', correct: false, question_id: questions[7].id},
                {body: 'Every color', correct: true, question_id: questions[7].id},
                {body: 'Brush', correct: true, question_id: questions[8].id},
                {body: 'Rag', correct: false, question_id: questions[8].id},
                {body: 'Toothbrush', correct: false, question_id: questions[8].id}])
results = Result.create!([{user_id: 1, test_id: 1},
                {user_id: 1, test_id: 2},
                {user_id: 1, test_id: 3},
                {user_id: 1, test_id: 4},
                {user_id: 1, test_id: 5},
                {user_id: 1, test_id: 6},
                {user_id: 2, test_id: 2},
                {user_id: 2, test_id: 3},
                {user_id: 2, test_id: 6}])































