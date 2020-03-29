# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
users = User.create([{username: 'mcclaine', password: 'diehard'},
                     {username: 'tomriddle', password: 'voldemort'}])
categories = Category.create([{title: 'programming'}, {title: 'design'}, {title: 'other'}])
tests = Test.create([{title: 'Ruby', level: 1, category_id: categories.where(title: 'programming').id, user_id: users.where(username: 'mcclaine').id},
             {title: 'Rails', level: 2, category_id: categories.where(title: 'programming').id, user_id: users.where(username: 'tomriddle').id},
             {title: 'Fortran', level: 3, category_id: categories.where(title: 'programming').id, user_id: users.where(username: 'tomriddle').id},
             {title: 'Photoshop', level: 1, category_id: categories.where(title: 'design').id, user_id: users.where(username: 'tomriddle').id},
             {title: 'Coloring', level: 2, category_id: categories.where(title: 'design').id, user_id: users.where(username: 'tomriddle').id},
             {title: 'Cleaning', level: 0, category_id: categories.where(title: 'other').id, user_id: users.where(username: 'mcclaine').id},
             {title: 'Cooking', level: 4, category_id: categories.where(title: 'other').id, user_id: sers.where(username: 'tomriddle').id},])
questions = Question.create([{body: 'Which of following is current version of Ruby?', test_id: tests.where(title: 'Ruby').id},
                             {body: 'How to create an Array?', test_id: tests.where(title: 'Ruby').id},
                             {body: 'What is Rails', test_id: tests.where(title: 'Rails').id},
                             {body: 'What Ruby on Rails has in common with railsroad', test_id: tests.where(title: 'Rails').id},
                             {body: 'What does it mean FORTRAN', test_id: tests.where(title: 'Fortran').id},
                             {body: 'What is the main purpose of PS?', test_id: tests.where(title: 'Photoshop').id},
                             {body: 'What studio develop photoshop?', test_id: tests.where(title: 'Photoshop').id},
                             {body: 'What color match with white?', test_id: tests.where(title: 'Coloring').id},
                             {body: 'You will clean toilet with:', test_id: tests.where(title: 'Cleaning').id},
                             {body: 'Food must be:', test_id: tests.where(title: 'Cooking').id},])
answers = Answer.create([{body: '2.7.0', correct: true, question_id: questions.where("body LIKE '%version of Ruby?'").id},
                         {body: '2020 Corona Edition', correct: false, question_id: questions.where("body LIKE '%version of Ruby?'").id},
                         {body: '3 - Wild Hunt', correct: false, question_id: questions.where("body LIKE '%version of Ruby?'").id},
                         {body: 'By using literal []', correct: true, question_id: questions.where("body LIKE '%create an Array?'").id},
                         {body: 'Ask politely', correct: false, question_id: questions.where("body LIKE '%create an Array?'").id},
                         {body: 'Entering "$ create the array"', correct: false, question_id: questions.where("body LIKE '%create an Array?'").id},
                         {body: 'Framework', correct: true, question_id: questions.where("body LIKE '%is Rails'").id},
                         {body: 'Hard work', correct: false, question_id: questions.where("body LIKE '%is Rails'").id},
                         {body: 'hard rock', correct: false, question_id: questions.where("body LIKE '%is Rails'").id},
                         {body: 'Rails', correct: false, question_id: questions.where("body LIKE '%with railsroad'").id},
                         {body: 'Nothing', correct: true, question_id: questions.where("body LIKE '%with railsroad'").id},
                         {body: 'Formula Translating System', correct: true, question_id: questions.where("body LIKE '%mean FORTRAN'").id},
                         {body: 'Name of mamont from Ice Age', correct: false, question_id: questions.where("body LIKE '%mean FORTRAN'").id},
                         {body: 'Upcoming Fortnite 2', correct: false, question_id: questions.where("body LIKE '%mean FORTRAN'").id},
                         {body: 'Graphic design', correct: false, question_id: questions.where("body LIKE '%purpose of PS?'").id},
                         {body: 'Ramoving zits', correct: true, question_id: questions.where("body LIKE '%purpose of PS?'").id},
                         {body: 'XX century Fox', correct: false, question_id: questions.where("body LIKE '%develop photoshop?'").id},
                         {body: 'Macromedia', correct: false, question_id: questions.where("body LIKE '%develop photoshop?'").id},
                         {body: 'Adobe', correct: true, question_id: questions.where("body LIKE '%develop photoshop?'").id},
                         {body: 'Blue', correct: false, question_id: questions.where("body LIKE '%with white?'").id},
                         {body: 'Red', correct: false, question_id: questions.where("body LIKE '%with white?'").id},
                         {body: 'Every color', correct: true, question_id: questions.where("body LIKE '%with white?'").id},
                         {body: 'Brush', correct: true, question_id: questions.where("body LIKE '%toilet with:'").id},
                         {body: 'Rag', correct: false, question_id: questions.where("body LIKE '%toilet with:'").id},
                         {body: 'Toothbrush', correct: false, question_id: questions.where("body LIKE '%toilet with:'").id},
                         {body: 'Tasty', correct: true, question_id: questions.where("body LIKE '%must be:'").id},
                         {body: 'Nasty', correct: false, question_id: questions.where("body LIKE '%must be:'").id},
                         {body: 'Busty', correct: false, question_id: questions.where("body LIKE '%must be:'").id}])
































