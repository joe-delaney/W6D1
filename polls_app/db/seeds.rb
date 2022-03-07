# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

ActiveRecord::Base.transaction do
  User.destroy_all
  Poll.destroy_all
  Question.destroy_all
  AnswerChoice.destroy_all
  Response.destroy_all

  u1 = User.create!(username: 'Tony Stark')
  u2 = User.create!(username: 'Steve Rogers')

  p1 = Poll.create!(title: 'Avengers Poll', author: u1)

  q1 = Question.create!(text: 'Who is the strongest Avenger?', poll: p1)
  ac1 = AnswerChoice.create!(text: 'Thor', question: q1)
  ac2 = AnswerChoice.create!(text: 'Wanda', question: q1)
  ac3 = AnswerChoice.create!(text: 'Hulk', question: q1)

  q2 = Question.create!(text: 'Which movie is the best?', poll: p1)
  ac4 = AnswerChoice.create!(text: 'Avengers: Infinity War', question: q2)
  ac5 = AnswerChoice.create!(text: 'Black Panther', question: q2)
  ac6 = AnswerChoice.create!(text: 'Spiderman: No Way Home', question: q2)

  r1 = Response.create!(
    respondent: u2,
    answer_choice: ac3
  )
  r2 = Response.create!(
    respondent: u2,
    answer_choice: ac4
  )
end
