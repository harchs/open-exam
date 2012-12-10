# This file should contain all the record creation needed to seed the database with its default values.
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)


org0 = Organization.create!(:name => "Admin", :subdomain => "admin")
user0 = User.create!(:name => "Admin", :email => "admin@example.com", :password => "fdsa", :password_confirmation => "fdsa", :role => "superuser", :organization_id => org0.id)

org1 = Organization.create!(:name => "Test Data", :subdomain => "test", :invite_code => "asdf")
user1 = User.create!(:name => "Teacher", :email => "teacher@example.com", :password => "asdf", :password_confirmation => "asdf", :role => "Admin", :organization_id => org1.id)
user2 = User.create!(:name => "Student One", :email => "student.one@example.com", :password => "asdf", :password_confirmation => "asdf", :role => "Student", :organization_id => org1.id)
user3 = User.create!(:name => "Student Two", :email => "student.two@example.com", :password => "asdf", :password_confirmation => "asdf", :role => "Student", :organization_id => org1.id)


quiz = Quiz.create!(:name => "New York City Trivia",:description => "How well do you know this city?", :is_published => true, :passing_grade => 50, :organization_id => org1.id)

question1 = quiz.questions.build :name => "How many miles of subway track does NYC have?", :user_id => user1.id, :selected => true
choice1 = question1006.choices.build :name => "453"
choice2 = question1006.choices.build :name => "722", :is_correct => true
choice3 = question1006.choices.build :name => "861"
choice4 = question1006.choices.build :name => "672"
question1.save

question2 = quiz.questions.build :name => "Prior to the Nets, what was the last professional Brooklyn sports team?", :user_id => user2.id, :selected => true
choice5 = question1007.choices.build :name => "Cyclones"
choice6 = question1007.choices.build :name => "Dodgers", :is_correct => true
choice7 = question1007.choices.build :name => "Giants"
choice8 = question1007.choices.build :name => "Islanders"
question2.save

question3 = quiz.questions.build :name => "Who designed Central Park?", :user_id => user3.id, :selected => true
choice9 = question1008.choices.build :name => "Robert Moses"
choice10 = question1008.choices.build :name => "Frederick Olmsted", :is_correct => true
choice11 = question1008.choices.build :name => "Fletcher Steel"
choice12 = question1008.choices.build :name => "Andrew Downing"
question3.save

question4 = quiz.questions.build :name => "Where is the Fulton Fish Market?", :user_id => user2.id, :selected => true
choice13 = question1009.choices.build :name => "South Street Seaport"
choice14 = question1009.choices.build :name => "Coney Island"
choice15 = question1009.choices.build :name => "Battery Park City"
choice16 = question1009.choices.build :name => "Hunts Point", :is_correct => true
question4.save

question5 = quiz.questions.build :name => "Where is Grant Tomb located?", :user_id => user3.id, :selected => false
choice17 = question10010.choices.build :name => "Grant Park"
choice18 = question10010.choices.build :name => "Riverside Park", :is_correct => true
choice19 = question10010.choices.build :name => "Central Park"
choice20 = question10010.choices.build :name => "Madison Square Park"
question5.save


user_quiz1 = UserQuiz.create(:quiz_id => 1, :user_id => 2, :num_correct => 3, :total_questions => 5, :status => "Completed")
uqa1 =  Answer.create(:choice_id => 2, :name => "722", :question_id => 1, :quiz_id => 2, :user_id => 2)
uqa2 =  Answer.create(:choice_id => 5, :name => "Cyclones", :question_id => 2, :quiz_id => 2, :user_id => 2)
uqa3 =  Answer.create(:choice_id => 10, :name => "Frederick Olmsted", :question_id => 3, :quiz_id => 2, :user_id => 2)
uqa4 =  Answer.create(:choice_id => 15, :name => "Battery Park City", :question_id => 4, :quiz_id => 2, :user_id => 2)
uqa5 =  Answer.create(:choice_id => 18, :name => "Riverside Park", :question_id => 5, :quiz_id => 2, :user_id => 2)
