# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)
org1 = Organization.create!(:name => "Flatiron School", :subdomain => "flatiron", :invite_code => "asdf")

user10022 = User.create!(:name => "Avi Flombaum", :email => "avi@flatironschool.com", :password => "asdf", :password_confirmation => "asdf", :role => "Admin", :organization_id => org1.id)
user10023 = User.create!(:name => "Adam Enbar", :email => "adam@flatironschool.com", :password => "asdf", :password_confirmation => "asdf", :role => "Admin", :organization_id => org1.id)
user10024 = User.create!(:name => "Ari Rose", :email => "ari@flatironschool.com", :password => "asdf", :password_confirmation => "asdf", :role => "Admin", :organization_id => org1.id)

user1002 = User.create!(:name => "David Baker", :email => "david.baker@flatironschool.com", :password => "asdf", :password_confirmation => "asdf", :role => "Student", :organization_id => org1.id)
user1003 = User.create!(:name => "Corinna Brock", :email => "corinna.brock@flatironschool.com", :password => "asdf", :password_confirmation => "asdf", :role => "Student", :organization_id => org1.id)
user1004 = User.create!(:name => "Stephen Chen", :email => "stephen.chen@flatironschool.com", :password => "asdf", :password_confirmation => "asdf", :role => "Student", :organization_id => org1.id)
user1005 = User.create!(:name => "Kevin Curtin", :email => "kevin.curtin@flatironschool.com", :password => "asdf", :password_confirmation => "asdf", :role => "Student", :organization_id => org1.id)
user1006 = User.create!(:name => "Joseph DeVenuta", :email => "joseph.devenuta@flatironschool.com", :password => "asdf", :password_confirmation => "asdf", :role => "Student", :organization_id => org1.id)

user1007 = User.create!(:name => "Rex Feng", :email => "rex.feng@flatironschool.com", :password => "asdf", :password_confirmation => "asdf", :role => "Student", :organization_id => org1.id)
user1008 = User.create!(:name => "Adam Jonas", :email => "adam.jonas@flatironschool.com", :password => "asdf", :password_confirmation => "asdf", :role => "Student", :organization_id => org1.id)
user1009 = User.create!(:name => "Akiva Leeder", :email => "akiva.leeder@flatironschool.com", :password => "asdf", :password_confirmation => "asdf", :role => "Student", :organization_id => org1.id)
user10010 = User.create!(:name => "Kevin McNamee", :email => "kevin.mcnamee@flatironschool.com", :password => "asdf", :password_confirmation => "asdf", :role => "Student", :organization_id => org1.id)
user10011 = User.create!(:name => "Jack Nolan", :email => "jack.nolan@flatironschool.com", :password => "asdf", :password_confirmation => "asdf", :role => "Student", :organization_id => org1.id)

user10012 = User.create!(:name => "Li Ouyang", :email => "li.ouyang@flatironschool.com", :password => "asdf", :password_confirmation => "asdf", :role => "Student", :organization_id => org1.id)
user10013 = User.create!(:name => "Josh Rowley", :email => "josh.rowley@flatironschool.com", :password => "asdf", :password_confirmation => "asdf", :role => "Student", :organization_id => org1.id)
user10014 = User.create!(:name => "Matt Salerno", :email => "matt.salerno@flatironschool.com", :password => "asdf", :password_confirmation => "asdf", :role => "Student", :organization_id => org1.id)
user10015 = User.create!(:name => "Aaron Streiter", :email => "aaron.streiter@flatironschool.com", :password => "asdf", :password_confirmation => "asdf", :role => "Student", :organization_id => org1.id)
user10016 = User.create!(:name => "Nikhil Thomas", :email => "nikhil.thomas@flatironschool.com", :password => "asdf", :password_confirmation => "asdf", :role => "Student", :organization_id => org1.id)

