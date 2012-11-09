# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)
quiz1 = Quiz.create(:name => "First Quiz",:description => "this is the first quiz", :is_published => true)
question1 = Question.create(:name => "What color is the sky?", :quiz_id => quiz1.id)
choice1 = Choice.create(:name => "Blue", :question_id => question1.id)
choice2 = Choice.create(:name => "Black", :question_id => question1.id)
choice3 = Choice.create(:name => "Red", :question_id => question1.id)
question2 = Question.create(:name => "What is your name?", :quiz_id => quiz1.id)
choice4 = Choice.create(:name => "Rex", :question_id => question2.id)
choice5 = Choice.create(:name => "Stephen", :question_id => question2.id)
choice6 = Choice.create(:name => "Nikhil", :question_id => question2.id)
question3 = Question.create(:name => "What is your age?", :quiz_id => quiz1.id)
choice7 = Choice.create(:name => "18", :question_id => question3.id)
choice8 = Choice.create(:name => "50", :question_id => question3.id)
choice9 = Choice.create(:name => "25", :question_id => question3.id)
quiz2 = Quiz.create(:name => "Second Quiz",:description => "this is the second quiz", :is_published => false)