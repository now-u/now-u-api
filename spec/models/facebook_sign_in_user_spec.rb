# frozen_string_literal: true

require "rails_helper"

describe FacebookUser do
  describe ".load_from_session" do
    it "returns the facebook user when the user has signed in and has been recently active" do
      session = { "facebook_user" => { "last_active_at" => Time.zone.now } }

      user = FacebookUser.load_from_session(session)

      expect(user).not_to be_nil
    end

    it "returns nil when the user has not signed in" do
      session = { "facebook_user" => nil }

      user = FacebookUser.load_from_session(session)

      expect(user).to be_nil
    end
  end
end
