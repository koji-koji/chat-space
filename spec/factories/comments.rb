FactoryGirl.define do

  factory :comment do
    comment           "hoge"
    chatgroup_id      "1"
    user_id           "1"
    image             "hoge.img"
  end

end
