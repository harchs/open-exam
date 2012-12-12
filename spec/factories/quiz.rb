FactoryGirl.define do 
  factory :quiz do
    name "Quiz"
    description "A hard quiz"
    organization_id 1
    passing_grade 80
  end  
end