FactoryGirl.define do
  factory :auction do
    title "Test Auction"
    body "Test description"
    reserve "100"
    current_price 10
    end_time Date.tomorrow
  end

end
