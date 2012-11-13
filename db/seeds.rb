# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)
quiz1 = Quiz.create!(:name => "First Quiz",:description => "this is the first quiz", :is_published => true)
question1 = quiz1.questions.create! :name => "What color is the sky?"
choice1 = question1.choices.create! :name => "Blue"
choice2 = question1.choices.create! :name => "Black"
choice3 = question1.choices.create! :name => "Red"

question2 = quiz1.questions.create! :name => "What is your name?"
choice4 = question2.choices.create! :name => "Rex"
choice5 = question2.choices.create! :name => "Stephen"
choice6 = question2.choices.create! :name => "Nikhil"

question3 = quiz1.questions.create! :name => "What is your age?"
choice7 = question3.choices.create! :name => "18"
choice8 = question3.choices.create! :name => "50"
choice9 = question3.choices.create! :name => "25"

quiz2 = Quiz.create!(:name => "Second Quiz", :description => "this is the second quiz", :is_published => false)
question4 = quiz2.questions.create! :name => "What is your problem?"
choice10 = question4.choices.create! :name => "Array problem"

user1 = User.create!(:name => "Avi Flombaum", :email => "avi.flombaum@flatironschool.com", :password => "asdf", :password_confirmation => "asdf", :role => "Admin")
user2 = User.create!(:name => "Akiva Leeder", :email => "akiva.leeder@flatironschool.com", :password => "asdf", :password_confirmation => "asdf", :role => "Student")
user3 = User.create!(:name => "Nikhil Thomas", :email => "nikhil.thomas@flatironschool.com", :password => "asdf", :password_confirmation => "asdf", :role => "Student")
user4 = User.create!(:name => "Stephen Chen", :email => "stephen.chen@flatironschool.com", :password => "asdf", :password_confirmation => "asdf", :role => "Student")
user5 = User.create!(:name => "Rex Feng", :email => "rex.feng@flatironschool.com", :password => "asdf", :password_confirmation => "asdf", :role => "Student")