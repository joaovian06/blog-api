FactoryBot.define do
    factory :article do
        title { Faker::Lorem.characters(number: 50) }
        body { Faker::Lorem.paragraph }
        author { Faker::Name.name }

        trait :invalid do
            title { nil }
            body { nil }
            author { nil }
        end
    end
end