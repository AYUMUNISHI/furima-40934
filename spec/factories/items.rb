FactoryBot.define do
  factory :item do
    association :user
    transient do
      person {Gimei.name}
    end
    image                 {}
    product               {Faker::Name.initials(number: 5)}
    description           {Faker::Lorem.sentence}
    category_id           {2}
    status_id             {2}
    freight_id            {2}
    prefecture_id         {2}
    shipping_date_id      {2}
    price                 {5555}

    after(:build) do |item|
      item.image.attach(io: File.open('public/images/test.png'), filename: 'test.png')
    end
  end
end
