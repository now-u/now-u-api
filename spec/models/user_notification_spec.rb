# frozen_string_literal: true

require 'rails_helper'

describe UserNotification do
  subject { create(:user_notification) }

  it { should belong_to(:user) }
  it { should belong_to(:notification) }
end
