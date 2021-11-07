FactoryBot.define do
  factory :developer do
    name { Faker::FunnyName.name }
    role { 'frontend dev' }
  end
end
