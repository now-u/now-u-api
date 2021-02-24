class Cause < ApplicationRecord
    has_and_belongs_to_many :actions
    has_and_belongs_to_many :learning_resources
    has_and_belongs_to_many :campaigns
end
