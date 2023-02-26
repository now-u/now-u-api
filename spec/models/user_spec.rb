# frozen_string_literal: true

require 'rails_helper'

RSpec.describe User, type: :model do
  describe "associations" do
    describe "user causes" do
      let!(:user) { create(:user, :with_causes)}

      it "has causes attached to the user" do
        expect(user.causes).to_not be_empty
        expect(user.causes.length).to eq 5
      end
    end
  end
end
