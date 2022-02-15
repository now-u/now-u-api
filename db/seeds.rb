# frozen_string_literal: true

require 'database_cleaner'

DatabaseCleaner.clean_with(:truncation)

FactoryBot.create_list(:cause, 5)
FactoryBot.create_list(:campaign, 5)
FactoryBot.create_list(:campaign_action, 5)
FactoryBot.create_list(:user_action, 5)
FactoryBot.create_list(:user, 5)
FactoryBot.create_list(:user_learning_resource, 5)
FactoryBot.create_list(:user_cause, 5)

puts "Seeding finished."
