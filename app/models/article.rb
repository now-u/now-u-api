class Article < ApplicationRecord
  belongs_to :campaign
  belongs_to :action
end