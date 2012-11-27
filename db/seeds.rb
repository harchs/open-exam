# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)
user1 = User.create!(:name => "Avi Flombaum", :email => "avi@flatironschool.com", :password => "asdf", :password_confirmation => "asdf", :role => "Admin")

user2 = User.create!(:name => "David Baker", :email => "david.baker@flatironschool.com", :password => "asdf", :password_confirmation => "asdf", :role => "Student")
user3 = User.create!(:name => "Corinna Brock", :email => "corinna.brock@flatironschool.com", :password => "asdf", :password_confirmation => "asdf", :role => "Student")
user4 = User.create!(:name => "Stephen Chen", :email => "stephen.chen@flatironschool.com", :password => "asdf", :password_confirmation => "asdf", :role => "Student")
user5 = User.create!(:name => "Kevin Curtin", :email => "kevin.curtin@flatironschool.com", :password => "asdf", :password_confirmation => "asdf", :role => "Student")
user6 = User.create!(:name => "Joseph DeVenuta", :email => "joseph.devenuta@flatironschool.com", :password => "asdf", :password_confirmation => "asdf", :role => "Student")

user7 = User.create!(:name => "Rex Feng", :email => "rex.feng@flatironschool.com", :password => "asdf", :password_confirmation => "asdf", :role => "Student")
user8 = User.create!(:name => "Adam Jonas", :email => "adam.jonas@flatironschool.com", :password => "asdf", :password_confirmation => "asdf", :role => "Student")
user9 = User.create!(:name => "Akiva Leeder", :email => "akiva.leeder@flatironschool.com", :password => "asdf", :password_confirmation => "asdf", :role => "Student")
user10 = User.create!(:name => "Kevin McNamee", :email => "kevin.mcnamee@flatironschool.com", :password => "asdf", :password_confirmation => "asdf", :role => "Student")
user11 = User.create!(:name => "Jack Nolan", :email => "jack.nolan@flatironschool.com", :password => "asdf", :password_confirmation => "asdf", :role => "Student")

user12 = User.create!(:name => "Li Ouyang", :email => "li.ouyang@flatironschool.com", :password => "asdf", :password_confirmation => "asdf", :role => "Student")
user13 = User.create!(:name => "Josh Rowley", :email => "josh.rowley@flatironschool.com", :password => "asdf", :password_confirmation => "asdf", :role => "Student")
user14 = User.create!(:name => "Matt Salerno", :email => "matt.salerno@flatironschool.com", :password => "asdf", :password_confirmation => "asdf", :role => "Student")
user15 = User.create!(:name => "Aaron Streiter", :email => "aaron.streiter@flatironschool.com", :password => "asdf", :password_confirmation => "asdf", :role => "Student")
user16 = User.create!(:name => "Nikhil Thomas", :email => "nikhil.thomas@flatironschool.com", :password => "asdf", :password_confirmation => "asdf", :role => "Student")

user17 = User.create!(:name => "James Vanneman", :email => "james.vanneman@flatironschool.com", :password => "asdf", :password_confirmation => "asdf", :role => "Student")
user18 = User.create!(:name => "Ericka Ward", :email => "ericka.ward@flatironschool.com", :password => "asdf", :password_confirmation => "asdf", :role => "Student")
user19 = User.create!(:name => "Brad Wheel", :email => "brad.wheel@flatironschool.com", :password => "asdf", :password_confirmation => "asdf", :role => "Student")
user20 = User.create!(:name => "Jenya Zueva", :email => "jenya.zueva@flatironschool.com", :password => "asdf", :password_confirmation => "asdf", :role => "Student")



quiz1 = Quiz.create!(:name => "School",:description => "Friday quiz", :is_published => true, :passing_grade => 50)
question1 = quiz1.questions.build :name => "Who is the dean?", :user_id => user1.id, :selected => true
choice1 = question1.choices.build :name => "Ari"
choice2 = question1.choices.build :name => "Avi", :is_correct => true
choice3 = question1.choices.build :name => "Aziz"
question1.save

question2 = quiz1.questions.build :name => "Where is the school located?", :user_id => user2.id, :selected => true
choice4 = question2.choices.build :name => "Hawaii"
choice5 = question2.choices.build :name => "NYC", :is_correct => true
choice6 = question2.choices.build :name => "Canada"
question2.save

question3 = quiz1.questions.build :name => "When can I have popcorn?", :user_id => user3.id, :selected => true
choice7 = question3.choices.build :name => "I don't eat popcorn."
choice8 = question3.choices.build :name => "Breakfast?"
choice9 = question3.choices.build :name => "I'm eating popcorn right now.", :is_correct => true
question3.save

quiz2 = Quiz.create!(:name => "NYC Landmarks", :description => "Stuff to see around town", :is_published => false, :passing_grade => 50)
question4 = quiz2.questions.build :name => "Where is columbus circle?", :user_id => user4.id
choice10 = question4.choices.build :name => "South St Seaport"
choice11 = question4.choices.build :name => "UES"
choice12 = question4.choices.build :name => "59th St", :is_correct => true
question4.save