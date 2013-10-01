FactoryGirl.define do
  factory :post do
    sequence(:content) { |n| "Post number #{n}" }
  end
end

