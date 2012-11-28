# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)
org1 = Organization.create!(:name => "Flatiron School", :subdomain => "flatiron", :invite_code => "asdf")
org2 = Organization.create!(:name => "General Assembly", :subdomain => "ga", :invite_code => "asdf")
org0 = Organization.create!(:name => "Admin", :subdomain => "admin")

user0 = User.create!(:name => "Tim Tebow", :email => "tim.tebow@flatironschool.com", :password => "fdsa", :password_confirmation => "fdsa", :role => "superuser", :organization_id => org0.id)
user1 = User.create!(:name => "Avi Flombaum", :email => "avi@flatironschool.com", :password => "asdf", :password_confirmation => "asdf", :role => "Admin", :organization_id => org1.id)

user2 = User.create!(:name => "David Baker", :email => "david.baker@flatironschool.com", :password => "asdf", :password_confirmation => "asdf", :role => "Student", :organization_id => org1.id)
user3 = User.create!(:name => "Corinna Brock", :email => "corinna.brock@flatironschool.com", :password => "asdf", :password_confirmation => "asdf", :role => "Student", :organization_id => org1.id)
user4 = User.create!(:name => "Stephen Chen", :email => "stephen.chen@flatironschool.com", :password => "asdf", :password_confirmation => "asdf", :role => "Student", :organization_id => org1.id)
user5 = User.create!(:name => "Kevin Curtin", :email => "kevin.curtin@flatironschool.com", :password => "asdf", :password_confirmation => "asdf", :role => "Student", :organization_id => org1.id)
user6 = User.create!(:name => "Joseph DeVenuta", :email => "joseph.devenuta@flatironschool.com", :password => "asdf", :password_confirmation => "asdf", :role => "Student", :organization_id => org1.id)

user7 = User.create!(:name => "Rex Feng", :email => "rex.feng@flatironschool.com", :password => "asdf", :password_confirmation => "asdf", :role => "Student", :organization_id => org1.id)
user8 = User.create!(:name => "Adam Jonas", :email => "adam.jonas@flatironschool.com", :password => "asdf", :password_confirmation => "asdf", :role => "Student", :organization_id => org1.id)
user9 = User.create!(:name => "Akiva Leeder", :email => "akiva.leeder@flatironschool.com", :password => "asdf", :password_confirmation => "asdf", :role => "Student", :organization_id => org1.id)
user10 = User.create!(:name => "Kevin McNamee", :email => "kevin.mcnamee@flatironschool.com", :password => "asdf", :password_confirmation => "asdf", :role => "Student", :organization_id => org1.id)
user11 = User.create!(:name => "Jack Nolan", :email => "jack.nolan@flatironschool.com", :password => "asdf", :password_confirmation => "asdf", :role => "Student", :organization_id => org1.id)

user12 = User.create!(:name => "Li Ouyang", :email => "li.ouyang@flatironschool.com", :password => "asdf", :password_confirmation => "asdf", :role => "Student", :organization_id => org1.id)
user13 = User.create!(:name => "Josh Rowley", :email => "josh.rowley@flatironschool.com", :password => "asdf", :password_confirmation => "asdf", :role => "Student", :organization_id => org1.id)
user14 = User.create!(:name => "Matt Salerno", :email => "matt.salerno@flatironschool.com", :password => "asdf", :password_confirmation => "asdf", :role => "Student", :organization_id => org1.id)
user15 = User.create!(:name => "Aaron Streiter", :email => "aaron.streiter@flatironschool.com", :password => "asdf", :password_confirmation => "asdf", :role => "Student", :organization_id => org1.id)
user16 = User.create!(:name => "Nikhil Thomas", :email => "nikhil.thomas@flatironschool.com", :password => "asdf", :password_confirmation => "asdf", :role => "Student", :organization_id => org1.id)

user17 = User.create!(:name => "James Vanneman", :email => "james.vanneman@flatironschool.com", :password => "asdf", :password_confirmation => "asdf", :role => "Student", :organization_id => org1.id)
user18 = User.create!(:name => "Ericka Ward", :email => "ericka.ward@flatironschool.com", :password => "asdf", :password_confirmation => "asdf", :role => "Student", :organization_id => org1.id)
user19 = User.create!(:name => "Brad Wheel", :email => "brad.wheel@flatironschool.com", :password => "asdf", :password_confirmation => "asdf", :role => "Student", :organization_id => org1.id)
user20 = User.create!(:name => "Jenya Zueva", :email => "jenya.zueva@flatironschool.com", :password => "asdf", :password_confirmation => "asdf", :role => "Student", :organization_id => org1.id)

user21 = User.create!(:name => "Bob Zueva", :email => "bob@generalassembly.com", :password => "asdf", :password_confirmation => "asdf", :role => "Student", :organization_id => org2.id)
user22 = User.create!(:name => "Jack Zueva", :email => "jack@generalassembly.com", :password => "asdf", :password_confirmation => "asdf", :role => "Student", :organization_id => org2.id)


quiz1 = Quiz.create!(:name => "School",:description => "Friday quiz", :is_published => true, :passing_grade => 50, :organization_id => org1.id)
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

quiz2 = Quiz.create!(:name => "NYC Landmarks", :description => "Stuff to see around town", :is_published => false, :passing_grade => 50, :organization_id => org1.id)
question4 = quiz2.questions.build :name => "Where is columbus circle?", :user_id => user4.id
choice10 = question4.choices.build :name => "South St Seaport"
choice11 = question4.choices.build :name => "UES"
choice12 = question4.choices.build :name => "59th St", :is_correct => true
question4.save

quiz3 = Quiz.create!(:name => "General Assembly",:description => "Friday quiz", :is_published => true, :passing_grade => 50, :organization_id => org2.id)
question5 = quiz3.questions.build :name => "Who is the dean?", :user_id => user1.id, :selected => true
choice13 = question5.choices.build :name => "Ari"
choice14 = question5.choices.build :name => "Avi", :is_correct => true
choice15 = question5.choices.build :name => "Aziz"
question5.save

question6 = quiz3.questions.build :name => "Where is the school located?", :user_id => user2.id, :selected => true
choice16 = question6.choices.build :name => "Hawaii"
choice17 = question6.choices.build :name => "NYC", :is_correct => true
choice18 = question6.choices.build :name => "Canada"
question6.save

question7 = quiz3.questions.build :name => "When can I have popcorn?", :user_id => user3.id, :selected => true
choice19 = question7.choices.build :name => "I don't eat popcorn."
choice20 = question7.choices.build :name => "Breakfast?"
choice21 = question7.choices.build :name => "I'm eating popcorn right now.", :is_correct => true
question7.save

quiz4 = Quiz.create!(:name => "General Assembly NYC Landmarks", :description => "Stuff to see around town", :is_published => false, :passing_grade => 50, :organization_id => org2.id)
question8 = quiz2.questions.build :name => "Where is columbus circle?", :user_id => user4.id
choice22 = question8.choices.build :name => "South St Seaport"
choice23 = question8.choices.build :name => "UES"
choice24 = question8.choices.build :name => "59th St", :is_correct => true
question8.save
