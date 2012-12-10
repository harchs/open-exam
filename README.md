
OpenExam.org 

[OpenExam](www.openexam.org) is quiz software built on Ruby on Rails with a focus on student/ teacher collaboration. 

#Organization support
OpenExam supports unique organizations with subdomain support. Each organization is given its own subdomain and is siloed off from other organizations. For example, test.openexam.org is a completely separate instance of the application from class1.openexam.org.

When testing your data on local host, do not use `localhost:3000` or `test.localhost:3000` (as local host does not support subdomains). Instead use `lvh.me:3000` or `test.lvh.me:3000`.

#OpenExam workflow
OpenExam workflow is separated into admin and students. Each organization has at least one admin who has the ability to create quizzes. Once a quiz is created, students within that organization can submit their own questions for the quiz. The admin can approve or reject each question before publishing the quiz for the organization members to take. 

The admin(s) also have the ability to see full stats for each student and each quiz. 

#Installation

Once you clone the repository, run `ruby script/bootstrap.rb` to get clean database with test data. 