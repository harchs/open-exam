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

quiz1002 = Quiz.create!(:name => "-New York City Attractions",:description => "Where is it in the big apple?", :is_published => true, :passing_grade => 50, :organization_id => org1.id)

question1006 = quiz1002.questions.build :name => "Where is the Columbus Circle?", :user_id => user10022.id, :selected => true
choice10021 = question1006.choices.build :name => "42nd Street"
choice10022 = question1006.choices.build :name => "59th Street", :is_correct => true
choice10023 = question1006.choices.build :name => "72nd Street"
choice10024 = question1006.choices.build :name => "Wall Street"
question1006.save

question1007 = quiz1002.questions.build :name => "Where is Union Square?", :user_id => user10022.id, :selected => true
choice10025 = question1007.choices.build :name => "72nd Street"
choice10026 = question1007.choices.build :name => "14th Street", :is_correct => true
choice10027 = question1007.choices.build :name => "Wall Street"
choice10028 = question1007.choices.build :name => "125th Street"
question1007.save

question1008 = quiz1002.questions.build :name => "Where is Central Park?", :user_id => user10022.id, :selected => true
choice10029 = question1008.choices.build :name => "42nd Street"
choice10030 = question1008.choices.build :name => "Above 60th Street", :is_correct => true
choice10031 = question1008.choices.build :name => "Below Houston"
choice10032 = question1008.choices.build :name => "Between Broadway and the Hudson River"
question1008.save

question1009 = quiz1002.questions.build :name => "Where is South St Seaport?", :user_id => user10022.id, :selected => true
choice10033 = question1009.choices.build :name => "59th Street"
choice10034 = question1009.choices.build :name => "72nd Street"
choice10035 = question1009.choices.build :name => "42nd Street"
choice10036 = question1009.choices.build :name => "Fulton St", :is_correct => true
question1009.save

question10010 = quiz1002.questions.build :name => "Where is Times Square?", :user_id => user10022.id, :selected => true
choice10037 = question10010.choices.build :name => "59th Street"
choice10038 = question10010.choices.build :name => "42nd Street", :is_correct => true
choice10039 = question10010.choices.build :name => "Wall Street"
choice10040 = question10010.choices.build :name => "72nd Street"
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























