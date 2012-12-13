FactoryGirl.define do 
  factory :quiz do
    name "Quiz"
    description "A hard quiz"
    organization_id 1
    passing_grade 80

    factory :quiz_with_approved do
      questions {|a| [a.association(:approved_question),a.association(:approved_question)]}
    end
  end
end  
