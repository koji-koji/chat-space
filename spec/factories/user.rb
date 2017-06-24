FactoryGirl.define do

  factory :user do
    pass = Faker::Internet.password
    email              { Faker::Internet.email }
    name               { Faker::Name.name }
    password           pass
    password_confirmation  pass
    created_at         { Faker::Time.between(10.days.ago, 6.days.ago, :day)}
    updated_at         { Faker::Time.between(5.days.ago , 2.days.ago, :day)}
  end
end
