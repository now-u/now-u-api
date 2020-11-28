# frozen_string_literal: true

class Organisation < ApplicationRecord
  has_many :partnerships
  has_many :users
  has_many :campaigns, through: :partnerships
  before_create :set_code
  validates_uniqueness_of :code

  def set_code
    self.code ||= generate_code
  end

  private

  # https://stackoverflow.com/questions/88311/how-to-generate-a-random-string-in-ruby
  def generate_code
    ('A'..'Z').to_a.sample(8).join
  end
end
