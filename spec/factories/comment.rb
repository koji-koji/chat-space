FactoryGirl.define do

  factory :comment do
    comment            { Faker::Lorem.sentence }
    chatgroup_id       { 1 }
    user_id            { 1 }
    image              { File.open("#{Rails.root}/test/fixtures/files/test.jpg") }
    created_at         Faker::Time.between(DateTime.now - 10, DateTime.now - 5)
    updated_at         Faker::Time.between(DateTime.now - 4, DateTime.now)
    association :chatgroup
    association :user
  end

end
