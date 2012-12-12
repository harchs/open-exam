FactoryGirl.define do 
  factory :question do
    name "Is the sky blue"
    description "A hard question"
    choices [choice,choice]
  end  
end