user10017 = User.create!(:name => "James Vanneman", :email => "james.vanneman@flatironschool.com", :password => "asdf", :password_confirmation => "asdf", :role => "Student", :organization_id => org1.id)
user10018 = User.create!(:name => "Ericka Ward", :email => "ericka.ward@flatironschool.com", :password => "asdf", :password_confirmation => "asdf", :role => "Student", :organization_id => org1.id)
user10019 = User.create!(:name => "Brad Wheel", :email => "brad.wheel@flatironschool.com", :password => "asdf", :password_confirmation => "asdf", :role => "Student", :organization_id => org1.id)
user10020 = User.create!(:name => "Jenya Zueva", :email => "jenya.zueva@flatironschool.com", :password => "asdf", :password_confirmation => "asdf", :role => "Student", :organization_id => org1.id)


quiz1001 = Quiz.create!(:name => "HTML Tags",:description => "HyperText Markup Language", :is_published => true, :passing_grade => 50, :organization_id => org1.id)

question1001 = quiz1001.questions.build :name => "Where does the DTD go?", :user_id => user10022.id, :selected => true
choice1001 = question1001.choices.build :name => "At the top", :is_correct => true
choice1002 = question1001.choices.build :name => "In the Body"
choice1003 = question1001.choices.build :name => "Before the closing HTML tag"
choice1004 = question1001.choices.build :name => "In the Main CSS file"
question1001.save

question1002 = quiz1001.questions.build :name => "What does the <EM> tag do?", :user_id => user10022.id, :selected => true
choice1005 = question1002.choices.build :name => "Adds proper padding and margin"
choice1006 = question1002.choices.build :name => "Creates a blockquote"
choice1007 = question1002.choices.build :name => "Floats the element"
choice1008 = question1002.choices.build :name => "Emphasize the element", :is_correct => true
question1002.save

question1003 = quiz1001.questions.build :name => "Which is the paragraph element?", :user_id => user10022.id, :selected => true
choice1009 = question1003.choices.build :name => "para"
choice10010 = question1003.choices.build :name => "p", :is_correct => true
choice10011 = question1003.choices.build :name => "paragraphs"
choice10012 = question1003.choices.build :name => "pg"
question1003.save

question1004 = quiz1001.questions.build :name => "Which is the image element?", :user_id => user10022.id, :selected => true
choice10013 = question1004.choices.build :name => "img", :is_correct => true
choice10014 = question1004.choices.build :name => "image"
choice10015 = question1004.choices.build :name => "images"
choice10016 = question1004.choices.build :name => "i"
question1004.save

question1005 = quiz1001.questions.build :name => "What is HTML lint?", :user_id => user10022.id, :selected => true
choice10017 = question1005.choices.build :name => "commented out HTML code"
choice10018 = question1005.choices.build :name => "footer text inside the LINT tag"
choice10019 = question1005.choices.build :name => "a way to reuse HTML code"
choice10020 = question1005.choices.build :name => "a tool that checks your HTML", :is_correct => true
question1005.save

quiz1002 = Quiz.create!(:name => "New York City Trivia",:description => "How well do you know this city?", :is_published => true, :passing_grade => 50, :organization_id => org1.id)

question1006 = quiz1002.questions.build :name => "How many miles of subway track does NYC have?", :user_id => user10022.id, :selected => true
choice10021 = question1006.choices.build :name => "453"
choice10022 = question1006.choices.build :name => "722", :is_correct => true
choice10023 = question1006.choices.build :name => "861"
choice10024 = question1006.choices.build :name => "672"
question1006.save

question1007 = quiz1002.questions.build :name => "Prior to the Nets, what was the last professional Brooklyn sports team?", :user_id => user10022.id, :selected => true
choice10025 = question1007.choices.build :name => "Cyclones"
choice10026 = question1007.choices.build :name => "Dodgers", :is_correct => true
choice10027 = question1007.choices.build :name => "Giants"
choice10028 = question1007.choices.build :name => "Islanders"
question1007.save

question1008 = quiz1002.questions.build :name => "Who designed Central Park?", :user_id => user10022.id, :selected => true
choice10029 = question1008.choices.build :name => "Robert Moses"
choice10030 = question1008.choices.build :name => "Frederick Olmsted", :is_correct => true
choice10031 = question1008.choices.build :name => "Fletcher Steel"
choice10032 = question1008.choices.build :name => "Andrew Downing"
question1008.save

