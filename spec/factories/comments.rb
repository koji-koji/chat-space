FactoryGirl.define do

  factory :comment do
    comment            { Faker::Lorem.sentence}
    chatgroup_id      "1"
    user_id           "1"
    image              { File.open("#{Rails.root}/test/fixtures/files/test.jpg") }
  end

end
