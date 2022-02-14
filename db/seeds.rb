# frozen_string_literal: true

require 'database_cleaner'

DatabaseCleaner.clean_with(:truncation)

FactoryBot.create_list(:article, 5)
FactoryBot.create_list(:blog_article, 5)
FactoryBot.create_list(:cause, 5)
FactoryBot.create_list(:campaign, 5)
FactoryBot.create_list(:campaign_action, 5, :with_cause_action)
FactoryBot.create_list(:goal, 5)
FactoryBot.create_list(:image_section, 5)
FactoryBot.create_list(:organisation, 5)
FactoryBot.create_list(:press_coverage_article, 5)
FactoryBot.create_list(:partnership, 5)
FactoryBot.create_list(:text_section, 5)
FactoryBot.create_list(:user_action, 5)
FactoryBot.create_list(:user, 5)
FactoryBot.create_list(:user_learning_resource, 5)
FactoryBot.create_list(:user_cause, 5)

puts "Seeding finished."