question1009 = quiz1002.questions.build :name => "Where is the Fulton Fish Market?", :user_id => user10022.id, :selected => true
choice10033 = question1009.choices.build :name => "South Street Seaport"
choice10034 = question1009.choices.build :name => "Coney Island"
choice10035 = question1009.choices.build :name => "Battery Park City"
choice10036 = question1009.choices.build :name => "Hunts Point", :is_correct => true
question1009.save

question10010 = quiz1002.questions.build :name => "Where is Grant Tomb located?", :user_id => user10022.id, :selected => true
choice10037 = question10010.choices.build :name => "Grant Park"
choice10038 = question10010.choices.build :name => "Riverside Park", :is_correct => true
choice10039 = question10010.choices.build :name => "Central Park"
choice10040 = question10010.choices.build :name => "Madison Square Park"
question10010.save

quiz1003 = Quiz.create!(:name => "Misc Flatiron Trivia",:description => "What goes on in this place", :is_published => true, :passing_grade => 50, :organization_id => org1.id)

question10011 = quiz1003.questions.build :name => "Who is the instructor?", :user_id => user10022.id, :selected => true
choice10041 = question10011.choices.build :name => "Ivy"
choice10042 = question10011.choices.build :name => "Andy"
choice10043 = question10011.choices.build :name => "Alan"
choice10044 = question10011.choices.build :name => "Avi", :is_correct => true
question10011.save

question10012 = quiz1003.questions.build :name => "Where is the classroom located?", :user_id => user10022.id, :selected => true
choice10045 = question10012.choices.build :name => "26th Street", :is_correct => true
choice10046 = question10012.choices.build :name => "Broadway"
choice10047 = question10012.choices.build :name => "Union Square"
choice10048 = question10012.choices.build :name => "29th Street"
question10012.save

question10013 = quiz1003.questions.build :name => "What restaurant is right across the street?", :user_id => user10022.id, :selected => true
choice10049 = question10013.choices.build :name => "Shake Shack"
choice10050 = question10013.choices.build :name => "Hill Country BBQ", :is_correct => true
choice10051 = question10013.choices.build :name => "Melt"
choice10052 = question10013.choices.build :name => "Chipotle"
question10013.save

question10014 = quiz1003.questions.build :name => "What microwavable food does the school have an infinite supply of?", :user_id => user10022.id, :selected => true
choice10053 = question10014.choices.build :name => "Bacon"
choice10054 = question10014.choices.build :name => "Turkey"
choice10055 = question10014.choices.build :name => "Pasta"
choice10056 = question10014.choices.build :name => "Popcorn", :is_correct => true
question10014.save

question10015 = quiz1003.questions.build :name => "When was the Halloween Bash?", :user_id => user10022.id, :selected => true
choice10057 = question10015.choices.build :name => "Sat. Nov 3rd", :is_correct => true
choice10058 = question10015.choices.build :name => "Wed. Oct 31st"
choice10059 = question10015.choices.build :name => "Fri. Nov 2nd"
choice10060 = question10015.choices.build :name => "Sat. Oct 27th"
question10015.save

quiz1004 = Quiz.create!(:name => "Ruby Skills",:description => "How well do you know Ruby?", :is_published => false, :passing_grade => 50, :organization_id => org1.id)

question10016 = quiz1004.questions.build :name => "Which of the following is NOT a method defined on the Array Class?", :user_id => user10022.id, :selected => true
choice10061 = question10016.choices.build :name => "concat"
choice10062 = question10016.choices.build :name => "values_at"
choice10063 = question10016.choices.build :name => "rake", :is_correct => true
choice10064 = question10016.choices.build :name => "last"
question10016.save

question10017 = quiz1004.questions.build :name => "In Ruby, everything is an object.", :user_id => user10022.id, :selected => true
choice10065 = question10017.choices.build :name => "True", :is_correct => true
choice10066 = question10017.choices.build :name => "False"
# choice10067 = question10017.choices.build :name => ""
# choice10068 = question10017.choices.build :name => ""
question10017.save

