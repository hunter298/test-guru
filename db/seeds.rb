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
tests = Test.create!([{title: 'Ruby', level: 1, category: categories[0], creator: users[0]},
              {title: 'Rails', level: 2, category: categories[0], creator: users[0]},
              {title: 'Fortran', level: 3, category: categories[0], creator: users[0]},
              {title: 'Photoshop', level: 1, category: categories[1], creator: users[1]},
              {title: 'Coloring', level: 2, category: categories[1], creator: users[1]},
              {title: 'Cleaning', level: 0, category: categories[2], creator: users[1]}])
questions = Question.create!([{body: 'Which of following is current version of Ruby?', test: tests[0]},
                              {body: 'How to create an Array?', test: tests[0]},
                              {body: 'What is Rails', test: tests[1]},
                              {body: 'What Ruby on Rails has in common with railsroad', test: tests[1]},
                              {body: 'What does it mean FORTRAN', test: tests[2]},
                              {body: 'What is the main purpose of PS?', test: tests[3]},
                              {body: 'What studio develop photoshop?', test: tests[3]},
                              {body: 'What color match with white?', test: tests[4]},
                              {body: 'You will clean toilet with:', test: tests[5]}])
answers = Answer.create!([{body: '2.7.0', correct: true, question: questions[0]},
                          {body: '2020 Corona Edition', correct: false, question: questions[0]},
                          {body: '3 - Wild Hunt', correct: false, question: questions[0]},
                          {body: 'By using literal []', correct: true, question: questions[1]},
                          {body: 'Ask politely', correct: false, question: questions[1]},
                          {body: 'Entering "$ create the array"', correct: false, question: questions[1]},
                          {body: 'Framework', correct: true, question: questions[2]},
                          {body: 'Hard work', correct: false, question: questions[2]},
                          {body: 'hard rock', correct: false, question: questions[2]},
                          {body: 'Rails', correct: false, question: questions[3]},
                          {body: 'Nothing', correct: true, question: questions[3]},
                          {body: 'Formula Translating System', correct: true, question: questions[4]},
                          {body: 'Name of mamont from Ice Age', correct: false, question: questions[4]},
                          {body: 'Upcoming Fortnite 2', correct: false, question: questions[5]},
                          {body: 'Graphic design', correct: false, question: questions[5]},
                          {body: 'Ramoving zits', correct: true, question: questions[5]},
                          {body: 'XX century Fox', correct: false, question: questions[6]},
                          {body: 'Macromedia', correct: false, question: questions[6]},
                          {body: 'Adobe', correct: true, question: questions[6]},
                          {body: 'Blue', correct: false, question: questions[7]},
                          {body: 'Red', correct: false, question: questions[7]},
                          {body: 'Every color', correct: true, question: questions[7]},
                          {body: 'Brush', correct: true, question: questions[8]},
                          {body: 'Rag', correct: false, question: questions[8]},
                          {body: 'Toothbrush', correct: false, question: questions[8]}])
results = Result.create!([{user_id: 1, test_id: 1},
                          {user_id: 1, test_id: 2},
                          {user_id: 1, test_id: 3},
                          {user_id: 1, test_id: 4},
                          {user_id: 1, test_id: 5},
                          {user_id: 1, test_id: 6},
                          {user_id: 2, test_id: 2},
                          {user_id: 2, test_id: 3},
                          {user_id: 2, test_id: 6}])
