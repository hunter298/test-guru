# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
User.create!([{username: 'mcclaine', password: 'diehard'},
              {username: 'tomriddle', password: 'voldemort'}])
Category.create!([{title: 'programming'}, {title: 'design'}, {title: 'other'}])
Test.create!([{title: 'Ruby', level: 1, category_id: Category.find_by(title: 'programming').id},
              {title: 'Rails', level: 2, category_id: Category.find_by(title: 'programming').id},
              {title: 'Fortran', level: 3, category_id: Category.find_by(title: 'programming').id},
              {title: 'Photoshop', level: 1, category_id: Category.find_by(title: 'design').id},
              {title: 'Coloring', level: 2, category_id: Category.find_by(title: 'design').id},
              {title: 'Cleaning', level: 0, category_id: Category.find_by(title: 'other').id}])
Question.create!([{body: 'Which of following is current version of Ruby?', test_id: Test.find_by(title: 'Ruby').id},
                  {body: 'How to create an Array?', test_id: Test.find_by(title: 'Ruby').id},
                  {body: 'What is Rails', test_id: Test.find_by(title: 'Rails').id},
                  {body: 'What Ruby on Rails has in common with railsroad', test_id: Test.find_by(title: 'Rails').id},
                  {body: 'What does it mean FORTRAN', test_id: Test.find_by(title: 'Fortran').id},
                  {body: 'What is the main purpose of PS?', test_id: Test.find_by(title: 'Photoshop').id},
                  {body: 'What studio develop photoshop?', test_id: Test.find_by(title: 'Photoshop').id},
                  {body: 'What color match with white?', test_id: Test.find_by(title: 'Coloring').id},
                  {body: 'You will clean toilet with:', test_id: Test.find_by(title: 'Cleaning').id}])
Answer.create!([{body: '2.7.0', correct: true, question_id: Question.find_by("body LIKE '%version of Ruby?'").id},
                {body: '2020 Corona Edition', correct: false, question_id: Question.find_by("body LIKE '%version of Ruby?'").id},
                {body: '3 - Wild Hunt', correct: false, question_id: Question.find_by("body LIKE '%version of Ruby?'").id},
                {body: 'By using literal []', correct: true, question_id: Question.find_by("body LIKE '%create an Array?'").id},
                {body: 'Ask politely', correct: false, question_id: Question.find_by("body LIKE '%create an Array?'").id},
                {body: 'Entering "$ create the array"', correct: false, question_id: Question.find_by("body LIKE '%create an Array?'").id},
                {body: 'Framework', correct: true, question_id: Question.find_by("body LIKE '%is Rails'").id},
                {body: 'Hard work', correct: false, question_id: Question.find_by("body LIKE '%is Rails'").id},
                {body: 'hard rock', correct: false, question_id: Question.find_by("body LIKE '%is Rails'").id},
                {body: 'Rails', correct: false, question_id: Question.find_by("body LIKE '%with railsroad'").id},
                {body: 'Nothing', correct: true, question_id: Question.find_by("body LIKE '%with railsroad'").id},
                {body: 'Formula Translating System', correct: true, question_id: Question.find_by("body LIKE '%mean FORTRAN'").id},
                {body: 'Name of mamont from Ice Age', correct: false, question_id: Question.find_by("body LIKE '%mean FORTRAN'").id},
                {body: 'Upcoming Fortnite 2', correct: false, question_id: Question.find_by("body LIKE '%mean FORTRAN'").id},
                {body: 'Graphic design', correct: false, question_id: Question.find_by("body LIKE '%purpose of PS?'").id},
                {body: 'Ramoving zits', correct: true, question_id: Question.find_by("body LIKE '%purpose of PS?'").id},
                {body: 'XX century Fox', correct: false, question_id: Question.find_by("body LIKE '%develop photoshop?'").id},
                {body: 'Macromedia', correct: false, question_id: Question.find_by("body LIKE '%develop photoshop?'").id},
                {body: 'Adobe', correct: true, question_id: Question.find_by("body LIKE '%develop photoshop?'").id},
                {body: 'Blue', correct: false, question_id: Question.find_by("body LIKE '%with white?'").id},
                {body: 'Red', correct: false, question_id: Question.find_by("body LIKE '%with white?'").id},
                {body: 'Every color', correct: true, question_id: Question.find_by("body LIKE '%with white?'").id},
                {body: 'Brush', correct: true, question_id: Question.find_by("body LIKE '%toilet with:'").id},
                {body: 'Rag', correct: false, question_id: Question.find_by("body LIKE '%toilet with:'").id},
                {body: 'Toothbrush', correct: false, question_id: Question.find_by("body LIKE '%toilet with:'").id}])
Result.create!([{user_id: 1, test_id: 1},
                {user_id: 1, test_id: 2},
                {user_id: 1, test_id: 3},
                {user_id: 1, test_id: 4},
                {user_id: 1, test_id: 5},
                {user_id: 1, test_id: 6},
                {user_id: 2, test_id: 2},
                {user_id: 2, test_id: 3},
                {user_id: 2, test_id: 6}])