question10018 = quiz1004.questions.build :name => "Who created Ruby?", :user_id => user10022.id, :selected => true
choice10069 = question10018.choices.build :name => "Matz", :is_correct => true
choice10070 = question10018.choices.build :name => "Kats"
choice10071 = question10018.choices.build :name => "Yard"
choice10072 = question10018.choices.build :name => "Kent"
question10018.save


org0 = Organization.create!(:name => "Admin", :subdomain => "admin")
user0 = User.create!(:name => "Tim Tebow", :email => "tim.tebow@flatironschool.com", :password => "fdsa", :password_confirmation => "fdsa", :role => "superuser", :organization_id => org0.id)



org2 = Organization.create!(:name => "General Assembly", :subdomain => "ga", :invite_code => "asdf")

user20024 = User.create!(:name => "Teacher GeneralAssembly", :email => "teacher@not-really-ga.com", :password => "asdf", :password_confirmation => "asdf", :role => "Admin", :organization_id => org2.id)

user2002 = User.create!(:name => "John GeneralAssembly", :email => "john@not-really-ga.com", :password => "asdf", :password_confirmation => "asdf", :role => "Student", :organization_id => org2.id)
user2003 = User.create!(:name => "Andy GeneralAssembly", :email => "andy@not-really-ga.com", :password => "asdf", :password_confirmation => "asdf", :role => "Student", :organization_id => org2.id)
user2004 = User.create!(:name => "Jessica GeneralAssembly", :email => "jessica@not-really-ga.com", :password => "asdf", :password_confirmation => "asdf", :role => "Student", :organization_id => org2.id)
user2005 = User.create!(:name => "Sarah GeneralAssembly", :email => "sarah@not-really-ga.com", :password => "asdf", :password_confirmation => "asdf", :role => "Student", :organization_id => org2.id)

quiz2001 = Quiz.create!(:name => "GA Food Trivia",:description => "Know your food groups GA", :is_published => true, :passing_grade => 50, :organization_id => org2.id)

question2001 = quiz2001.questions.build :name => "What is a vegetable?", :user_id => user20024.id, :selected => true
choice2001 = question2001.choices.build :name => "Carrots", :is_correct => true
choice2002 = question2001.choices.build :name => "Bacon"
choice2003 = question2001.choices.build :name => "Cookies"
choice2004 = question2001.choices.build :name => "Butter"
question2001.save

question2002 = quiz2001.questions.build :name => "What is edible?", :user_id => user20024.id, :selected => true
choice2005 = question2002.choices.build :name => "Pie", :is_correct => true
choice2006 = question2002.choices.build :name => "Plastic Cup"
choice2007 = question2002.choices.build :name => "Rubber"
choice2008 = question2002.choices.build :name => "Aluminum"
question2002.save

org3 = Organization.create!(:name => "The Simpsons", :subdomain => "demo", :invite_code => "asdf")

user30022 = User.create!(:name => "Homer Simpson", :email => "homer@simpsons.tv", :password => "asdf", :password_confirmation => "asdf", :role => "Admin", :organization_id => org3.id)
user30023 = User.create!(:name => "Marge Simpson", :email => "marge@simpsons.tv", :password => "asdf", :password_confirmation => "asdf", :role => "Admin", :organization_id => org3.id)

user30002 = User.create!(:name => "Bart Simpson", :email => "bart@simpsons.tv", :password => "asdf", :password_confirmation => "asdf", :role => "Student", :organization_id => org3.id)
user30003 = User.create!(:name => "Lisa Simpson", :email => "lisa@simpsons.tv", :password => "asdf", :password_confirmation => "asdf", :role => "Student", :organization_id => org3.id)
user30004 = User.create!(:name => "Maggie Simpson", :email => "maggie@simpsons.tv", :password => "asdf", :password_confirmation => "asdf", :role => "Student", :organization_id => org3.id)
user30005 = User.create!(:name => "Abraham Simpson", :email => "abraham@simpsons.tv", :password => "asdf", :password_confirmation => "asdf", :role => "Student", :organization_id => org3.id)
user30006 = User.create!(:name => "Mona Simpson", :email => "mona@simpsons.tv", :password => "asdf", :password_confirmation => "asdf", :role => "Student", :organization_id => org3.id)
user30007 = User.create!(:name => "Santa's Little Helper", :email => "santa@simpsons.tv", :password => "asdf", :password_confirmation => "asdf", :role => "Student", :organization_id => org3.id)
user30008 = User.create!(:name => "Snowball", :email => "snowball@simpsons.tv", :password => "asdf", :password_confirmation => "asdf", :role => "Student", :organization_id => org3.id)

