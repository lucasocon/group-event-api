FactoryBot.define do
  factory :group_event, class: GroupEvent do
    name Faker::Name.name

    trait :delete do
      deleted_at { Time.zone.now }
    end
  end

  factory :simple_group_event, parent: :group_event do
  end

  factory :full_group_event, parent: :group_event do
    description { Faker::Lorem.sentence }
    number_days { Faker::Number.digit }
    location { Faker::Address.city }
    start_date { Time.zone.now }
    end_date { Time.zone.now + 2.hours }
    published { false }
  end
end
