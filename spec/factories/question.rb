FactoryGirl.define do 
  factory :question do
    quiz {|a| a.association(:quiz)}
    name "Is the sky blue"
    choices {|a| [a.association(:choice),a.association(:choice)]}
    sequence(:position) {|n| n }
    factory :approved_question do
      selected true
    end
  end
end