quiz30001 = Quiz.create!(:name => "Simpsons Trivia",:description => "How well do you know Springfield?", :is_published => true, :passing_grade => 50, :organization_id => org3.id)

question3001 = quiz30001.questions.build :name => "What is Homer's middle name?", :user_id => user30022.id, :selected => true
choice3001 = question3001.choices.build :name => "Johnson"
choice3002 = question3001.choices.build :name => "Jay", :is_correct => true
choice3003 = question3001.choices.build :name => "Jasper"
choice3004 = question3001.choices.build :name => "Jenny"
question3001.save

question3002 = quiz30001.questions.build :name => "Where do The Simpsons live?", :user_id => user30022.id, :selected => true
choice3005 = question3002.choices.build :name => "14 Homer Court"
choice3006 = question3002.choices.build :name => "42 Shelbyville Drive"
choice3007 = question3002.choices.build :name => "891 Wiggum Avenue"
choice3008 = question3002.choices.build :name => "742 Evergreen Terrace", :is_correct => true
question3002.save

question3003 = quiz30001.questions.build :name => "Who runs Moe's?", :user_id => user30022.id, :selected => true
choice3009 = question3003.choices.build :name => "Moe", :is_correct => true
choice30010 = question3003.choices.build :name => "Barney"
choice30011 = question3003.choices.build :name => "Mayor Quimby"
choice30012 = question3003.choices.build :name => "Fat Tony"
question3003.save

question3004 = quiz30001.questions.build :name => "Who is Armin Tamzarian?", :user_id => user30022.id, :selected => true
choice30013 = question3004.choices.build :name => "Superintendent"
choice30014 = question3004.choices.build :name => "Gym Coach"
choice30015 = question3004.choices.build :name => "Principal", :is_correct => true
choice30016 = question3004.choices.build :name => "Teacher"
question3004.save

question3005 = quiz30001.questions.build :name => "How many fingers does each hand have?", :user_id => user30022.id, :selected => true
choice30017 = question3005.choices.build :name => "3"
choice30018 = question3005.choices.build :name => "4", :is_correct => true
choice30019 = question3005.choices.build :name => "5"
choice30020 = question3005.choices.build :name => "6"
question3005.save

question3006 = quiz30001.questions.build :name => "What is Blinky?", :user_id => user30022.id, :selected => true
choice30021 = question3006.choices.build :name => "A fish", :is_correct => true
choice30022 = question3006.choices.build :name => "A cat"
choice30023 = question3006.choices.build :name => "A seal"
choice30024 = question3006.choices.build :name => "An owl"
question3006.save

quiz300022 = Quiz.create!(:name => "Shelbyville",:description => "What are your neighbors up to?", :is_published => false, :passing_grade => 50, :organization_id => org3.id)

quiz300033 = Quiz.create!(:name => "Monorail Safety",:description => "D'oh!", :is_published => false, :passing_grade => 50, :organization_id => org3.id)


# Create some user_quizzes for demo purposes. Fill 10 submissions to quiz1002

user_quiz1 = UserQuiz.create(:quiz_id => 2, :user_id => 4, :num_correct => 3, :total_questions => 5, :status => "Completed")
uqa1 =  Answer.create(:choice_id => 22, :name => "722", :question_id => 6, :quiz_id => 2, :user_id => 4)
uqa2 =  Answer.create(:choice_id => 25, :name => "Cyclones", :question_id => 7, :quiz_id => 2, :user_id => 4)
uqa3 =  Answer.create(:choice_id => 30, :name => "Frederick Olmsted", :question_id => 8, :quiz_id => 2, :user_id => 4)
uqa4 =  Answer.create(:choice_id => 35, :name => "Battery Park City", :question_id => 9, :quiz_id => 2, :user_id => 4)
uqa5 =  Answer.create(:choice_id => 38, :name => "Riverside Park", :question_id => 10, :quiz_id => 2, :user_id => 4)

