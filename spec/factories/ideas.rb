FactoryBot.define do
  factory :idea do
    association :category
    body { "サンプルアイデア"}
  end
end