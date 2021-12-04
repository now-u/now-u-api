# frozen_string_literal: true

require 'database_cleaner'

DatabaseCleaner.clean_with(:truncation)

FactoryBot.create_list(:cause, 10)
FactoryBot.create_list(:campaign, 10)
FactoryBot.create_list(:goal, 10)
FactoryBot.create_list(:campaign_action, 10)
FactoryBot.create_list(:user_action, 10)
FactoryBot.create_list(:article, 10)
FactoryBot.create_list(:press_coverage_article, 10)
FactoryBot.create_list(:image_section, 10)
FactoryBot.create_list(:text_section, 10)
FactoryBot.create_list(:organisation, 10)
FactoryBot.create_list(:partnership, 10)
FactoryBot.create_list(:blog_article, 10)
FactoryBot.create_list(:user, 10)

puts "Seeding finished."