user_quiz2 = UserQuiz.create(:quiz_id => 2, :user_id => 5, :num_correct => 2, :total_questions => 5, :status => "Completed")
uqa6 =  Answer.create(:choice_id => 24, :name => "672", :question_id => 6, :quiz_id => 2, :user_id => 5)
uqa7 =  Answer.create(:choice_id => 25, :name => "Cyclones", :question_id => 7, :quiz_id => 2, :user_id => 5)
uqa8 =  Answer.create(:choice_id => 30, :name => "Frederick Olmsted", :question_id => 8, :quiz_id => 2, :user_id => 5)
uqa9 =  Answer.create(:choice_id => 35, :name => "Battery Park City", :question_id => 9, :quiz_id => 2, :user_id => 5)
uqa10 =  Answer.create(:choice_id => 38, :name => "Riverside Park", :question_id => 10, :quiz_id => 2, :user_id => 5)

user_quiz3 = UserQuiz.create(:quiz_id => 2, :user_id => 6, :num_correct => 4, :total_questions => 5, :status => "Completed")
uqa11 =  Answer.create(:choice_id => 22, :name => "722", :question_id => 6, :quiz_id => 2, :user_id => 6)
uqa12 =  Answer.create(:choice_id => 25, :name => "Cyclones", :question_id => 7, :quiz_id => 2, :user_id => 6)
uqa13 =  Answer.create(:choice_id => 30, :name => "Frederick Olmsted", :question_id => 8, :quiz_id => 2, :user_id => 6)
uqa14 =  Answer.create(:choice_id => 36, :name => "Hunts Point", :question_id => 9, :quiz_id => 2, :user_id => 6)
uqa15 =  Answer.create(:choice_id => 38, :name => "Riverside Park", :question_id => 10, :quiz_id => 2, :user_id => 6)

user_quiz4 = UserQuiz.create(:quiz_id => 2, :user_id => 7, :num_correct => 0, :total_questions => 5, :status => "Completed")
uqa16 =  Answer.create(:choice_id => 21, :name => "453", :question_id => 6, :quiz_id => 2, :user_id => 7)
uqa17 =  Answer.create(:choice_id => 25, :name => "Cyclones", :question_id => 7, :quiz_id => 2, :user_id => 7)
uqa18 =  Answer.create(:choice_id => 29, :name => "Robert Moses", :question_id => 8, :quiz_id => 2, :user_id => 7)
uqa19 =  Answer.create(:choice_id => 33, :name => "59th Street", :question_id => 9, :quiz_id => 2, :user_id => 7)
uqa20 =  Answer.create(:choice_id => 39, :name => "Central Park", :question_id => 10, :quiz_id => 2, :user_id => 7)

user_quiz5 = UserQuiz.create(:quiz_id => 2, :user_id => 8, :num_correct => 1, :total_questions => 5, :status => "Completed")
uqa21 =  Answer.create(:choice_id => 21, :name => "453", :question_id => 6, :quiz_id => 2, :user_id => 8)
uqa22 =  Answer.create(:choice_id => 25, :name => "Cyclones", :question_id => 7, :quiz_id => 2, :user_id => 8)
uqa23 =  Answer.create(:choice_id => 29, :name => "Robert Moses", :question_id => 8, :quiz_id => 2, :user_id => 8)
uqa24 =  Answer.create(:choice_id => 36, :name => "Hunts Point", :question_id => 9, :quiz_id => 2, :user_id => 8)
uqa25 =  Answer.create(:choice_id => 39, :name => "Central Park", :question_id => 10, :quiz_id => 2, :user_id => 8)

