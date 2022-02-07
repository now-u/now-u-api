# frozen_string_literal: true

class UserCause < ApplicationRecord
  belongs_to :user
  belongs_to :cause
end
  