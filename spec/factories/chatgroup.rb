FactoryGirl.define do

  factory :chatgroup do
    group_name         {Faker::StarWars.droid}
    created_at         {Faker::Time.between(2.days.ago, Date.today, :midnight)}
    updated_at         {Faker::Time.between(2.days.ago, Date.today, :midnight)}
  end

end