user_quiz6 = UserQuiz.create(:quiz_id => 2, :user_id => 9, :num_correct => 2, :total_questions => 5, :status => "Completed")
uqa26 =  Answer.create(:choice_id => 23, :name => "861", :question_id => 6, :quiz_id => 2, :user_id => 9)
uqa27 =  Answer.create(:choice_id => 25, :name => "Cyclones", :question_id => 7, :quiz_id => 2, :user_id => 9)
uqa28 =  Answer.create(:choice_id => 30, :name => "Frederick Olmsted", :question_id => 8, :quiz_id => 2, :user_id => 9)
uqa29 =  Answer.create(:choice_id => 36, :name => "Hunts Point", :question_id => 9, :quiz_id => 2, :user_id => 9)
uqa30 =  Answer.create(:choice_id => 39, :name => "Central Park", :question_id => 10, :quiz_id => 2, :user_id => 9)

user_quiz7 = UserQuiz.create(:quiz_id => 2, :user_id => 10, :num_correct => 5, :total_questions => 5, :status => "Completed")
uqa31 =  Answer.create(:choice_id => 22, :name => "722", :question_id => 6, :quiz_id => 2, :user_id => 10)
uqa32 =  Answer.create(:choice_id => 26, :name => "Dodgers", :question_id => 7, :quiz_id => 2, :user_id => 10)
uqa33 =  Answer.create(:choice_id => 30, :name => "Frederick Olmsted", :question_id => 8, :quiz_id => 2, :user_id => 10)
uqa34 =  Answer.create(:choice_id => 36, :name => "Hunts Point", :question_id => 9, :quiz_id => 2, :user_id => 10)
uqa35 =  Answer.create(:choice_id => 38, :name => "Riverside Park", :question_id => 10, :quiz_id => 2, :user_id => 10)

user_quiz8 = UserQuiz.create(:quiz_id => 2, :user_id => 11, :num_correct => 4, :total_questions => 5, :status => "Completed")
uqa36 =  Answer.create(:choice_id => 23, :name => "861", :question_id => 6, :quiz_id => 2, :user_id => 11)
uqa37 =  Answer.create(:choice_id => 26, :name => "Dodgers", :question_id => 7, :quiz_id => 2, :user_id => 11)
uqa38 =  Answer.create(:choice_id => 30, :name => "Frederick Olmsted", :question_id => 8, :quiz_id => 2, :user_id => 11)
uqa39 =  Answer.create(:choice_id => 36, :name => "Hunts Point", :question_id => 9, :quiz_id => 2, :user_id => 11)
uqa40 =  Answer.create(:choice_id => 38, :name => "Riverside Park", :question_id => 10, :quiz_id => 2, :user_id => 11)

user_quiz9 = UserQuiz.create(:quiz_id => 2, :user_id => 12, :num_correct => 2, :total_questions => 5, :status => "Completed")
uqa41 =  Answer.create(:choice_id => 24, :name => "672", :question_id => 6, :quiz_id => 2, :user_id => 13)
uqa42 =  Answer.create(:choice_id => 25, :name => "Cyclones", :question_id => 7, :quiz_id => 2, :user_id => 13)
uqa43 =  Answer.create(:choice_id => 30, :name => "Frederick Olmsted", :question_id => 8, :quiz_id => 2, :user_id => 13)
uqa44 =  Answer.create(:choice_id => 35, :name => "Battery Park City", :question_id => 9, :quiz_id => 2, :user_id => 13)
uqa45 =  Answer.create(:choice_id => 38, :name => "Riverside Park", :question_id => 10, :quiz_id => 2, :user_id => 13)

user_quiz10 = UserQuiz.create(:quiz_id => 2, :user_id => 13, :num_correct => 3, :total_questions => 5, :status => "Completed")
uqa46 =  Answer.create(:choice_id => 22, :name => "722", :question_id => 6, :quiz_id => 2, :user_id => 13)
uqa47 =  Answer.create(:choice_id => 25, :name => "Cyclones", :question_id => 7, :quiz_id => 2, :user_id => 13)
uqa48 =  Answer.create(:choice_id => 30, :name => "Frederick Olmsted", :question_id => 8, :quiz_id => 2, :user_id => 13)
uqa49 =  Answer.create(:choice_id => 35, :name => "Battery Park City", :question_id => 9, :quiz_id => 2, :user_id => 13)
uqa50 =  Answer.create(:choice_id => 38, :name => "Riverside Park", :question_id => 10, :quiz_id => 2, :user_id => 13)
