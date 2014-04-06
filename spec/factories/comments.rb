FactoryGirl.define do
  factory :comment do
    sequence(:content) { |n| "Comment number #{n}" }
  end
end
