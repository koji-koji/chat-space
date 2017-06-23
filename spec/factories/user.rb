FactoryGirl.define do

  factory :user do
    email              {Faker::Internet.email}
    name               {Faker::Name.name }
    pass = Faker::Internet.password
    password                  {pass}
    password_confirmation     {pass}
  end

end
