FactoryGirl.define do 
  factory :choice do
    sequence(:name) { |n| "blue#{n}" }
  end  
end