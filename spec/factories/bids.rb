FactoryGirl.define do
  factory :bid do
    association :auction, factory: :auction
    amount 5
  end

end
