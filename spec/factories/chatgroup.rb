FactoryGirl.define do

  factory :chatgroup do
    group_name         {Faker::Company.name}
    created_at         Faker::Time.between(10.days.ago, 6.days.ago, :day)
    updated_at         Faker::Time.between(5.days.ago , 2.days.ago, :day)
  end

end
