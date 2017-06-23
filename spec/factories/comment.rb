FactoryGirl.define do

  factory :comment do
    comment            { Faker::Lorem.sentence }
    chatgroup_id       { 1 }
    user_id            { 1 }
    image              { File.open("#{Rails.root}/test/fixtures/files/test.jpg") }
    created_at         Faker::Time.between(10.days.ago, 6.days.ago, :day)
    updated_at         Faker::Time.between(5.days.ago , 2.days.ago, :day)
    association :chatgroup
    association :user
  end

end
