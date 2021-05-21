# frozen_string_literal: true

FactoryBot.define do
  factory :partnership do
    campaign_id { create(:campaign).id }
    organisation_id { create(:organisation).id }
    type { Faker::Marketing.buzzwords }
  end
end